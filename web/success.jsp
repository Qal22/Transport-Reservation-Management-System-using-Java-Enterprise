<%@page import="com.mvc.dao.TransportDAO"%>
<%@page import="com.mvc.bean.Reservation"%>
<%
    if ((session.getAttribute("logged") == null)) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
%>
<%@page import="com.mvc.bean.Transport"%>
<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyMove: Success!</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>
            <div class="main">
                <div class="col-md-5 mx-auto my-5 py-5 text-center">
                    <h1 class="display-4">Success!</h1>
                <%
                    String operation = (String) request.getAttribute("operation");
                    if (request.getAttribute("entity").equals("Transport")) {
                        Transport transport = (Transport) request.getAttribute("bean");
                        if (operation.equals("C")) {%>
                <p class="lead">You have added: </p>
                Brand: <%= transport.getTransport_brand()%>
                <br>Type: <%= transport.getTransport_type()%>
                <br>Transmission: <%= transport.getTransport_transmission()%>
                <br>Plate No: <%= transport.getTransport_plateno()%>
                <% } else if (operation.equals("U")) {%>
                <p class="lead">You have updated: </p>
                Brand: <%= transport.getTransport_brand()%>
                <br>Type: <%= transport.getTransport_type()%>
                <br>Transmission: <%= transport.getTransport_transmission()%>
                <br>Plate No: <%= transport.getTransport_plateno()%>
                <% } else if (operation.equals("D")) {%>
                <p class="lead">The car have been removed from the list.</p>
                <% }
                } else if (request.getAttribute("entity").equals("Reservation")) {
                    Reservation reservation = (Reservation) request.getAttribute("bean");
                    TransportDAO transportDAO = new TransportDAO();
                    Transport transport = transportDAO.getTransport(reservation.getTransport_id());
                    if (operation.equals("C")) {%>
                <p class="lead">Thank you for the booking, <%= reservation.getCustomer_id()%>!</p>
                <p class="lead">You have booked: </p>
                Brand: <%= transport.getTransport_brand()%>
                <br>Type: <%= transport.getTransport_type()%>
                <br>Transmission: <%= transport.getTransport_transmission()%>
                <br>Plate No: <%= transport.getTransport_plateno()%>
                <hr>Date: <%= reservation.getPickup_date()%> - <%= reservation.getDropoff_date()%>
                <br>Rental Period: <%= reservation.getRent_days_period()%> day(s)
                <br>Total: RM
                <script>
                    document.write((Number(<%= reservation.getRent_days_period()%>) * Number(<%= transport.getTransport_dayrate()%>)).toFixed(2));
                </script> [<%= reservation.getPayment_method()%>]
                <% } else if (operation.equals("D")) {%>
                <p class="lead">You have removed the reservation.</p>
                <% }
                    }
                %><hr>
                <br><a class="px-3 btn btn-outline-dark" href="index.jsp">Back to Homepage</a>
            </div>
        </div>
    </body>
</html>

