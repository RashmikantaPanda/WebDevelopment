package org.oupp.resturant.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/bookATable")
public class BookATablePageController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        System.out.println(session.isNew()+ " "+session.getId()+" "+session.getAttribute("UserName")+" "+session.getAttribute("loggedin"));

        if (session.getAttribute("loggedin") == null) {
            System.out.println("msg>> First Login to book a table");
            RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
            dispatcher.forward(request, response);

        }
        else if(session.getAttribute("loggedin").equals(true)) {
            System.out.println("msg>>Forwarding to booking table ");
            RequestDispatcher dispatcher = request.getRequestDispatcher("booktable.jsp");
            dispatcher.forward(request, response);
        }
        else{
            System.out.println("msg>>Something went wrong");
        }
    }
}
