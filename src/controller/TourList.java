package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import algorithm.BuildGraph;
import com.alibaba.fastjson.JSON;

import algorithm.TourMap;
import algorithm.Traveling;
import datastructure.VNode;
import util.Constants;
import util.Integrated;

/**
 * 根据指定景点名称生成旅游路线图，并判断是否有回路
 */

@WebServlet("/tourList")
public class TourList extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //指定起始点名称
        String startName = request.getParameter("start");
        String endName = request.getParameter("end");

        response.setContentType("text/json" + ";charset=UTF-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        PrintWriter pw = response.getWriter();

        TourMap tourMap = new TourMap(Integrated.getGraph());
        Traveling travelMap = new Traveling(Integrated.getGraph(), Integrated.getGraph().getArcNum());
        //判断是否存在指定的起始点
        if (tourMap.getPos(startName) != -1&&tourMap.getPos(endName) != -1) {
            //若存在，生成旅游路线图和是否有回路
            List<Integer> tourIndexList = tourMap.DFSTraverse(startName,endName);
            //List<String> tourCycle = tourMap.TopoSort();

            int a[][] = new int[20][20];

            for (int i = 0; i <= Integrated.getGraph().getArcNum(); i++) {
                a[0][i] = Constants.INF;
                a[i][0] = Constants.INF;
            }
            for (int i = 1; i <= Integrated.getGraph().getArcNum(); i++) {
                for (int j = 1; j <= Integrated.getGraph().getArcNum(); j++) {
                    if (i == j) {
                        a[i][j] = 0;
                        continue;
                    }
                    int dis = isContact(i - 1, j - 1);
                    a[i][j] = dis;
                }
            }
            travelMap.setN(Integrated.getGraph().getArcNum());
            travelMap.setA(a);
            List<String> tourCycle = travelMap.tsp();
            List<Integer> index = travelMap.getIndexList();
            Boolean haveCycle = travelMap.getBestc()==Constants.INF;
            pw.write("{\"tourList\":" + JSON.toJSONString(tourIndexList) + ",\"tourCycle\":" + JSON.toJSONString(tourCycle) + ",\"index\":" + JSON.toJSONString(index)
                    + ",\"bestCost\":" + travelMap.getBestc() + ",\"time\":" + travelMap.getTime() + "}");
        } else {
            //若不存在，返回空数组
            pw.write("{\"tourList\":[], \"tourCycle\":[]}");
        }
        pw.flush();
    }

    public int isContact(int fromIndex, int toIndex) {
        int dis = Constants.INF;
        VNode t = Integrated.getGraph().getNodes().get(fromIndex).getFirst();
        while (t != null) {
            if (t.getIndex() == toIndex) {
                return t.getDist();
            }
            t = t.getNext();
        }
        return dis;
    }

}
