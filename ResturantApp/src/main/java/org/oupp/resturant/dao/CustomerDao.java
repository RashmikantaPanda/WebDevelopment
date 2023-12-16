package org.oupp.resturant.dao;

import org.oupp.resturant.dbcon.DbConnection;
import org.oupp.resturant.model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerDao {

	public boolean registerCustomer(Customer cusomter) {

		String INSERT_QUERY = "insert into customer_details (customerName,customerEmail,customerPassword) values (?,?,?);";

		DbConnection connection = new DbConnection();
		int status = 0;

		try {
			PreparedStatement pst = connection.con.prepareStatement(INSERT_QUERY);
			pst.setString(1, cusomter.getCustomerName());
			pst.setString(2, cusomter.getCustomerEmail());
			pst.setString(3, cusomter.getCustomerPassword());

			status = pst.executeUpdate();
			if (status != 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;

	}

	public boolean loginCustomer(String email, String password) {
		String SELECT_QUERY = "select * from customer_details where customerEmail =? AND customerPassword = ? ;";
		DbConnection connection = new DbConnection();
		try {
			PreparedStatement pst = connection.con.prepareStatement(SELECT_QUERY);
			pst.setString(1, email);
			pst.setString(2, password);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public String getRole(String email){
		String query = "select role from customer_details where customerEmail=?;";
		DbConnection connection = new DbConnection();
		String role="user";
		try {
			PreparedStatement pst = connection.con.prepareStatement(query);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				role=rs.getString(1);
				System.out.println("Role : "+role);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return role;
	}
}
