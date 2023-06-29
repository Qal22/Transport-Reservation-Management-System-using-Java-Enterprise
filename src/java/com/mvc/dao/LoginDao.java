package com.mvc.dao;

import com.mvc.bean.LoginBean;
import com.mvc.util.DBConnection;
import java.sql.*;

public class LoginDao {

    public String authenticateUser(LoginBean loginBean, String userlevel) {
        String userName = loginBean.getUserName();
        String password = loginBean.getUserPassword();
        Connection con = null;
        Statement stmt = null;
        ResultSet resultSet = null;
        try {
            con = DBConnection.createConnection();
            stmt = con.createStatement();
            String sql;
            if (userlevel.equals("customer")) {
                sql = "select * from customer where customer_id = '" + userName
                        + "' and customer_password = '" + password + "'";
            } else {
                sql = "select * from admin where admin_id = '" + userName
                        + "' and admin_password = '" + password + "'";
            }
            resultSet = stmt.executeQuery(sql);
            if (resultSet.next()) {
                return "SUCCESS";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
}
