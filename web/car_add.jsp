<%
    if((session.getAttribute("logged") == null)) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    if(!session.getAttribute("userlevel").equals("admin")) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
%>

<%@page import="com.mvc.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyMove: Add Transport</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>
            <div class="main container">
                <h1 class="display-4 pt-4">New Transport Details</h1>
                <form method="post" action="TransportController">
                <input type="text" hidden name="operation" value="C"/>
                <div class="border rounded my-4 ml-5 p-4 item text-white">
                    <label for="transport_brand">Brand: <span class="text-primary">*</span></label>
                    <input type="text" class="form-control" name="transport_brand" required/>
                    <br>
                    <label for="transport_type">Type: <span class="text-primary">*</span></label>
                    <br>
                    <select class="form-control" name="transport_type">
                        <option value="Small" selected>Small</option>
                        <option value="Medium">Medium</option>
                        <option value="SUV">SUV</option>
                    </select>
                    <br>
                    <label for="transport_plateno">Plate No.: <span class="text-primary">*</span></label>
                    <input type="text" class="form-control" name="transport_plateno" required/>
                    <br>
                    <label for="transport_transmission">Transmission: <span class="text-primary">*</span></label><br>
                    <input type="radio" name="transport_transmission" id="Auto" checked value="Auto"/> Auto<br>
                    <input type="radio" name="transport_transmission" id="Manual" value="Manual"/> Manual<br>
                    <br>
                    <label for="transport_dayrate">Day Rate (RM): <span class="text-primary">*</span></label>
                    <input type="number" class="form-control" name="transport_dayrate" required/>
                    <br>
                    <input type="submit" class="form-control btn-success" value="Submit"/>
                </div>
            </form>
        </div>
    </div>     
</div>
</div>
</body>
</html>