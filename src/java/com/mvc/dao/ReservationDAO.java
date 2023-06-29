package com.mvc.dao;

import com.mvc.bean.Reservation;
import com.mvc.util.DBConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ReservationDAO implements Serializable {

    public ReservationDAO() {
    }

    public Connection con = DBConnection.createConnection();

    public Reservation getReservation(String reservation_id) {
        try {
            String sql = "SELECT * FROM reservation WHERE reservation_id = '" + reservation_id + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            String pickup_date = rs.getString("pickup_date");
            String dropoff_date = rs.getString("dropoff_date");
            int rent_days_period = Integer.parseInt(rs.getString("rent_days_period"));
            String payment_method = rs.getString("payment_method");
            String customer_id = rs.getString("customer_id");
            String transport_id = rs.getString("transport_id");
            Reservation reservation = new Reservation(reservation_id, pickup_date, dropoff_date, rent_days_period, payment_method, customer_id, transport_id);
            con.close();
            return reservation;
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public void addReservation(Reservation reservation) {
        String pickup_date = reservation.getPickup_date();
        String dropoff_date = reservation.getDropoff_date();
        int rent_days_period = reservation.getRent_days_period();
        String payment_method = reservation.getPayment_method();
        String customer_id = reservation.getCustomer_id();
        String transport_id = reservation.getTransport_id();
        String str = pickup_date.replaceAll("-", "") + "_" + transport_id;
        String nstr = "";
        for (int i = 0; i < str.length(); i++) {
            nstr = str.charAt(i) + nstr;
        }
        reservation.setReservation_id(nstr);
        String reservation_id = reservation.getReservation_id();
        String sql = "INSERT INTO reservation (reservation_id, pickup_date, dropoff_date, rent_days_period, payment_method, customer_id,  transport_id) VALUES (?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, reservation_id);
            ps.setString(2, pickup_date);
            ps.setString(3, dropoff_date);
            ps.setInt(4, rent_days_period);
            ps.setString(5, payment_method);
            ps.setString(6, customer_id);
            ps.setString(7, transport_id);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
    
    public void deleteReservation(String reservation_id) {
        String sql = "DELETE FROM reservation WHERE reservation_id = '" + reservation_id + "'";
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
