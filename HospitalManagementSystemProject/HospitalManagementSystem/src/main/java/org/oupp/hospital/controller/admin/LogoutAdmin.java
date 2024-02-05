package org.oupp.hospital.controller.admin;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminLogout")
public class LogoutAdmin extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        System.out.println("Admin Logged Out successfully !!!");
//        response.sendRedirect("admin_login.jsp");   //This part is happening in javascript file
    }
}
