<%
    if((session.getAttribute("logged") == null)) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List errorMsg = (List) request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyMove: Error!</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>
            <div class="main">
                <div class="col-md-5 mx-auto my-5 py-5 text-center">
                    <h1 class="display-4">Error!</h1>
                    <ul>
                    <%
                        Iterator errors = errorMsg.iterator();
                        while (errors.hasNext()) {
                            String msg = (String) errors.next();
                    %>
                    <li><%= msg%></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </body>
</html>
