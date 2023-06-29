<%
    if((session.getAttribute("logged") == null)) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyMove: Rent a car today!</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>
        <div class="main">
            <div class="col-md-5 mx-auto my-5 py-5 text-center">
                <h1 class="display-4 typewriter">Feel your dream. &nbsp;&nbsp;&nbsp;</h1>
                <p class="lead">Have a taste the feeling of driving any of your dream car now. Over 10+ cars available waiting to be on journey with you!</p>
            <% if(session.getAttribute("userlevel").equals("customer")) { %>
                <a class="px-3 btn btn-warning" href="rent.jsp">Rent now!</a>
                <% } %>
            </div>
        </div>
    </body>
</html>
