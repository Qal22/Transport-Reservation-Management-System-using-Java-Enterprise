package com.mvc.bean;

import java.io.Serializable;

public class Transport implements Serializable {

    public Transport(String transport_id, String transport_brand, String transport_type, String transport_plateno, String transport_transmission, double transport_dayrate) {
        this.transport_id = transport_id;
        this.transport_brand = transport_brand;
        this.transport_type = transport_type;
        this.transport_plateno = transport_plateno;
        this.transport_transmission = transport_transmission;
        this.transport_dayrate = transport_dayrate;
    }

    public Transport() {
    }
    
    private String transport_id;
    private String transport_brand;
    private String transport_type;
    private String transport_plateno;
    private String transport_transmission;
    private double transport_dayrate;

    public String getTransport_id() {
        return transport_id;
    }

    public void setTransport_id(String transport_id) {
        this.transport_id = transport_id;
    }

    public String getTransport_brand() {
        return transport_brand;
    }

    public void setTransport_brand(String transport_brand) {
        this.transport_brand = transport_brand;
    }

    public String getTransport_type() {
        return transport_type;
    }

    public void setTransport_type(String transport_type) {
        this.transport_type = transport_type;
    }

    public String getTransport_plateno() {
        return transport_plateno;
    }

    public void setTransport_plateno(String transport_plateno) {
        this.transport_plateno = transport_plateno;
    }

    public String getTransport_transmission() {
        return transport_transmission;
    }

    public void setTransport_transmission(String transport_transmission) {
        this.transport_transmission = transport_transmission;
    }

    public double getTransport_dayrate() {
        return transport_dayrate;
    }

    public void setTransport_dayrate(double transport_dayrate) {
        this.transport_dayrate = transport_dayrate;
    }
    
}
