package controller;

import util.Integrated;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Scanner;
import java.io.FileWriter;
import java.io.BufferedWriter;


@WebServlet("/addNode")
public class addNode extends HttpServlet {
    private String driver = "org.apache.derby.jdbc.EmbeddedDriver";//在derby.jar里面
    private String dbName = "/Users/apple/Documents/IdeaProjects/ScenicSpots/SpotsInfo";
    private String dbURL = "jdbc:derby:" + dbName + ";user=root;password=root;create=true";//create=true表示当数据库不存在时就创建它

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String des = request.getParameter("des");
        int pop = Integer.parseInt(request.getParameter("pop"));
        int hasRest = Integer.parseInt(request.getParameter("hasRest"));
        int hasToilet = Integer.parseInt(request.getParameter("hasToilet"));
        int x = Integer.parseInt(request.getParameter("x"));
        int y = Integer.parseInt(request.getParameter("y"));

        try {
            Class.forName(driver);

            Connection conn = DriverManager.getConnection(dbURL);//启动嵌入式数据库

            Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            String str = "insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) " +
                    "values ('" + name + "','" + des + "'," + pop + "," + hasRest + "," + hasToilet + "," + x + "," + y + ")";
            System.out.println(str);
            st.executeUpdate(str);//插入一条数据

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        String end = request.getParameter("end1");
        int weight = Integer.parseInt(request.getParameter("weight1"));
        int time = Integer.parseInt(request.getParameter("time1"));
        try {

            Class.forName(driver);

            Connection conn = DriverManager.getConnection(dbURL);//启动嵌入式数据库

            Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            String str = "insert into EdgeInfo(start,end1,weight,time) " +
                    "values ('" + name + "','" + end + "'," + weight + "," + time+ ")";
            System.out.println(str);
            st.executeUpdate(str);//插入一条数据

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
