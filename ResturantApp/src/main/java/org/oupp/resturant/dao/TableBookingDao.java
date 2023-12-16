package org.oupp.resturant.dao;

import org.oupp.resturant.dbcon.DbConnection;
import org.oupp.resturant.model.TableBooking;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TableBookingDao {
    public boolean reserveTable(TableBooking tableBooking, String email) {

        String INSERT_QUERY = "insert into table_reservation (custId,date,time,partysize,customername,phoneno,tableId) values (?,?,?,?,?,?,?);";

        DbConnection connection = new DbConnection();
        int status = 0;
        try {
            int custId = -1;
            PreparedStatement pst1 = connection.con.prepareStatement("select custId from customer_details where customerEmail = ? ;");
            pst1.setString(1, email);
            ResultSet rs = pst1.executeQuery();
            while (rs.next()) {
                custId = rs.getInt(1);
            }
            System.out.println("Email "+email+"Customer Id : " + custId);

            PreparedStatement pst = connection.con.prepareStatement(INSERT_QUERY);
            pst.setInt(1, custId);
            pst.setDate(2, new Date(tableBooking.getDate().getTime()));
            pst.setTime(3, tableBooking.getTime());
            pst.setInt(4, tableBooking.getPartySize());
            pst.setString(5, tableBooking.getCustomerName());
            pst.setString(6, tableBooking.getPhoneno());
            pst.setInt(7, tableBooking.getTableId());

            status = pst.executeUpdate();
            if (status != 0) {
                System.out.println("msg>>Booking Details Saved");
                return true;
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return false;

    }

    public List<TableBooking> getBookingDetails(int custId){
        try {
            List<TableBooking> tbList=new ArrayList<>();
            String query = "select * from table_reservation where custId=?;";
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(query);
            pst.setInt(1,custId);
            ResultSet rs=pst.executeQuery();
            while (rs.next()){
                TableBooking tb=new TableBooking();
                tb.setBookingId(rs.getInt(1));
                tb.setCustId(custId);
                tb.setDate(rs.getDate(3));
                tb.setTime(rs.getTime(4));
                tb.setPartySize(rs.getInt(5));
                tb.setCustomerName(rs.getString(6));
                tb.setPhoneno(rs.getString(7));
                tb.setTableId(rs.getInt(8));
                tb.setStatus(rs.getInt(9));
                tb.setRemark(rs.getString(10));
                tbList.add(tb);

            }
            return tbList;
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    public int getIdByUserEmail(String email){
        try{
            int custId = 0;
            String query="select custId from customer_details where customerEmail = \""+email+"\";";
            DbConnection connection=new DbConnection();
            PreparedStatement pst=connection.con.prepareStatement(query);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                custId=rs.getInt(1);
            }
            return custId;
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public List<TableBooking> getAllBookingDetails(){
        try {
            List<TableBooking> bookingList=new ArrayList<>();
            String query = "select * from table_reservation ";
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(query);
            ResultSet rs=pst.executeQuery();
            while (rs.next()){
                TableBooking tb=new TableBooking();
                tb.setBookingId(rs.getInt(1));
                tb.setCustId(rs.getInt(2));
                tb.setDate(rs.getDate(3));
                tb.setTime(rs.getTime(4));
                tb.setPartySize(rs.getInt(5));
                tb.setCustomerName(rs.getString(6));
                tb.setPhoneno(rs.getString(7));
                tb.setTableId(rs.getInt(8));
                tb.setStatus(rs.getInt(9));
                tb.setRemark(rs.getString(10));
                bookingList.add(tb);

            }
            return bookingList;
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void updateBookingStatus(int bookingId, String status,String remark) {
        try {

            int statusValue=-1;
            if(status.equalsIgnoreCase("accept")){
                statusValue=1;
            }
            else if(status.equalsIgnoreCase("reject")){
                statusValue=0;
            }
            System.out.println("Status value : "+statusValue+" id : "+bookingId);
            String query = "update table_reservation  set status = ? where id = ?;";
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(query);
            pst.setInt(1,statusValue);
            pst.setInt(2,bookingId);
            int result = pst.executeUpdate();

        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    public void updateBookingStatus(int bookingId,String remark) {
        try {

            System.out.println(" id : "+bookingId +" Remark : "+remark);
            String query = "update table_reservation set remark = ? where id = ?;";
            DbConnection connection = new DbConnection();
            PreparedStatement pst = connection.con.prepareStatement(query);
            pst.setString(1,remark);
            pst.setInt(2,bookingId);
            int result = pst.executeUpdate();

        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
}
