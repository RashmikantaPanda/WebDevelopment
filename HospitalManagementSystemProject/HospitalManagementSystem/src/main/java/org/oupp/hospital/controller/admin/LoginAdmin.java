package org.oupp.hospital.controller.admin;

import org.oupp.hospital.dao.AdminDao;
import org.oupp.hospital.model.Admin;
import org.oupp.hospital.model.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/login")
public class LoginAdmin extends HttpServlet {
    AdminDao adminDao;

    @Override
    public void init() throws ServletException {
        adminDao=new AdminDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");

        Admin admin=new Admin();
        admin.setEmail(username);
        admin.setPassword(password);

        if(adminDao.loginAdmin(admin)){
            System.out.println("Admin Logged in Successfully !");
            HttpSession session = request.getSession(true);
            session.setAttribute("loggedInA","true");
            Admin a=adminDao.getAdminByEmailOrId(username);
            if(a!=null){
                session.setAttribute("loggedInAdmin",a);
            }
            response.sendRedirect(request.getContextPath()+"/admin_dashboard.jsp");
        }
        else{
            System.out.println("Admin Login  Failed");
            HttpSession session = request.getSession();
            session.setAttribute("failMsg", "Invalid Credential");
            response.sendRedirect("../admin_login.jsp");
        }

    }
}
