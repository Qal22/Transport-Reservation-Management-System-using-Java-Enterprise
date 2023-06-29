package com.mvc.dao;

import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDAO {

    public String register(RegisterBean registerBean) {
        String customer_id = registerBean.getCustomer_id();
        String customer_name = registerBean.getCustomer_name();
        String customer_icno = registerBean.getCustomer_icno();
        String customer_address = registerBean.getCustomer_address();
        String customer_phone = registerBean.getCustomer_phone();
        String customer_password = registerBean.getCustomer_password();
        try {
            Connection con = DBConnection.createConnection();
            String sql = "INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ICNO, CUSTOMER_ADDRESS, CUSTOMER_PHONE, CUSTOMER_PASSWORD) VALUES (?, ?, ?, ?, ? ,?)";
            PreparedStatement ps;
            ResultSet rs;
            ps = con.prepareStatement(sql);
            ps.setString(1, customer_id);
            ps.setString(2, customer_name);
            ps.setString(3, customer_icno);
            ps.setString(4, customer_address);
            ps.setString(5, customer_phone);
            ps.setString(6, customer_password);
            int n = ps.executeUpdate();
            con.close();
            if (n > 0) {
                return "Registeration successful";
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return "Invalid user credentials";

    }
}
