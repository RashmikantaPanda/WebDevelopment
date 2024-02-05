package org.oupp.hospital.controller.admin;

import org.oupp.hospital.dao.DoctorDao;
import org.oupp.hospital.model.Appointment;
import org.oupp.hospital.model.Doctor;
import org.oupp.hospital.model.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/allDoctors")
public class ViewAllDoctors extends HttpServlet {
    DoctorDao doctorDao;

    @Override
    public void init() throws ServletException {
        doctorDao=new DoctorDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session=request.getSession(false);
        if((session.getAttribute("loggedInA")==null)){
            session.setAttribute("failMsg","Login to See Doctors");
            response.sendRedirect(request.getContextPath()+"/admin_login.jsp");
        }
        else{
            List<Doctor> allDoctors=doctorDao.getAllDoctors();
            session.setAttribute("allDoctors",allDoctors);
            response.sendRedirect("admin_allDoctors.jsp");
        }
    }
}
