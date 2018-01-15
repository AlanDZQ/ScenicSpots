package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 根据指定起始点名称和终点名称生成最短路径和最短距离
 */

@WebServlet("/login")
public class Login extends HttpServlet {
    private Scanner reader;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //user name
        String userName = request.getParameter("userName");
        //password
        String passWord = request.getParameter("passWord");

        try {
            File file = new File("/Users/apple/Documents/IdeaProjects/ScenicSpots/user.txt");
            reader = new Scanner(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        String realName = reader.nextLine();
        String realWord = reader.nextLine();
        // judge if this user is a administrator
        boolean admin = realName.equals(userName) && realWord.equals(passWord);

        response.setContentType("text/json" + ";charset=UTF-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        PrintWriter pw = response.getWriter();
        pw.write("{\"admin\":" + admin + ",\"userName\":" + userName + "}");
        System.out.println("username: " + userName + " passWord: " + passWord + " realName: " + realName + " realWord: " + realWord + "// " + admin);
        pw.flush();
    }
}
