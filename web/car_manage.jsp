<%
    if((session.getAttribute("logged") == null)) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    if(!session.getAttribute("userlevel").equals("admin")) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
%>

<%
    if ((session.getAttribute("logged") == null)) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
%>
<%@page import="com.mvc.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
    Connection conn = DBConnection.createConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM transport");

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyMove: Manage Car</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>
            <div class="main container">
                <h1 class="display-4 pt-4 text-center">Car List</h1>
                <div class="text-center">
                    <a href="car_add.jsp" class="btn-lg btn-success">Add New Car</a>
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
                        <a class="btn-lg btn-warning mb-2" href="car_edit.jsp?transport_id=<%= rs.getString("transport_id")%>">Edit</a>
                        <button type="button" id="modalToggler" class="btn btn-danger" data-toggle="modal" data-target="#deletePrompt" data-transport_id="<%= rs.getString("transport_id")%>" data-transport_brand="<%= rs.getString("transport_brand") %>">
                            Delete
                        </button>
                    </div>
                </div>     
                <% }%>
            </div>
        </div>

        <div class="modal fade" id="deletePrompt" tabindex="-1" role="dialog" aria-labelledby="deletePromptLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form id="deleteForm" method="post" action="TransportController">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deletePromptLabel">Are you sure want to delete this car?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Brand: <span id="brand"></span>
                            <input type="text" hidden id="transport_id" name="transport_id" value=""/>
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
                var transport_brand = $(this).data('transport_brand');
                var transport_id = $(this).data('transport_id');
                $(".modal-body #brand").html(transport_brand);
                $(".modal-body #transport_id").val(transport_id);
            });
        </script>
    </body>
</html>