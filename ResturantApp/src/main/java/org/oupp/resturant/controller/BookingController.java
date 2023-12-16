package org.oupp.resturant.controller;

import org.oupp.resturant.dao.TableBookingDao;
import org.oupp.resturant.model.TableBooking;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;

@WebServlet("/booking")
public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TableBookingDao tableBookingDao;

    public void init() {
        tableBookingDao = new TableBookingDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pattern = "yyyy-MM-dd"; // Adjust the pattern based on your date format
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneno = request.getParameter("phoneno");
        Date date;
        try {
            date = dateFormat.parse(request.getParameter("date"));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String t = request.getParameter("time");
        LocalTime time = LocalTime.parse(t);

        int tableId = Integer.parseInt(request.getParameter("tableId"));
        int partySize = Integer.parseInt(request.getParameter("partySize"));

        if (username.equals("") && username == null) {
            request.setAttribute("msg", "Username can not be empty");
            RequestDispatcher rd = request.getRequestDispatcher("bookATable.jsp");
            rd.include(request, response);
        } else if (partySize < 1 && partySize > 20) {
            request.setAttribute("msg", "Please enter a valid party size");
            RequestDispatcher rd = request.getRequestDispatcher("bookATable.jsp");
            rd.include(request, response);
        } else {
            TableBooking tb = new TableBooking();
            tb.setCustomerName(username);
            tb.setDate(date);
            tb.setTime(Time.valueOf(time));
            tb.setPartySize(partySize);
            tb.setPhoneno(phoneno);
            tb.setTableId(tableId);

            try {
                if (tableBookingDao.reserveTable(tb, email)) {
                    System.out.println("Table booking request sent to admin");
                    response.sendRedirect("status");
                } else {
                    System.out.println("Booking Failed");
                    response.sendRedirect("booktable.jsp");
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }

}

