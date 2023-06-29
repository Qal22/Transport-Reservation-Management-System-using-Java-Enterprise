package com.mvc.util;

import java.sql.*;

public class DBConnection {

    public static Connection createConnection() {
        Connection conn = null;
        String driver = "com.mysql.jdbc.Driver";
        String dbCon = "jdbc:mysql://localhost:3306/easymoveDB";
        String usr = "root", pass = "";
        /* FOR DERBY DB
        String driver = "org.apache.derby.jdbc.ClientDriver";
        String dbCon = "jdbc:derby://localhost:1527/easymoveDB";
        String usr = "app", pass = "app";
        */

        try {
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            conn = DriverManager.getConnection(dbCon, usr, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
