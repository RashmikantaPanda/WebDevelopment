package org.oupp.hospital.controller.doctor;

import org.oupp.hospital.dao.DoctorDao;
import org.oupp.hospital.model.Doctor;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/doctor/register")
public class RegisterDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DoctorDao doctorDao;

    public void init() {
        doctorDao = new DoctorDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String specialization=request.getParameter("specialization");
        String password=request.getParameter("password");

        Doctor doctor;
        doctor=doctorDao.getDoctorByEmail(email);
        if(doctor!=null){
            HttpSession session = request.getSession();
            session.setAttribute("failMsg", "EmailId is already registered");
            response.sendRedirect(request.getContextPath()+"/patient_registration.jsp");
            return;
        }
        doctor=new Doctor();
        doctor.setName(name);
        doctor.setEmail(email);
        doctor.setPhone(phone);
        doctor.setSpecialization(specialization);
        doctor.setPassword(password);

        if(doctorDao.registerDoctor(doctor)){
            System.out.println("Doctor registered successfully");
            HttpSession session = request.getSession();
            session.setAttribute("succMsg", "Doctor Added");
            response.sendRedirect(request.getContextPath()+"/doctor_registration.jsp");
        }
        else{
            System.out.println("Doctor registration failed");
            HttpSession session = request.getSession();
            session.setAttribute("failMsg", "Doctor Registration Failed");
            response.sendRedirect(request.getContextPath()+"/doctor_registration.jsp");
        }
    }
}
