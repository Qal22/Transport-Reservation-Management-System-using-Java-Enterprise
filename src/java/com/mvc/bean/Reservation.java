
package com.mvc.bean;

import java.io.Serializable;

public class Reservation implements Serializable {
    private String reservation_id;
    private String pickup_date;
    private String dropoff_date;
    private int rent_days_period;
    private String payment_method;
    private String customer_id;
    private String transport_id;

    public Reservation() {
    }

    public Reservation(String reservation_id, String pickup_date, String dropoff_date, int rent_days_period, String payment_method, String customer_id, String transport_id) {
        this.reservation_id = reservation_id;
        this.pickup_date = pickup_date;
        this.dropoff_date = dropoff_date;
        this.rent_days_period = rent_days_period;
        this.payment_method = payment_method;
        this.customer_id = customer_id;
        this.transport_id = transport_id;
    }

    public String getReservation_id() {
        return reservation_id;
    }

    public void setReservation_id(String reservation_id) {
        this.reservation_id = reservation_id;
    }

    public String getPickup_date() {
        return pickup_date;
    }

    public void setPickup_date(String pickup_date) {
        this.pickup_date = pickup_date;
    }

    public String getDropoff_date() {
        return dropoff_date;
    }

    public void setDropoff_date(String dropoff_date) {
        this.dropoff_date = dropoff_date;
    }

    public int getRent_days_period() {
        return rent_days_period;
    }

    public void setRent_days_period(int rent_days_period) {
        this.rent_days_period = rent_days_period;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getTransport_id() {
        return transport_id;
    }

    public void setTransport_id(String transport_id) {
        this.transport_id = transport_id;
    }
    
}
