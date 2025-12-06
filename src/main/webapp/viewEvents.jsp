<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ page import="java.util.List, com.event.model.Event, com.event.dao.EventDAO, java.time.format.DateTimeFormatter"%>

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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Events | HappiVista</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            padding-top: 50px;
        }

        .container {
            width: 95%;
            max-width: 1200px;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            animation: fadeIn 1s ease;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #185a9d;
        }

        .alert {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            text-align: center;
            font-weight: 500;
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        thead th {
            background-color: #43cea2;
            color: white;
            font-weight: 600;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #d1ffd6;
        }

        .highlight {
            background-color: #ffeaa7 !important;
            font-weight: bold;
        }

        a {
            display: inline-block;
            margin-right: 15px;
            padding: 10px 20px;
            background-color: #43cea2;
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            transition: background 0.3s ease;
        }

        a:hover {
            background-color: #185a9d;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px);}
            to { opacity: 1; transform: translateY(0);}
        }

        @media(max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            th, td {
                padding: 10px;
                text-align: right;
                position: relative;
            }

            th::before, td::before {
                position: absolute;
                left: 10px;
                font-weight: 600;
            }

            tbody tr {
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 8px;
                padding: 10px;
            }

            thead {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>All Events</h1>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) { %>
                <div class="alert"><%= message %></div>
        <% } %>

        <%
            List<Event> events = (List<Event>) request.getAttribute("events");
            if (events == null) {
                EventDAO dao = new EventDAO();
                events = dao.getAllEvents();
            }
        %>

        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Location</th>
                    <th>Created By (User ID)</th>
                    <th>Created At</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (events != null && !events.isEmpty()) {
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy");
                        boolean isFirst = true;

                        for (Event e : events) {
                %>
                            <tr class="<%= isFirst ? "highlight" : "" %>">
                                <td><%= e.getTitle() %></td>
                                <td><%= e.getDescription() %></td>
                                <td><%= e.getDate().format(formatter) %></td>
                                <td><%= e.getLocation() %></td>
                                <td><%= e.getCreatedBy() %></td>
                                <td><%= e.getCreatedAt() != null ? e.getCreatedAt() : "" %></td>
                            </tr>
                <%
                            isFirst = false;
                        }
                    } else { %>
                        <tr>
                            <td colspan="6" style="text-align:center;">No events found.</td>
                        </tr>
                <% } %>
            </tbody>
        </table>

        <a href="addEvent.jsp">Add New Event</a>
        <a href="myEvents.jsp">My Events</a>
    </div>
</body>
</html>
