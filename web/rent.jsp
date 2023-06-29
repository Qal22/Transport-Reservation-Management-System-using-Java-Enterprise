<%
    if ((session.getAttribute("logged") == null)) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    if (!session.getAttribute("userlevel").equals("customer")) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
%>
<%@page import="com.mvc.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
    Connection conn = DBConnection.createConnection();
    Statement stmt = conn.createStatement();
    String sql = "SELECT * FROM transport WHERE 1=1";
    if (request.getParameter("type") != null) {
        if (request.getParameter("type").equals("small")) {
            sql += " AND transport_type = 'Small'";
        } else if (request.getParameter("type").equals("medium")) {
            sql += " AND transport_type = 'Medium'";
        } else if (request.getParameter("type").equals("suv")) {
            sql += " AND transport_type = 'SUV'";
        }
    }
    ResultSet rs = stmt.executeQuery(sql);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyMove: Renting Page</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>
            <div class="main container">
                <h1 class="display-4 pt-4 text-center">Choose a car!</h1>
                <p class="lead text-center">Find your desired car below.</p>
                <div class="text-center">
                    <a href="rent.jsp" class="btn btn-outline-dark <% if (request.getParameter("type") == null) { %> active <% } %>">All</a>
                    <a href="rent.jsp?type=small" class="btn btn-outline-dark <% if (request.getParameter("type") != null) if (request.getParameter("type").equals("small")) { %> active <% } %>">Small</a>
                    <a href="rent.jsp?type=medium" class="btn btn-outline-dark <% if (request.getParameter("type") != null) if (request.getParameter("type").equals("medium")) { %> active <% } %>">Medium</a>
                    <a href="rent.jsp?type=suv" class="btn btn-outline-dark <% if (request.getParameter("type") != null) if (request.getParameter("type").equals("suv")) { %> active <% } %>">SUV</a>
                </div>
                <div class="border rounded my-4 pb-4 item text-white">

                <% while (rs.next()) {%>
                <hr>
                <div class="row mx-2 my-2">
                    <div class="col pl-5">
                        <strong class="d-inline-block mb-2 text-primary"><%= rs.getString("transport_type")%></strong>
                        <h3 class="mb-0"><%= rs.getString("transport_brand")%></h3>
                        <span class="card-text mb-auto">
                            Plate No.: <%= rs.getString("transport_plateno")%><br>
                            Transmission: <%= rs.getString("transport_transmission")%>
                        </span>
                    </div>
                    <div class="col-4 p-4 d-flex flex-column align-items-center justify-content-center">
                        <a class="btn-lg btn-warning px-5 py-3" href="rent_form.jsp?transport_id=<%= rs.getString("transport_id")%>">Choose</a>
                        <span class="mb-1">from RM<%= rs.getString("transport_dayrate")%>/day</span>
                    </div>
                </div>     
                <% }%>
            </div>
        </div>
    </body>
</html>