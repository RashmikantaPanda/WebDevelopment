package org.oupp.hospital.controller.appointment;

import org.oupp.hospital.dao.AppointmentDao;
import org.oupp.hospital.model.Appointment;
import org.oupp.hospital.model.Patient;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/patient/status")
public class PatientAppointmentStatus extends HttpServlet {
    AppointmentDao appointmentDao;
    public void init(){
         appointmentDao=new AppointmentDao();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session=request.getSession(false);
        if((session.getAttribute("loggedIn")==null)){
            session.setAttribute("failMsg","Login to See Appointments");
            response.sendRedirect("../patient_login.jsp");
        }
        else{
            Patient patient=(Patient) session.getAttribute("loggedInPatient");
            List<Appointment> patientAppointments=appointmentDao.getAppointmentsByEmailOrId(patient.getId());
            session.setAttribute("patientAppointments",patientAppointments);
            response.sendRedirect("../patient_appointments.jsp");   /*It will change the url to .../patient_appointments.jsp    */
//            request.getRequestDispatcher("../patient_appointments.jsp").forward(request, response);  /*But here, .../patient/status  */
//            /*Problem is arising in the url after clicking any hyperlink in the patient_appointment.jsp page*/

        }
    }
}
