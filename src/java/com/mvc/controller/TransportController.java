package com.mvc.controller;

import com.mvc.bean.Transport;
import com.mvc.dao.TransportDAO;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TransportController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String operation = request.getParameter("operation");
        String transport_id = (request.getParameter("transport_id") != null) ?
                request.getParameter("transport_id")
                : "";
        String transport_brand = (request.getParameter("transport_brand") != null) ?
                request.getParameter("transport_brand") 
                : "";
        String transport_type = (request.getParameter("transport_type") != null) ?
                request.getParameter("transport_type") 
                : "";
        String transport_plateno = (request.getParameter("transport_plateno") != null) ?
                request.getParameter("transport_plateno") 
                : "";
        String transport_transmission = (request.getParameter("transport_transmission") != null) ?
                request.getParameter("transport_transmission") 
                : "";
        double transport_dayrate = (request.getParameter("transport_dayrate") != null) ?
                Double.parseDouble(request.getParameter("transport_dayrate")) 
                : 0.0;
        
        Transport transport = new Transport(transport_id, transport_brand, transport_type, transport_plateno, transport_transmission, transport_dayrate);

        List errorMsg = new LinkedList();
        if (transport_brand == null || transport_brand.trim().length() == 0) {
            errorMsg.add("Please enter brand.");
        }
        if (transport_type == null || transport_type.trim().length() == 0) {
            errorMsg.add("Please enter type.");
        }
        if (transport_plateno == null || transport_plateno.trim().length() == 0) {
            errorMsg.add("Please enter plate no.");
        }
        if (transport_transmission == null || transport_transmission.trim().length() == 0) {
            errorMsg.add("Please enter transmission.");
        }
        if (transport_dayrate == 0) {
            errorMsg.add("Please enter day rate.");
        }
        if (!errorMsg.isEmpty() && !operation.equals("D")) {
            request.setAttribute("errorMsg", errorMsg);
            RequestDispatcher view = request.getRequestDispatcher("error.jsp");
            view.forward(request, response);
            return;
        }

        TransportDAO transportDAO = new TransportDAO();
        if (operation.equals("C")) {
            transportDAO.addTransport(transport);
        } else if (operation.equals("U")) {
            transportDAO.updateTransport(transport);
        } else if (operation.equals("D")) {
            transportDAO.deleteTransport(transport.getTransport_id());
        }
        request.setAttribute("bean", transport);
        request.setAttribute("entity", "Transport");
        request.setAttribute("operation",operation);
        RequestDispatcher view = request.getRequestDispatcher("success.jsp");
        view.forward(request, response);
    }
}
