package com.mvc.controller;

import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    public LoginServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String userlevel = request.getParameter("userlevel");
        LoginBean loginBean = new LoginBean(); 
        loginBean.setUserName(userName); 
        loginBean.setUserPassword(password); 
        LoginDao loginDao = new LoginDao(); 
        String userValidate = loginDao.authenticateUser(loginBean, userlevel);
        if (userValidate.equals("SUCCESS"))
        { 
            HttpSession session = request.getSession(); 
            if (userlevel.equals("customer")) {
                session.setAttribute("customer_id", userName); 
            } else {
                session.setAttribute("admin_id", userName); 
            }
            session.setAttribute("userlevel", userlevel); 
            session.setAttribute("logged", true); 
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } 
        else {
            request.setAttribute("errMessage", userValidate);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
