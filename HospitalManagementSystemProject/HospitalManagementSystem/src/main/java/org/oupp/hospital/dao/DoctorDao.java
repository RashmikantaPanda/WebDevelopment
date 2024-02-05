package org.oupp.hospital.dao;

import org.oupp.hospital.dbconfig.DbConnection;
import org.oupp.hospital.model.Doctor;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DoctorDao {
    public boolean registerDoctor(Doctor doctor) {
        String registerQuery = "insert into doctor (doctorName,doctorEmail,doctorPhone,specialization,password) value (?,?,?,?,?);";
        try {
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(registerQuery);
            pst.setString(1, doctor.getName());
            pst.setString(2, doctor.getEmail());
            pst.setString(3, doctor.getPhone());
            pst.setString(4, doctor.getSpecialization());
            pst.setString(5, doctor.getPassword());

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Doctor Registration Failed ");
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean loginDoctor(Doctor doctor) {
        String registerQuery = "select * from doctor where doctorEmail=? OR doctorId=? AND password=? AND status=1;";
        try {
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(registerQuery);
            pst.setString(1, doctor.getEmail());
            pst.setString(2, doctor.getEmail()); //this is for id, doctor can login through both email and id
            pst.setString(3, doctor.getPassword());

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public Doctor getDoctorByEmail(String email) {
        Doctor doctor = new Doctor();
        String getDoctorByEmailQyery = "select * from doctor where doctorEmail=? OR doctorId=?;";
        try {
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(getDoctorByEmailQyery);
            pst.setString(1, email);
            pst.setString(2, email);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                doctor.setId(rs.getInt(1));
                doctor.setName(rs.getString(2));
                doctor.setEmail(rs.getString(3));
                doctor.setPhone(rs.getString(4));
                doctor.setSpecialization(rs.getString(5));
                doctor.setPassword(rs.getString(6));
                return doctor;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public Doctor getDoctorById(int id) {
        Doctor doctor = new Doctor();
        String getDoctorByIdQuery = "select * from doctor where doctorId=?;";
        try {
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(getDoctorByIdQuery);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                doctor.setId(rs.getInt(1));
                doctor.setName(rs.getString(2));
                doctor.setEmail(rs.getString(3));
                doctor.setPhone(rs.getString(4));
                doctor.setSpecialization(rs.getString(5));
                doctor.setPassword(rs.getString(6));
                return doctor;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return doctor;
    }

    public List<String> getDoctorNames() {
        Doctor doctor = new Doctor();
        List<String> doctorNames = new ArrayList<>();
        String getDoctorNames = "select doctorName from doctor where status=1;";
        try {
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(getDoctorNames);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                doctorNames.add(rs.getString(1));
            }
            return doctorNames;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return doctorNames;
    }

    public List<Doctor> getAllDoctors() {
        List<Doctor> doctors = new ArrayList<>();
        String getDoctors = "select * from doctor where status=1;";
        try {
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(getDoctors);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setId(rs.getInt(1));
                doctor.setName(rs.getString(2));
                doctor.setEmail(rs.getString(3));
                doctor.setPhone(rs.getString(4));
                doctor.setSpecialization(rs.getString(5));
                doctor.setPassword(rs.getString(6));

                doctors.add(doctor);
            }
            return doctors;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean updateDoctor(Doctor doctor) {
        String registerQuery = "update doctor set doctorName=?,doctorEmail=?,doctorPhone=?,specialization=?,password=? where doctorId=?;";
        try {
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(registerQuery);
            pst.setString(1, doctor.getName());
            pst.setString(2, doctor.getEmail());
            pst.setString(3, doctor.getPhone());
            pst.setString(4, doctor.getSpecialization());
            pst.setString(5, doctor.getPassword());
            pst.setInt(6, doctor.getId());

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean deleteDoctor(int id) {
        String deleteDoctorQuery = "update doctor set status=0 where doctorId=?;";
        try {
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(deleteDoctorQuery);
            pst.setInt(1, id);

            int rowCount = pst.executeUpdate();
            if(rowCount>0){
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
