package org.oupp.hospital.controller.doctor;

import org.oupp.hospital.dao.DoctorDao;
import org.oupp.hospital.model.Doctor;
import org.oupp.hospital.model.Patient;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/doctor/login")
public class LoginDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DoctorDao doctorDao;

    public void init() {
        doctorDao = new DoctorDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        Doctor doctor=new Doctor();
        doctor.setEmail(email);
        doctor.setPassword(password);

        if(doctorDao.loginDoctor(doctor)){
            System.out.println("Doctor logged in successfully");
            HttpSession session = request.getSession(true);
            session.setAttribute("loggedInD","true");
            session.setAttribute("succMsg", "Doctor Login Success");
            Doctor d=doctorDao.getDoctorByEmail(email);
            if(d!=null){
                session.setAttribute("loggedInDoctor",d);
            }
            response.sendRedirect(request.getContextPath()+"/doctor_dashboard.jsp");
        }
        else{
            System.out.println("Doctor login failed, something went wrong ");
            HttpSession session = request.getSession();
            session.setAttribute("failMsg", "Invalid Credential");
            response.sendRedirect("../doctor_login.jsp");
        }
    }
}
