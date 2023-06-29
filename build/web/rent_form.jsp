<%
    if((session.getAttribute("logged") == null)) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    if(!session.getAttribute("userlevel").equals("customer")) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
%>
<%@page import="com.mvc.util.DBConnection"%>
<%@page import="com.mvc.bean.Transport"%>
<%@page import="com.mvc.dao.TransportDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" %>
<%
        Connection conn = DBConnection.createConnection();

        PreparedStatement ps = conn.prepareStatement("SELECT * FROM transport WHERE transport_id = ?");
        ps.setString(1, request.getParameter("transport_id"));
        ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyMove: Renting Form</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
            <script>
                function countDay() {
                    var start = new Date(document.getElementById("pickup_date").value);
                    var end = new Date(document.getElementById("dropoff_date").value);
                    var day_field = document.getElementById("rent_days_period");
                    var day_text = document.getElementById("day_text");
                    var dayrate = document.getElementById("dayrate").innerHTML;
                    var total_price = document.getElementById("total_price");
                    var day = (end.getTime() - start.getTime()) / (1000 * 3600 * 24);
                    if (isNaN(day)) {
                        day = 0;
                    }
                    day_field.value = day;
                    day_text.innerHTML = day;
                    total_price.innerHTML = (Number(day) * Number(dayrate)).toFixed(2);
                    if (day > 0) {
                        document.getElementById("confirmBtn").disabled = false;
                    } else {
                        document.getElementById("confirmBtn").disabled = true;
                    }
                }
            </script>
        </head>
        <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>
        <%
            String transport_id = request.getParameter("transport_id");
            Transport transport;
            TransportDAO transportDao = new TransportDAO();
            transport = transportDao.getTransport(transport_id);
        %>
            <div class="main container">
            <% if (!rs.next()) { %>
            <h1 class="display-4 pt-4 text-center">Error!</h1>
            <p class="lead text-center">Request with that ID is invalid. Click <a style="color: orange;" href="rent.jsp">here</a> to return to previous page.</p>
            <% } else {%>
            <h1 class="display-4 pt-4 text-center">Great Choice!</h1>
            <p class="lead text-center">Finish the booking by filling up the form. </p>
            <form method="post" action="ReservationController">
                <div class="row">
                    <div class="col-8">
                        <div class="border rounded my-4 ml-5 p-4 item text-white">
                            <h2>Renting Form</h2>
                            <input type="text" hidden name="transport_id" value="<%= transport.getTransport_id() %>">
                            <input type="text" hidden name="customer_id" value="<%= session.getAttribute("customer_id") %>">
                            <input type="text" hidden name="operation" value="C">
                            <div class="row mb-2">
                                <div class="col">
                                    <label for="pickup_date">Pickup Date: <span class="text-primary">*</span></label>
                                    <input type="date" class="form-control" id="pickup_date" name="pickup_date" onchange="countDay()" required/>
                                </div>
                                <div class="col">
                                    <label for="dropoff_date">Drop-off Date: <span class="text-primary">*</span></label>
                                    <input type="date" class="form-control" id="dropoff_date" name="dropoff_date" onchange="countDay()" required/>
                                </div>
                                <div class="col">
                                    <label for="rent_days_period">Renting Period (day(s)): </label>
                                    <input type="number" class="form-control" id="rent_days_period" name="rent_days_period" value="0" readonly/>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col">
                                    <label for="payment_method">Payment Method: <span class="text-primary">*</span></label>
                                    <select class="form-control" name="payment_method">
                                        <option value="Cash" selected>Cash</option>
                                        <option value="Online Banking" disabled>Online Banking (not available)</option>
                                        <option value="Debit/Credit Card" disabled>Debit/Credit Card (not available)</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-4">
                        <div class="border rounded my-4 mr-5 p-4 item text-white">
                            <h5 class="text-white"><%= transport.getTransport_brand() %></h5>
                            <span class="text-white">Rate per day: RM<span id="dayrate"><%= transport.getTransport_dayrate() %></span></span><br>
                            <span class="text-white">Renting period: <span id="day_text">0</span> day(s)</span><br>
                            <h5 class="mt-2 text-white">Total Price: RM<span id="total_price">0.00</span></h5>
                            <button type="submit" id="confirmBtn" class="btn btn-warning px-5" disabled>Confirm Booking</button>
                        </div>
                    </div>
                </div>           
            </form>
            <% } %>
        </div>
    </body>
</html>

<%
        rs.close();
        ps.close();
        conn.close();
%>