package controller;

import com.alibaba.fastjson.JSON;
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
import java.util.ArrayList;
import java.util.Scanner;
import java.io.FileWriter;
import java.io.BufferedWriter;


@WebServlet("/readNoti")
public class readNoti extends HttpServlet {
    private Scanner reader;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            File file = new File("/Users/apple/Documents/IdeaProjects/ScenicSpots/notification.txt");
            reader = new Scanner(file);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        String tmp, infos[];
        ArrayList<String> time = new ArrayList<>();
        ArrayList<String> noti = new ArrayList<>();
        while (reader.hasNext()) {
            tmp = reader.nextLine();
            infos = tmp.split("//");
            time.add(infos[0]);
            noti.add(infos[1]);
        }

        response.setContentType("text/json" + ";charset=UTF-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        PrintWriter pw = response.getWriter();
        pw.write("{\"time\":" + JSON.toJSONString(time) + ",\"noti\":" + JSON.toJSONString(noti) + "}");
        System.out.println("{\"time\":" + JSON.toJSONString(time) + ",\"noti\":" + JSON.toJSONString(noti) + "}");
        pw.flush();
    }
}
