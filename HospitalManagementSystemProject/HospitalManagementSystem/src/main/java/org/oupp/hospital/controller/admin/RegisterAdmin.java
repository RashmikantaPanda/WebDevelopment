package org.oupp.hospital.controller.admin;

import org.oupp.hospital.dao.AdminDao;
import org.oupp.hospital.model.Admin;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/register")
public class RegisterAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AdminDao adminDao;

    public void init() {
        adminDao = new AdminDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String password=request.getParameter("password");

        Admin admin;
        /*Validation */
        admin=adminDao.getAdminByEmailOrId(email);
        if(admin!=null){
            System.out.println("EmailId is already registered");
            HttpSession session = request.getSession();
            session.setAttribute("failMsg", "EmailId is already registered");
            response.sendRedirect(request.getContextPath()+"/admin_registration.jsp");
        }
        else {
            admin = new Admin();
            admin.setName(name);
            admin.setEmail(email);
            admin.setPassword(password);
            if (adminDao.registerAdmin(admin)) {
                System.out.println("Admin Registered Successfully");
                HttpSession session = request.getSession();
                session.setAttribute("succMsg", "Admin Registration Success");
                response.sendRedirect(request.getContextPath() + "/admin_registration.jsp");
            } else {
                System.out.println("Admin Registration Failed");
                HttpSession session = request.getSession();
                session.setAttribute("failMsg", "Admin Registration Failed");
                response.sendRedirect(request.getContextPath() + "/admin_registration.jsp");
            }
        }
    }
}
