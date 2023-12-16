package org.oupp.resturant.controller;

import org.oupp.resturant.dao.CustomerDao;
import org.oupp.resturant.dbcon.DbConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.regex.Pattern;

@WebServlet("/signin")
public class SigninController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.equals("")) {
            request.setAttribute("msg", "Username can not be empty");
            RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
            rd.include(request, response);
        }
        else if (password == null || password.equals("")) {
            request.setAttribute("msg", "Password can not be empty");
            RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
            rd.include(request, response);
        } else {
            System.out.println("msg>> Authenticating Username : " + username + "  Password : " + password);
            if (authenticate(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("UserName", username);
                session.setAttribute("loggedin", true);

                String role = customerDao.getRole(username);
                if (!role.equals("admin")) {
                    response.sendRedirect("dashboard.jsp");
                } else {
					response.sendRedirect("admin_dashboard.jsp");
                }
//				RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
//				dispatcher.forward(request, response);


            } else {
//				out.print("Invalid Credentials");
                request.setAttribute("msg", "Invalid Credential");
                RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
                rd.include(request, response);
            }
        }
    }

    private boolean authenticate(String username, String password) {
        try {
            DbConnection connection = new DbConnection();
            String query = "select * from customer_details where customerEmail=? AND customerPassword= ? ;";
            PreparedStatement pst = connection.con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Something went wrong" + Arrays.toString(e.getStackTrace()));
        }
        return false;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
