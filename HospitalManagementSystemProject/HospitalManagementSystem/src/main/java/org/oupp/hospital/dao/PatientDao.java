package org.oupp.hospital.dao;

import org.oupp.hospital.dbconfig.DbConnection;
import org.oupp.hospital.model.Doctor;
import org.oupp.hospital.model.Patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PatientDao {

    DbConnection connection = new DbConnection();

    /* New Patient Registration */
    public boolean registerPatient(Patient patient) {
        String registerQuery = "insert into patient (patientName,patientEmail,phone,password) values (?,?,?,?);";
        try (PreparedStatement pst = connection.con.prepareStatement(registerQuery)) {
            pst.setString(1, patient.getName());
            pst.setString(2, patient.getEmail());
            pst.setString(3, patient.getPhone());
            pst.setString(4, patient.getPassword());

            int rowAffect = pst.executeUpdate();
            if (rowAffect > 0)
                return true;
        } catch (SQLException e) {
            System.out.println("Exception occur during patient registration");
            System.out.println(e.getMessage());
        }
        return false;
    }

    /* Patient Login/Authentication */
    public boolean loginPatient(Patient patient) {
        String loginQuery = "select patientName from patient where patientEmail=? OR patientId=? AND password=? AND status=1; ";
        try (PreparedStatement pst = connection.con.prepareStatement(loginQuery)) {
            pst.setString(1, patient.getEmail());
            pst.setString(2, patient.getEmail()); //this is for patientId
            pst.setString(3, patient.getPassword());
            ResultSet rs = pst.executeQuery();
            if (rs.next())
                return true;
        } catch (SQLException e) {
            System.out.println("Exception occur during patient login");
            System.out.println(e.getMessage());
        }
        return false;
    }

    /* Get Patient by Email*/
    public Patient getPatientByEmail(String email) {
        String getPatientByEmailQuery = "select * from patient where patientEmail=? OR patientId=? ; ";
        Patient patient = new Patient();
        try {
            PreparedStatement pst = connection.con.prepareStatement(getPatientByEmailQuery);
            pst.setString(1, email);
            pst.setString(2, email); //This is for doctorId
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                patient.setId(rs.getInt(1));
                patient.setName(rs.getString(2));
                patient.setEmail(rs.getString(3));
                patient.setPhone(rs.getString(4));
                patient.setPassword(rs.getString(5));
                return  patient;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    /* Get Patient by Id*/
    public Patient getPatientById(int id) {
        String getPatientByIdQuery = "select * from patient where patientId=? ; ";
        Patient patient = new Patient();
        try {
            PreparedStatement pst = connection.con.prepareStatement(getPatientByIdQuery);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                patient.setId(rs.getInt(1));
                patient.setName(rs.getString(2));
                patient.setEmail(rs.getString(3));
                patient.setPhone(rs.getString(4));
                patient.setPassword(rs.getString(5));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return patient;
    }

    /*Get patient Id by Email*/
    public int getPatientIdByEmail(String email) {
        int id = -1;
        String getIdQuery = "select patientId from patient where patientEmail=?;";
        try {
            PreparedStatement pst = connection.con.prepareStatement(getIdQuery);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return id;
    }

    public List<Patient> getAllPatients() {
        String getAllPatient = "select * from patient where status=1;";
        List<Patient> allPatients=new ArrayList<>();
        try {
            PreparedStatement pst = connection.con.prepareStatement(getAllPatient);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Patient patient = new Patient();
                patient.setId(rs.getInt(1));
                patient.setName(rs.getString(2));
                patient.setEmail(rs.getString(3));
                patient.setPhone(rs.getString(4));
                patient.setPassword(rs.getString(5));
                allPatients.add(patient);
            }
            return allPatients;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean updatePatient(Patient patient) {
        String updatePatientQuery = "update patient set patientName=?,patientEmail=?,phone=?,password=? where patientId=?;";
        try {
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(updatePatientQuery);
            pst.setString(1, patient.getName());
            pst.setString(2, patient.getEmail());
            pst.setString(3, patient.getPhone());
            pst.setString(4, patient.getPassword());
            pst.setInt(5, patient.getId());

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }


    public boolean deletePatient(int id) {
        String deletePatientQuery = "update patient set status=0 where patientId=?;";
        try {
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(deletePatientQuery);
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
