/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.RegisterBean;
import com.mvc.dao.RegisterDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aqilk
 */
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String customer_id = request.getParameter("customer_id");
        String customer_name = request.getParameter("customer_name");
        String customer_icno = request.getParameter("customer_icno");
        String customer_address = request.getParameter("customer_address");
        String customer_phone = request.getParameter("customer_phone");
        String customer_password = request.getParameter("customer_password");
        RegisterBean registerBean = new RegisterBean(customer_id, customer_name, customer_icno, customer_address, customer_phone, customer_password);
        RegisterDAO registerDAO = new RegisterDAO();
        String userValidate = registerDAO.register(registerBean);
        if (userValidate.equals("Registeration successful")) {
            request.setAttribute("successMessage", userValidate);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            request.setAttribute("errMessage", userValidate);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
