package org.oupp.hospital.controller.appointment;

import org.oupp.hospital.dao.AppointmentDao;
import org.oupp.hospital.model.Appointment;
import org.oupp.hospital.model.Doctor;
import org.oupp.hospital.model.Patient;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/doctor/action")
public class DoctorAppointmentAction extends HttpServlet {
    AppointmentDao appointmentDao;
    public void init(){
        appointmentDao=new AppointmentDao();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session=request.getSession(false);
        if((session.getAttribute("loggedInD")==null)){
            session.setAttribute("failMsg","Login to take actions");
            response.sendRedirect("../doctor_login.jsp");
        }
        else{
            Doctor doctor=(Doctor)session.getAttribute("loggedInDoctor");
            List<Appointment> doctorAppointments=appointmentDao.getAppointmentsByDoctors(doctor);
            session.setAttribute("doctorAppointments",doctorAppointments);
            response.sendRedirect("../doctor_action.jsp");
        }
    }
}
