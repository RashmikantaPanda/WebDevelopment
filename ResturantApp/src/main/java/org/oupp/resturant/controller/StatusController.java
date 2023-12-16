package org.oupp.resturant.controller;

import org.oupp.resturant.dao.TableBookingDao;
import org.oupp.resturant.model.TableBooking;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/status")
public class StatusController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private TableBookingDao tableBookingDao;

    public void init() {
        tableBookingDao = new TableBookingDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("loggedin").equals(true)) {
            String email = (String) session.getAttribute("UserName");
            int custId = tableBookingDao.getIdByUserEmail(email);
            List<TableBooking> bookingList = tableBookingDao.getBookingDetails(custId);
            System.out.println("msg>>Checking status for user, booking details  ");
            session.setAttribute("bookingList", bookingList);
            RequestDispatcher rd=request.getRequestDispatcher("status.jsp");
            rd.forward(request,response);
        }
        else{
            response.sendRedirect("signin.jsp");
        }
    }
}
