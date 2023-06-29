package com.mvc.dao;

import com.mvc.bean.Transport;
import java.io.Serializable;
import java.sql.*;
import com.mvc.util.DBConnection;

public class TransportDAO implements Serializable {

    public TransportDAO() {
    }
    public Connection con = DBConnection.createConnection();

    public Transport getTransport(String transport_id) {
        try {
            String sql = "SELECT * FROM transport WHERE transport_id = '" + transport_id + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            String transport_brand = rs.getString("transport_brand");
            String transport_type = rs.getString("transport_type");
            String transport_plateno = rs.getString("transport_plateno");
            String transport_transmission = rs.getString("transport_transmission");
            double transport_dayrate = rs.getDouble("transport_dayrate");
            Transport transport = new Transport(transport_id, transport_brand, transport_type, transport_plateno, transport_transmission, transport_dayrate);
            con.close();
            return transport;
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public void addTransport(Transport transport) {
        String transport_brand = transport.getTransport_brand();
        String transport_type = transport.getTransport_type();
        String transport_plateno = transport.getTransport_plateno();
        String transport_transmission = transport.getTransport_transmission();
        double transport_dayrate = transport.getTransport_dayrate();
        String nstr = "";
        for (int i = 0; i < transport_plateno.length(); i++) {
            nstr = transport_plateno.charAt(i) + nstr;
        }
        transport.setTransport_id(nstr);
        String transport_id = transport.getTransport_id();
        String sql = "INSERT INTO transport (transport_id, transport_brand, transport_type, transport_plateno, transport_transmission, transport_dayrate) VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, transport_id);
            ps.setString(2, transport_brand);
            ps.setString(3, transport_type);
            ps.setString(4, transport_plateno);
            ps.setString(5, transport_transmission);
            ps.setDouble(6, transport_dayrate);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void updateTransport(Transport transport) {
        String transport_id = transport.getTransport_id();
        String transport_brand = transport.getTransport_brand();
        String transport_type = transport.getTransport_type();
        String transport_plateno = transport.getTransport_plateno();
        String transport_transmission = transport.getTransport_transmission();
        double transport_dayrate = transport.getTransport_dayrate();
        String sql = "UPDATE transport SET transport_brand=?, transport_type=?, transport_plateno=?, transport_transmission=?, transport_dayrate=? WHERE transport_id='" + transport_id + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, transport_brand);
            ps.setString(2, transport_type);
            ps.setString(3, transport_plateno);
            ps.setString(4, transport_transmission);
            ps.setDouble(5, transport_dayrate);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void deleteTransport(String transport_id) {
        String sql = "DELETE FROM transport WHERE transport_id = '" + transport_id + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
}
