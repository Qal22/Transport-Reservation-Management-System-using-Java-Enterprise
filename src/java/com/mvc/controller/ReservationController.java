package com.mvc.controller;

import com.mvc.bean.Reservation;
import com.mvc.dao.ReservationDAO;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String operation = request.getParameter("operation");
        String reservation_id = (request.getParameter("reservation_id") != null)
                ? request.getParameter("reservation_id")
                : "";
        String pickup_date = (request.getParameter("pickup_date") != null)
                ? request.getParameter("pickup_date")
                : "";
        String dropoff_date = (request.getParameter("dropoff_date") != null)
                ? request.getParameter("dropoff_date")
                : "";
        int rent_days_period = (request.getParameter("rent_days_period") != null)
                ? Integer.parseInt(request.getParameter("rent_days_period"))
                : 0;
        String payment_method = (request.getParameter("payment_method") != null)
                ? request.getParameter("payment_method")
                : "";
        String customer_id = (request.getParameter("customer_id") != null)
                ? request.getParameter("customer_id")
                : "";
        String transport_id = (request.getParameter("transport_id") != null)
                ? request.getParameter("transport_id")
                : "";
        Reservation reservation = new Reservation(reservation_id, pickup_date, dropoff_date, rent_days_period, payment_method, customer_id, transport_id);

        List errorMsg = new LinkedList();
        if (pickup_date == null || pickup_date.trim().length() == 0) {
            errorMsg.add("Please enter pickup date.");
        }
        if (dropoff_date == null || dropoff_date.trim().length() == 0) {
            errorMsg.add("Please enter drop-off date.");
        }
        if (payment_method == null || payment_method.trim().length() == 0) {
            errorMsg.add("Please enter payment method.");
        }
        if (customer_id == null || customer_id.trim().length() == 0) {
            errorMsg.add("Please enter customer.");
        }
        if (transport_id == null || transport_id.trim().length() == 0) {
            errorMsg.add("Please enter transport.");
        }
        if (rent_days_period == 0) {
            errorMsg.add("Please enter day period.");
        }
        if (!errorMsg.isEmpty()&& !operation.equals("D")) {
            request.setAttribute("errorMsg", errorMsg);
            RequestDispatcher view = request.getRequestDispatcher("error.jsp");
            view.forward(request, response);
            return;
        }
        
        ReservationDAO reservationDAO = new ReservationDAO();
        if (operation.equals("C")) {
            reservationDAO.addReservation(reservation);
        } else if (operation.equals("D")) {
            reservationDAO.deleteReservation(reservation.getReservation_id());
        }
        request.setAttribute("bean",reservation);
        request.setAttribute("entity","Reservation");
        request.setAttribute("operation",operation);
        RequestDispatcher view = request.getRequestDispatcher("success.jsp");
        view.forward(request, response);
        
    }

}
