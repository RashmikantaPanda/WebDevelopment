package org.oupp.hospital.controller.appointment;

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

@WebServlet("/update/action")
public class UpdateAppointment extends HttpServlet {
    AppointmentDao appointmentDao;

    @Override
    public void init() throws ServletException {
        appointmentDao=new AppointmentDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session=request.getSession(false);
        if((session.getAttribute("loggedInD")==null)){
            session.setAttribute("failMsg","Login update details");
            response.sendRedirect("../doctor_login.jsp");
        }
        else{
            int appointmentId=Integer.parseInt(request.getParameter("appointmentId"));
            String remark=request.getParameter("remark");
            if(appointmentDao.updateAppointmentById(appointmentId,remark)){
                session.setAttribute("updateMsgD","Status Updated");
                session.setAttribute("updateMsgP","Status Updated");
                response.sendRedirect("../doctor/action");
//                response.sendRedirect("../doctor_action.jsp");
            }
            else{
                session.setAttribute("updateMsgD","Status Update Failed");
                response.sendRedirect("../doctor_action.jsp");
            }
//            response.sendRedirect("../doctor_action.jsp");  //Try with pathcontext
        }
    }
}
