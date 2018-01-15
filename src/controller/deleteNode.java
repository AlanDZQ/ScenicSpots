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


@WebServlet("/deleteNode")
public class deleteNode extends HttpServlet {
    private String driver = "org.apache.derby.jdbc.EmbeddedDriver";//在derby.jar里面
    private String dbName = "/Users/apple/Documents/IdeaProjects/ScenicSpots/SpotsInfo";
    private String dbURL = "jdbc:derby:" + dbName + ";user=root;password=root;create=true";//create=true表示当数据库不存在时就创建它

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dname = request.getParameter("dname");
        try {
            Class.forName(driver);

            Connection conn = DriverManager.getConnection(dbURL);//启动嵌入式数据库

            Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            String str = "DELETE FROM NodeInfo WHERE name = '"+dname +"' ";
            System.out.println(str);
            st.executeUpdate(str);

            str="DELETE FROM EdgeInfo WHERE start = '"+dname +"' OR end1 = '"+ dname+"' ";
            System.out.println(str);
            st.executeUpdate(str);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
