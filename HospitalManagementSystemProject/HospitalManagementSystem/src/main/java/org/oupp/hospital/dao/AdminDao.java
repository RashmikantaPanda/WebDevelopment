package org.oupp.hospital.dao;

import org.oupp.hospital.dbconfig.DbConnection;
import org.oupp.hospital.model.Admin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDao {
    DbConnection connection=new DbConnection();
    public boolean loginAdmin(Admin admin){
        String authQuery="select adminName from admin where adminEmail=? OR adminId=? AND password=?;";
        try {
            PreparedStatement pst=connection.con.prepareStatement(authQuery);
            pst.setString(1,admin.getEmail());
            pst.setString(2,admin.getEmail()); //To achieve the id and email based login
            pst.setString(3,admin.getPassword());
            ResultSet rs=pst.executeQuery();
            if(rs.next()){
                return true;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean registerAdmin(Admin admin){
        String registerQuery="insert into admin (adminName,adminEmail,password) values (?,?,?)";
        try {
            PreparedStatement pst=connection.con.prepareStatement(registerQuery);
            pst.setString(1,admin.getName());
            pst.setString(2,admin.getEmail());
            pst.setString(3,admin.getPassword());
            int rowCount=pst.executeUpdate();
            if(rowCount>0){
                return true;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return false;
    }

    public Admin getAdminByEmailOrId(String email){
        Admin admin= new Admin();
        String getAdminUsingEmail="select * from admin where adminEmail=? or adminId=?;";
        try {
            PreparedStatement pst=connection.con.prepareStatement(getAdminUsingEmail);
            pst.setString(1,email);
            pst.setString(2,email);
            ResultSet rs=pst.executeQuery();
            if(rs.next()){
                admin.setId(rs.getInt(1));
                admin.setName(rs.getString(2));
                admin.setEmail(rs.getString(3));
                admin.setPassword(rs.getString(4));
                return admin;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }


}
