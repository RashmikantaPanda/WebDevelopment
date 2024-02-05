package org.oupp.hospital.dao;

import org.oupp.hospital.dbconfig.DbConnection;
import org.oupp.hospital.model.Appointment;
import org.oupp.hospital.model.Doctor;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDao {
    DbConnection connection=new DbConnection();
    public boolean saveAppointment(Appointment appointment ,int patientId){
        String insertAppointmentQuery="insert into appointments (patientId,name,disease,doctor,date,time,address) values (?,?,?,?,?,?,?);";
        try{
            PreparedStatement pst=connection.con.prepareStatement(insertAppointmentQuery);
            pst.setInt(1,patientId);
            pst.setString(2,appointment.getPatientName());
            pst.setString(3,appointment.getDisease());
            pst.setString(4,appointment.getDoctorName());
            pst.setDate(5,appointment.getDate());
            pst.setTime(6,appointment.getTime());
            pst.setString(7,appointment.getAddress());

            int rowCount=pst.executeUpdate();
            if(rowCount>0){
                return true;
            }

        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        return false;
    }

    public List<Appointment> getAllAppointments(){
        List<Appointment> appointments=new ArrayList<>();
//        String appointmentsQuery="select * from appointments;"; /*It will show all appointments irrespective of doctor's status*/
        /*It will now show the deleted doctors appointment*/
        String appointmentsQuery="select * from appointments inner join doctor on appointments.doctor=doctor.doctorName where doctor.status=1;";
        try {
            PreparedStatement pst = connection.con.prepareStatement(appointmentsQuery);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                Appointment appointment=new Appointment();
                appointment.setId(rs.getInt(1));
                appointment.setPatientId(rs.getInt(2));
                appointment.setPatientName(rs.getString(3));
                appointment.setDisease(rs.getString(4));
                appointment.setDoctorName(rs.getString(5));
                appointment.setDate(rs.getDate(6));
                appointment.setTime(rs.getTime(7));
                appointment.setAddress(rs.getString(8));
                appointment.setStatus(rs.getString(9));
                appointment.setRemark(rs.getString(10));
                appointments.add(appointment);
            }
            return appointments;
        }catch (Exception e){
            System.out.println("Failed to get all appointments");
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Appointment> getAppointmentsByEmailOrId(int id){
        List<Appointment> appointments=new ArrayList<>();
        String appointmentsQuery="select * from appointments where patientId= ?;";
        try {
            PreparedStatement pst = connection.con.prepareStatement(appointmentsQuery);
            pst.setInt(1,id);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                Appointment appointment=new Appointment();
                appointment.setId(rs.getInt(1));
                appointment.setPatientId(rs.getInt(2));
                appointment.setPatientName(rs.getString(3));
                appointment.setDisease(rs.getString(4));
                appointment.setDoctorName(rs.getString(5));
                appointment.setDate(rs.getDate(6));
                appointment.setTime(rs.getTime(7));
                appointment.setAddress(rs.getString(8));
                appointment.setStatus(rs.getString(9));
                appointment.setRemark(rs.getString(10));
                appointments.add(appointment);
            }
            return appointments;
        }catch (Exception e){
            System.out.println("Failed to get patient appointments");
            System.out.println(e.getMessage());
        }
        return null;
    }


    public List<Appointment> getAppointmentsByDoctors(Doctor doctor){
        List<Appointment> appointments=new ArrayList<>();
        String appointmentsQuery="select * from appointments where doctor= ?;";
        try {
            PreparedStatement pst = connection.con.prepareStatement(appointmentsQuery);
            pst.setString(1,doctor.getName());
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                Appointment appointment=new Appointment();
                appointment.setId(rs.getInt(1));
                appointment.setPatientId(rs.getInt(2));
                appointment.setPatientName(rs.getString(3));
                appointment.setDisease(rs.getString(4));
                appointment.setDoctorName(rs.getString(5));
                appointment.setDate(rs.getDate(6));
                appointment.setTime(rs.getTime(7));
                appointment.setAddress(rs.getString(8));
                appointment.setStatus(rs.getString(9));
                appointment.setRemark(rs.getString(10));
                appointments.add(appointment);
            }
            return appointments;
        }catch (Exception e){
            System.out.println("Failed to get patient appointments by doctor name");
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean updateAppointmentById(int id,String remark){
        String updateAppointmentQuery="update appointments set remark=? ,status=? where appointmentId=?;";
        String status="ok";
        try{
            PreparedStatement pst=connection.con.prepareStatement(updateAppointmentQuery);
            pst.setString(1,remark);
            pst.setString(2,status);
            pst.setInt(3,id);
            int rowCount= pst.executeUpdate();
            if(rowCount>0){
                return true;
            }
        }catch (Exception e){
            System.out.println("Update appointment by doctor failed.");
            System.out.println(e.getMessage());
        }
        return false;
    }
}
