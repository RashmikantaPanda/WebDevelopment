package org.oupp.hospital.controller.admin;

import org.oupp.hospital.dao.DoctorDao;
import org.oupp.hospital.model.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet("/doctor/edit")
public class EditDoctor  extends HttpServlet {
    DoctorDao doctorDao;

    @Override
    public void init() throws ServletException {
        doctorDao=new DoctorDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Doctor doctor;
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String specialization=request.getParameter("specialization");
        String password=request.getParameter("password");

        /*Validate duplicate email*/
        doctor=doctorDao.getDoctorByEmail(email);
        if(doctor != null && (!Objects.equals(doctor.getEmail(), email))){
            System.out.println("Doctor Update failed");
            HttpSession session = request.getSession();
            session.setAttribute("failMsgD", "Duplicate email found, Doctor Update Failed");
            response.sendRedirect(request.getContextPath()+"/allDoctors");
        }
        else {
            doctor = new Doctor();
            doctor.setId(id);
            doctor.setName(name);
            doctor.setEmail(email);
            doctor.setPhone(phone);
            doctor.setSpecialization(specialization);
            doctor.setPassword(password);

            if (doctorDao.updateDoctor(doctor)) {
                System.out.println("Doctor updated successfully");
                HttpSession session = request.getSession();
                session.setAttribute("succMsgD", "Doctor Record Updated");
                response.sendRedirect(request.getContextPath() + "/allDoctors");

            } else {
                System.out.println("Doctor Update failed !");
                HttpSession session = request.getSession();
                session.setAttribute("failMsgD", "Doctor Update Failed");
                response.sendRedirect(request.getContextPath() + "/allDoctors");

            }
        }

    }
}
