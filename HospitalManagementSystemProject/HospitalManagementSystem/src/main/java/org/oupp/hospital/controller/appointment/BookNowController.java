package org.oupp.hospital.controller.appointment;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/patient/booknow")
public class BookNowController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session=request.getSession(false);
        if((session.getAttribute("loggedIn")==null)){
            session.setAttribute("failMsg","Login to Book Appointment");
            response.sendRedirect("../patient_login.jsp");
        }
        else{
            response.sendRedirect("../book_appointment.jsp");
        }
    }
}
