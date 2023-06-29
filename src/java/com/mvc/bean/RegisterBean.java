
package com.mvc.bean;

import java.io.Serializable;

public class RegisterBean implements Serializable {
  private String customer_id;
  private String customer_name;
  private String customer_icno;
  private String customer_address;
  private String customer_phone;
  private String customer_password;

    public RegisterBean(String customer_id, String customer_name, String customer_icno, String customer_address, String customer_phone, String customer_password) {
        this.customer_id = customer_id;
        this.customer_name = customer_name;
        this.customer_icno = customer_icno;
        this.customer_address = customer_address;
        this.customer_phone = customer_phone;
        this.customer_password = customer_password;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_icno() {
        return customer_icno;
    }

    public void setCustomer_icno(String customer_icno) {
        this.customer_icno = customer_icno;
    }

    public String getCustomer_address() {
        return customer_address;
    }

    public void setCustomer_address(String customer_address) {
        this.customer_address = customer_address;
    }

    public String getCustomer_phone() {
        return customer_phone;
    }

    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }

    public String getCustomer_password() {
        return customer_password;
    }

    public void setCustomer_password(String customer_password) {
        this.customer_password = customer_password;
    }
  
  
}
