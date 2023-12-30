package org.oupp.resturant.controller;

import org.oupp.resturant.dao.TableBookingDao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateBooking")
public class    UpdateStatus extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException {

        String bookingIdStr = request.getParameter("bookingId");
        String action = request.getParameter("action");
        String remark=request.getParameter("remark");

        if (bookingIdStr != null && action != null) {
            try {
                int bookingId = Integer.parseInt(bookingIdStr);


                if ("accept".equals(action)) {

                    updateBookingStatus(bookingId, "accept",remark);
                } else if ("reject".equals(action)) {
                    updateBookingStatus(bookingId, "reject",remark);
                }
                else if(remark!=null){
                    updateBookingStatus(bookingId,remark);
                }

                response.sendRedirect(request.getContextPath() + "/all_booking_details");
                return;

            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid or missing parameters");
    }


    private void updateBookingStatus(int bookingId, String status,String remark) {

        TableBookingDao tableBookingDao = new TableBookingDao();
        tableBookingDao.updateBookingStatus(bookingId, status,remark);
    }
    private void updateBookingStatus(int bookingId, String remark) {

        TableBookingDao tableBookingDao = new TableBookingDao();
        tableBookingDao.updateBookingStatus(bookingId,remark);
    }
}
