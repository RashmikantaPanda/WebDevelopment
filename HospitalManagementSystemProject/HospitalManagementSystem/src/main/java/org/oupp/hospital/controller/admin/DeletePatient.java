package org.oupp.hospital.controller.admin;

import org.oupp.hospital.dao.PatientDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/delete/patient")
public class DeletePatient extends HttpServlet {
    PatientDao patientDao;

    @Override
    public void init() throws ServletException {
        patientDao=new PatientDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("patientId"));
        System.out.println(id);
        if(patientDao.deletePatient(id)){
            System.out.println("Patient Deleted successfully");
            HttpSession session = request.getSession();
            session.setAttribute("succMsgP", "Patient Deleted");
            response.sendRedirect(request.getContextPath()+"/allPatients");
        }
        else{
            System.out.println("Patient deletion failed");
            HttpSession session = request.getSession();
            session.setAttribute("failMsgP", "Patient Deletion Failed");
            response.sendRedirect(request.getContextPath()+"/allPatients");

        }

    }
}
