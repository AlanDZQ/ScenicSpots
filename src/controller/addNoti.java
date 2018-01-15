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


@WebServlet("/addNoti")
public class addNoti extends HttpServlet {
    private FileWriter fw;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String time = request.getParameter("time");
        String noti = request.getParameter("noti");
        System.out.println("notification: " + time + "//" + noti);
        try {
            fw = new FileWriter("/Users/apple/Documents/IdeaProjects/ScenicSpots/notification.txt", true);
            fw.write(time + "//" + noti + "\n");
            fw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
