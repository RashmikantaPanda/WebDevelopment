package org.oupp.resturant.controller;

import org.oupp.resturant.dao.CustomerDao;
import org.oupp.resturant.model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/signup")
public class SignupController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("reapeat_password");
        if (username.isEmpty()) {
            request.setAttribute("msg", "Username can not be empty");
            RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
            rd.include(request, response);
        } else if (!Pattern.matches("[a-zA-z]+", username)) {
            request.setAttribute("msg", "Username should contain only alphabets");
            RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
            rd.include(request, response);
        } else if (email == null || email.isEmpty()) {
            request.setAttribute("msg", "Email can not be empty");
            RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
            rd.include(request, response);
        } else if (password == null || password.isEmpty()) {
            request.setAttribute("msg", "Password can not be empty");
            RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
            rd.include(request, response);
        } else if (!password.equals(repeatPassword)) {
            /* out.println("Invalid Credential"); */
            request.setAttribute("msg", "Password and repeat password not matched");
            RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
            rd.include(request, response);
        } else {
            Customer customer = new Customer();
            customer.setCustomerName(username);
            customer.setCustomerEmail(email);
            customer.setCustomerPassword(password);

            try {
                if (customerDao.registerCustomer(customer)) {
                    System.out.println(customer);
//					response.sendRedirect("signin.jsp");
                    RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
                    request.setAttribute("msg", "<p class='text-success text-center fw-bold'>Registration Successful</p>");
                    rd.forward(request, response);

                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
                    rd.include(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

}
