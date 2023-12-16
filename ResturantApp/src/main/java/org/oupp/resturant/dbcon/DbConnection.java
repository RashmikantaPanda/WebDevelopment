package org.oupp.resturant.dbcon;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

    String url = "jdbc:mysql://localhost:3306/resturantdb";
    String username = "root";
    String password = "root";
    public Connection con;

    public DbConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
