package org.oupp.hospital.controller.admin;

import org.oupp.hospital.dao.DoctorDao;
import org.oupp.hospital.dao.PatientDao;
import org.oupp.hospital.model.Doctor;
import org.oupp.hospital.model.Patient;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/addPatient")
public class AddNewPatient extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PatientDao patientDao;

    public void init() {
        patientDao = new PatientDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String specialization=request.getParameter("specialization");
        String password=request.getParameter("password");

        Patient patient;
        patient=patientDao.getPatientByEmail(email);
        if(patient!=null){
            HttpSession session = request.getSession();
            session.setAttribute("failMsgP", "EmailId is already registered");
            response.sendRedirect(request.getContextPath()+"/allPatients");
            return;
        }
        patient=new Patient();
        patient.setName(name);
        patient.setEmail(email);
        patient.setPhone(phone);
        patient.setPassword(password);

        if(patientDao.registerPatient(patient)){
            System.out.println("Patient Added successfully");
            HttpSession session = request.getSession();
            session.setAttribute("succMsgP", "Patient Added");
            response.sendRedirect(request.getContextPath()+"/allPatients");
        }
        else{
            System.out.println("Patient registration failed");
            HttpSession session = request.getSession();
            session.setAttribute("failMsgP", "Patient Registration Failed");
            response.sendRedirect(request.getContextPath()+"/allPatients");
        }
    }
}
