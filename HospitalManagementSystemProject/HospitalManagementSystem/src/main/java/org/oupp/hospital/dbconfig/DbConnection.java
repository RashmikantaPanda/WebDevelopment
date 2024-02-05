package org.oupp.hospital.dbconfig;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DbConnection {
    private final String url = "jdbc:mysql://localhost:3306/hospitaldb";
    private final String username = "root";
    private final String password = "root";
    public Connection con;
    public Statement st;

    public DbConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
