package org.oupp.hospital.controller.admin;

import org.oupp.hospital.dao.AppointmentDao;
import org.oupp.hospital.model.Appointment;
import org.oupp.hospital.model.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/allAppointments")
public class ViewAllAppointments extends HttpServlet {
    AppointmentDao appointmentDao;

    @Override
    public void init() throws ServletException {
        appointmentDao=new AppointmentDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        if((session.getAttribute("loggedInA")==null)){
            session.setAttribute("failMsg","Login to See Appointments");
            response.sendRedirect("../admin_login.jsp");
        }
        else{
            List<Appointment> allAppointments=appointmentDao.getAllAppointments();
            session.setAttribute("allAppointments",allAppointments);
            response.sendRedirect("admin_allAppointments.jsp");
        }
    }
}
