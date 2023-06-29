<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <span class="navbar-brand my-2"><h2 class="mb-0">EasyMove</h2></span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <% if (session.getAttribute("userlevel").equals("customer")) {%>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="rent.jsp">Reserve</a>
                </li>
                <% } else {%>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="car_manage.jsp">Manage Car</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="rent_manage.jsp">Reservation List</a>
                </li>
                <% }%> 

            </ul>
            <span class="dropdown">
                <a class="nav-link dropdown-toggle" style="color: white;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
                    Hi, 
                    <% if (session.getAttribute("userlevel").equals("customer")) {%>
                    <%= session.getAttribute("customer_id")%>
                    <% } else {%><%= session.getAttribute("admin_id")%>
                    <% }%> 
                </a>
                <span class="dropdown-menu">
                    <a class="dropdown-item" href="/EasyMove/LogoutServlet">Logout</a>
                </span>
            </span>
        </div>
    </div>
</nav>
