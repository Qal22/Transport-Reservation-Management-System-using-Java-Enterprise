<%
    if ((session.getAttribute("logged") == null)) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    if (!session.getAttribute("userlevel").equals("admin")) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
%>

<%@page import="com.mvc.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
    Connection conn = DBConnection.createConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM reservation JOIN customer USING (customer_id) JOIN transport USING (transport_id)");

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyMove: Reservation List</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>
            <div class="main container">
                <h1 class="display-4 pt-4 text-center">Reservation list</h1>
                <div class="border rounded my-4 pt-4 pb-4 item text-white">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Customer</th>
                                <th>Phone</th>
                                <th>Rent Period</th>
                                <th>Car</th>
                                <th>Total Price</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%                            int count = 0;
                            while (rs.next()) {
                                count++;
                        %>
                        <tr>
                            <td><%= count%></td>
                            <td><%= rs.getString("customer_name")%></td>
                            <td><%= rs.getString("customer_phone")%></td>
                            <td><%= rs.getString("rent_days_period")%> day(s), <%= rs.getString("pickup_date")%> - <%= rs.getString("dropoff_date")%></td>
                            <td><%= rs.getString("transport_brand")%> (<%= rs.getString("transport_plateno")%>)</td>
                            <td>RM
                                <script>
                                    document.write(Number(<%= rs.getString("rent_days_period")%>) * Number(<%= rs.getString("transport_dayrate")%>));
                                </script>
                            </td>
                            <td>
                                <script>
                                    var output = "";
                                    var today = new Date();
                                    var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                                    var current = Date.parse(date);
                                    var pickup = Date.parse("<%= rs.getString("pickup_date")%>");
                                    var dropoff = Date.parse("<%= rs.getString("dropoff_date")%>");
                                    if (current < pickup) {
                                        output = "<span disabled class=\"btn-sm btn-info\">Booked</span>";
                                    } else if (current > pickup && current < dropoff) {
                                        output = "<span disabled class=\"btn-sm btn-warning\">In Rental</span>";
                                    } else if (current > dropoff) {
                                        output = "<span disabled class=\"btn-sm btn-success\">Completed</span>";
                                    }
                                    document.write(output);
                                </script>
                            </td>
                            <td>
                                <button type="button" id="modalToggler" class="btn-block btn-danger" data-toggle="modal" data-target="#deletePrompt" data-reservation_id="<%= rs.getString("reservation_id")%>">
                                    Delete
                                </button>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="modal fade" id="deletePrompt" tabindex="-1" role="dialog" aria-labelledby="deletePromptLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form id="deleteForm" method="post" action="ReservationController">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deletePromptLabel">Delete the reservation</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to delete this reservation?
                            <input type="text" hidden id="reservation_id" name="reservation_id" value=""/>
                            <input type="text" hidden name="operation" value="D"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-danger">Yes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            $(document).on("click", "#modalToggler", function () {
                var reservation_id = $(this).data('reservation_id');
                $(".modal-body #reservation_id").val(reservation_id);
            });
        </script>

    </body>
</html>