package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datastructure.ALGraph;
import datastructure.ArcNode;
import datastructure.VNode;
import algorithm.BuildGraph;


@WebServlet("/createGraph")
public class InitGraph extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BuildGraph graph = new BuildGraph();
        graph.createGraph();
        //graph.outputGraph();


        String results = toJSONString(graph.getGraph());

        response.setContentType("text/json" + ";charset=UTF-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        PrintWriter pw = response.getWriter();
        pw.write(results);
        pw.flush();
    }

    private String toJSONString(ALGraph graph) {
        String jsonString = "{\"arcNum\":" + graph.getArcNum() + ",\"vetNum\":" + graph.getVetNum()
                + ",\"nodes\":[";
        int flag = 1;
        for (ArcNode node : graph.getNodes()) {
            if (flag == 1) {
                jsonString += "{\"name\":\"" + node.getName() + "\",\"des\":\"" + node.getDes() + "\",\"pop\":"
                        + node.getPop() + ",\"hasRest\":" + node.isHasRest() + ",\"hasToilet\":" + node.isHasToilet()
                        +",\"x\":" + node.getX() +",\"y\":" + node.getY() + ",\"edges\":[";
                flag = 0;
            } else {
                jsonString += ",{\"name\":\"" + node.getName() + "\",\"des\":\"" + node.getDes() + "\",\"pop\":"
                        + node.getPop() + ",\"hasRest\":" + node.isHasRest() + ",\"hasToilet\":" + node.isHasToilet()
                        +",\"x\":" + node.getX() +",\"y\":" + node.getY() + ",\"edges\":[";
            }


            VNode tmp = node.getFirst();
            jsonString += "{\"index\":" + tmp.getIndex() + ",\"dist\":" + tmp.getDist() + ",\"time\":"
                    + tmp.getTime() + "}";
            tmp = tmp.getNext();
            while (tmp != null) {
                jsonString += ",{\"index\":" + tmp.getIndex() + ",\"dist\":" + tmp.getDist() + ",\"time\":"
                        + tmp.getTime() + "}";
                tmp = tmp.getNext();
            }
            jsonString += "]}";
        }
        jsonString += "]}";

        return jsonString;
    }
}
