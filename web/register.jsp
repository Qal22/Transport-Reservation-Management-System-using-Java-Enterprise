<%
    if((session.getAttribute("logged") != null)) {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyMove: Register Page</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
    </head>
    <body>
        <div class="main container">
            <div class="mt-5 text-center"><h1>EasyMove Register</h1> </div>
            <br>
            <div class="border rounded my-4 pt-4 pb-4 item text-white" align="center">
                <h1>Register</h1>
                <br>
                <div id="customerLogin">
                    <form action="RegisterServlet" method="post">
                        <table align="center" class="text-white">
                            <tr>
                                <td><label for="customer_id">ID : </label></td>
                                <td><input class="form-control" type="text" id="customer_id" name="customer_id" required/></td>
                            </tr>
                            <tr>
                                <td><label for="customer_name">Name : </label></td>
                                <td><input class="form-control" type="text" id="customer_name" name="customer_name" required/></td>
                            </tr>
                            <tr>
                                <td><label for="customer_icno">IC Number : </label></td>
                                <td><input class="form-control" type="text" id="customer_icno" name="customer_icno" required/></td>
                            </tr>
                            <tr>
                                <td><label for="customer_address">Address : </label></td>
                                <td><input class="form-control" type="text" id="customer_address" name="customer_address" required/></td>
                            </tr>
                            <tr>
                                <td><label for="customer_phone">Phone No. : </label></td>
                                <td><input class="form-control" type="text" id="customer_phone" name="customer_phone" required/></td>
                            </tr>
                            <tr>
                                <td><label for="customer_password">Password : </label></td>
                                <td><input class="form-control" type="password" id="customer_password" name="customer_password" required/></td>
                            </tr>
                        </table>
                        <br>
                        <div align="center">
                            <br><button class="btn-lg btn-warning" type="submit" name="submit" id="button">Register</button><br>
                        </div>
                    </form>
                </div>
                <%
                    if(request.getAttribute("errMessage")!= null) {
                        %>
                        <span style="font-size: 14px; color: red;"><%= request.getAttribute("errMessage") %></span>
                        <%
                    }
                %>
            </div>
        </div>
    </body>
</html>