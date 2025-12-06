<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<%
    Integer userId = null;
    if (session != null) {
        Object obj = session.getAttribute("userId");
        if (obj instanceof Integer) {
            userId = (Integer) obj;
        }
    }
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Event</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
         body {
            background-image: url("${pageContext.request.contextPath}/assets/gold_background11.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
         }

        .container-box {
            max-width: 600px;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand">HappiVista</a>
        <div>
            <a href="dashboard.jsp" class="btn btn-outline-light btn-sm">Dashboard</a>
            <a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
        </div>
    </div>
</nav>

<div class="container container-box mt-4">

    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Add New Event</h4>
        </div>

        <div class="card-body">

            <% String message = (String) request.getAttribute("message");
               if (message != null) { %>
                <div class="alert alert-info"><%= message %></div>
            <% } %>

            <form action="AddEventServlet" method="post">

                <div class="mb-3">
                    <label class="form-label">Event Title</label>
                    <input type="text" name="title" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description" rows="3" class="form-control"></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Date</label>
                    <input type="date" name="date" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Location</label>
                    <input type="text" name="location" class="form-control">
                </div>

                <button class="btn btn-success w-100">Add Event</button>

            </form>

            <hr>

            <div class="d-flex justify-content-between">
                <a href="viewEvents.jsp" class="btn btn-outline-primary">View All Events</a>
                <a href="myEvents.jsp" class="btn btn-outline-secondary">My Events</a>
            </div>

        </div>
    </div>

</div>

</body>
</html>
