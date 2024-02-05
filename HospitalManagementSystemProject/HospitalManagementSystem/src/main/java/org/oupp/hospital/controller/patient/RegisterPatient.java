package org.oupp.hospital.controller.patient;


import org.oupp.hospital.dao.PatientDao;
import org.oupp.hospital.model.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/patient/register")
public class RegisterPatient extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PatientDao patientDao;

    public void init() {
        patientDao = new PatientDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String password=request.getParameter("password");
        String confirmPassword=request.getParameter("confirmPassword");

        /*Password and confirm password should be same*/
        if(!password.equals(confirmPassword)){
            System.out.println("Password and Confirm Password are not same");
            HttpSession session = request.getSession();
            session.setAttribute("failMsg", "Password and confirm password should be same");
            response.sendRedirect(request.getContextPath() + "/patient_registration.jsp");
        }

        Patient patient;
        /*Validation */
        patient=patientDao.getPatientByEmail(email);
        System.out.println(patient);
        if(patient!=null){
            HttpSession session = request.getSession();
            session.setAttribute("failMsg", "EmailId is already registered");
            response.sendRedirect(request.getContextPath()+"/patient_registration.jsp");
            return;
        }
        else {
            patient = new Patient();
            patient.setName(name);
            patient.setEmail(email);
            patient.setPhone(phone);
            patient.setPassword(password);

            if (patientDao.registerPatient(patient)) {
                System.out.println("Patient Registered Successfully");
                HttpSession session = request.getSession();
                session.setAttribute("succMsg", "Registration Success");
                response.sendRedirect(request.getContextPath() + "/patient_login.jsp");
            } else {
                System.out.println("Patient Registration Failed");
                HttpSession session = request.getSession();
                session.setAttribute("failMsg", "Registration Failed");
                response.sendRedirect(request.getContextPath() + "/patient_registration.jsp");
            }
        }
    }
}
