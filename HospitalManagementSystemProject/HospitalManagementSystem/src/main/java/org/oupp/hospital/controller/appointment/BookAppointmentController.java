package org.oupp.hospital.controller.appointment;

import org.oupp.hospital.dao.AppointmentDao;
import org.oupp.hospital.dao.PatientDao;
import org.oupp.hospital.model.Appointment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/patient/bookAppointment")
public class BookAppointmentController extends HttpServlet {

    PatientDao patientDao;
    AppointmentDao appointmentDao;
    @Override
    public void init() throws ServletException {
        patientDao=new PatientDao();
        appointmentDao=new AppointmentDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String patientName;
        String patientEmail;
        String diseaseName;
        String doctorName;
        String strDate;
        Date sqlDate;
        String strTime;
        Time sqlTime = null;
        String address;


        patientName = request.getParameter("patientName");
        patientEmail = request.getParameter("patientEmail");
        diseaseName = request.getParameter("diseaseName");
        doctorName = request.getParameter("doctorName");
        address = request.getParameter("address");

        strDate = request.getParameter("date");
        sqlDate = convertStringToSqlDate(strDate);

        strTime = request.getParameter("time");
        sqlTime = convertStringToSqlTime(strTime);

        System.out.println(patientName + " " + sqlDate + " " + sqlTime);

        Appointment appointment=new Appointment();
        appointment.setPatientName(patientName);
        appointment.setPatientEmail(patientEmail);
        appointment.setDisease(diseaseName);
        appointment.setDoctorName(doctorName);
        appointment.setDate(sqlDate);
        appointment.setTime(sqlTime);
        appointment.setAddress(address);

        int patientId=patientDao.getPatientIdByEmail(patientEmail);

        if(patientId!=-1){
            if(appointmentDao.saveAppointment(appointment,patientId)){
                System.out.println("Appointment booked successfully");
                HttpSession session = request.getSession(false);
                session.setAttribute("succMsg", "Booking Success");
                response.sendRedirect(request.getContextPath()+"/book_appointment.jsp");
            }
            else{
                System.out.println("Appointment booking failed");
            }
        }


    }

    private static Date convertStringToSqlDate(String dateStr) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = sdf.parse(dateStr);
            return new Date(date.getTime());
        } catch (ParseException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    private static Time convertStringToSqlTime(String timeStr) {
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("HH:mm");
            java.util.Date utilDate = inputFormat.parse(timeStr);
            return new java.sql.Time(utilDate.getTime());
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("Invalid time format: " + e.getMessage());
        }
        return null;
    }
}
