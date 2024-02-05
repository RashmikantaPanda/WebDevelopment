package org.oupp.hospital.controller.patient;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        System.out.println("Patient Logged Out successfully !!!");
//        response.sendRedirect("patient_login.jsp?logoutSuccess=true");
    }
}

