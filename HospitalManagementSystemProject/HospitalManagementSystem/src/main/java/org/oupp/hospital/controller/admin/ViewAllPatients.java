package org.oupp.hospital.controller.admin;

import org.oupp.hospital.dao.DoctorDao;
import org.oupp.hospital.dao.PatientDao;
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

@WebServlet("/allPatients")
public class ViewAllPatients extends HttpServlet {
    PatientDao patientDao;

    @Override
    public void init() throws ServletException {
        patientDao=new PatientDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session=request.getSession(false);
        if((session.getAttribute("loggedInA")==null)){
            session.setAttribute("failMsg","Login to See Patients");
            response.sendRedirect("../admin_login.jsp");
        }
        else{
            List<Patient> allPatients=patientDao.getAllPatients();
            session.setAttribute("allPatients",allPatients);
            response.sendRedirect("admin_allPatients.jsp");
        }
    }
}
