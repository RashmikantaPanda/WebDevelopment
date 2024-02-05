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

@WebServlet("/admin/patient/edit")
public class EditPatient  extends HttpServlet {
    PatientDao patientDao;

    @Override
    public void init() throws ServletException {
        patientDao=new PatientDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String password=request.getParameter("password");

        Patient patient=new Patient();
        patient.setId(id);
        patient.setName(name);
        patient.setEmail(email);
        patient.setPhone(phone);
        patient.setPassword(password);

        if(patientDao.updatePatient(patient)){
            System.out.println("Patient updated successfully");
            HttpSession session = request.getSession();
            session.setAttribute("succMsgP", "Patient Record Updated");
            response.sendRedirect(request.getContextPath()+"/allPatients");

        }else{
            System.out.println("Patient Update failed");
            HttpSession session = request.getSession();
            session.setAttribute("failMsgP", "Patient Update Failed");
            response.sendRedirect(request.getContextPath()+"/allPatients");

        }

    }
}
