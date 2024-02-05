package org.oupp.hospital.controller.admin;

import org.oupp.hospital.dao.DoctorDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/delete/doctor")
public class DeleteDoctor extends HttpServlet {
    DoctorDao doctorDao;

    @Override
    public void init() throws ServletException {
        doctorDao=new DoctorDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("doctorId"));
        System.out.println(id);
        if(doctorDao.deleteDoctor(id)){
            System.out.println("Doctor Deleted successfully");
            HttpSession session = request.getSession();
            session.setAttribute("succMsgD", "Doctor Deleted");
            response.sendRedirect(request.getContextPath()+"/allDoctors");
        }
        else{
            System.out.println("Doctor deletion failed");
            HttpSession session = request.getSession();
            session.setAttribute("failMsgD", "Doctor Deletion Failed");
            response.sendRedirect(request.getContextPath()+"/allDoctors");

        }

    }
}
