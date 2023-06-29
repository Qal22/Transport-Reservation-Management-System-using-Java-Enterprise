<%
    if((session.getAttribute("logged") != null)) {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyMove: Login Page</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
    </head>
    <body>
        <div class="main container">
            <div class="mt-5 text-center"><h1>EasyMove Login</h1> </div>
            <br>
            <div class="border rounded my-4 pt-4 pb-4 item text-white" align="center">
                <h1>Log In</h1>
                <input type="radio" name="loginRadio" onclick="showForm(this.value)" value="customer" checked> Customer
                <input type="radio" name="loginRadio" onclick="showForm(this.value)" value="admin"> Admin<br>

                <br>
                <script language="javascript">
                    function showForm(value) {
                        if (value == "customer") {
                            document.getElementById("customerLogin").hidden = false;
                            document.getElementById("adminLogin").hidden = true;
                        } else {
                            document.getElementById("customerLogin").hidden = true;
                            document.getElementById("adminLogin").hidden = false;
                        }
                    }
                </script>
                <div id="customerLogin">
                    <form action="LoginServlet" method="post">
                        <table align="center" class="text-white">
                            <tr>
                                <td><label for="cust_username">Customer ID : </label></td>
                                <td><input class="form-control" type="text" id="cust_username" name="username" required/></td>
                            </tr>
                            <tr>
                                <td><label for="cust_password">Password : </label></td>
                                <td><input class="form-control" type="password" id="cust_password" name="password" required/></td>
                            </tr>
                        </table>
                        <br>
                        <div align="center">
                            <a style="font-size: 14px; color: yellow;" href="register.jsp"><b>Don't have account? Register now.</b></a>
                            <br><button class="btn-lg btn-warning" type="submit" name="submit" id="button">Login</button><br>
                        </div>
                        <input type="hidden" name="userlevel" value="customer">
                    </form>
                </div>
                <div id="adminLogin" hidden>
                    <form action="LoginServlet" method="post" >
                        <table align="center" class="text-white">
                            <tr>
                                <td><label for="admin_id">Admin ID : </label></td>
                                <td><input class="form-control" type="text" id="admin_id" name="username" required/></td>
                            </tr>
                            <tr>
                                <td><label for="admin_password">Password : </label></td>
                                <td><input class="form-control" type="password" id="admin_password" name="password" required/></td>
                            </tr>
                        </table>
                        <br>
                        <div align="center">
                            <button class="btn-lg btn-warning" type="submit" name="submit" id="button">Login</button>
                        </div>
                        <input type="hidden" name="userlevel" value="admin">
                    </form>
                </div>
                <%
                    if(request.getAttribute("errMessage")!= null) {
                        %>
                        <span style="font-size: 14px; color: red;"><%= request.getAttribute("errMessage") %></span>
                        <%
                    }
                    if(request.getAttribute("successMessage")!= null) {
                        %>
                        <span style="font-size: 14px; color: greenyellow;"><%= request.getAttribute("successMessage") %></span>
                        <%
                    }
                %>
            </div>
        </div>
    </body>
</html>