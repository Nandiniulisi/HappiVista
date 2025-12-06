<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.event.model.Event, com.event.dao.EventDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
        }

        /* Navbar */
        .navbar {
            background-color: #2f3640;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar .title {
            color: white;
            font-size: 22px;
            font-weight: bold;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 18px;
        }

        /* Container */
        .container {
            width: 95%;
            margin: 30px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2f3640;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn-view {
            padding: 6px 12px;
            background-color: #2e8b57;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

    </style>

</head>
<body>

<div class="navbar">
    <div class="title">Dashboard</div>
    <div>
        <a href="addEvent.jsp">Add Event</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="container">

    <h2>All Events</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Date</th>
                <th>Location</th>
                <th>Description</th>
                <th>Created By</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                EventDAO dao = new EventDAO();
                List<Event> events = dao.getAllEvents();

                if (events != null && !events.isEmpty()) {
                    for (Event e : events) {
            %>

            <tr>
                <td><%= e.getId() %></td>
                <td><%= e.getTitle() %></td>
                <td><%= e.getDate() %></td>
                <td><%= e.getLocation() %></td>
                <td><%= e.getDescription() %></td>
                <td><%= e.getCreatedBy() %></td>
                <td>
                    <a class="btn-view" href="viewEvent.jsp?id=<%= e.getId() %>">View</a>
                </td>
            </tr>

            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7" style="text-align:center;">No events found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

</div>

</body>
</html>
