package org.oupp.hospital.controller.doctor;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/doctorLogout")
public class DoctorLogout extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        System.out.println("Doctor Logged Out successfully !!!");
//        response.sendRedirect("doctor_login.jsp?logoutSuccess=true");
    }
}
