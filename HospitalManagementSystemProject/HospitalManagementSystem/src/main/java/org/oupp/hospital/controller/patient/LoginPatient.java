package org.oupp.hospital.controller.patient;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import org.oupp.hospital.dao.PatientDao;
import org.oupp.hospital.model.Patient;

@WebServlet("/patient/login")
public class LoginPatient extends HttpServlet  {
    private static final long serialVersionUID = 1L;
    private PatientDao patientDao;

    public void init() {
        patientDao = new PatientDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");

        Patient patient=new Patient();
        patient.setEmail(email);
        patient.setPassword(password);
        if(patientDao.loginPatient(patient)){
            System.out.println("Patient Logged in Successfully !");
            HttpSession session = request.getSession(true);
            session.setAttribute("loggedIn","true");
            session.setAttribute("succMsg", "Login Success");
            Patient p=patientDao.getPatientByEmail(email);
            if(p!=null){
                session.setAttribute("loggedInPatient",p);
            }
            response.sendRedirect(request.getContextPath()+"/patient_dashboard.jsp");
        }
        else{
            System.out.println("Patient Login  Failed");
            HttpSession session = request.getSession();
            session.setAttribute("failMsg", "Invalid Credential");
            response.sendRedirect("../patient_login.jsp");
        }
    }
}
