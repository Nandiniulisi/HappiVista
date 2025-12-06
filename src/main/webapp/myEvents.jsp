<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ page import="java.util.List, com.event.model.Event, com.event.dao.EventDAO"%>

<%
    // Session check
    Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    EventDAO dao = new EventDAO();
    List<Event> events = dao.getEventsByUser(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Events</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #8BC6EC 0%, #9599E2 100%);
            margin: 0;
            padding: 0;
        }

        .navbar {
            background: rgba(255,255,255,0.2);
            padding: 15px 40px;
            color: white;
            font-size: 20px;
            font-weight: 600;
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: space-between;
        }

        .container {
            width: 85%;
            margin: 40px auto;
        }

        .title {
            text-align: center;
            font-size: 34px;
            font-weight: 700;
            color: white;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            background: rgba(255,255,255,0.2);
            backdrop-filter: blur(10px);
        }

        th {
            background: rgba(0,0,0,0.25);
            color: white;
            padding: 15px;
            font-size: 17px;
        }

        td {
            padding: 14px;
            color: #000;
            background: rgba(255,255,255,0.4);
            font-weight: 500;
        }

        tr:nth-child(even) td {
            background: rgba(255,255,255,0.6);
        }

        .no-events {
            text-align: center;
            padding: 20px;
            font-size: 20px;
            color: white;
            backdrop-filter: blur(10px);
        }

        .links {
            margin-top: 30px;
            text-align: center;
        }

        .btn {
            padding: 12px 22px;
            background: #4b79a1;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            margin: 10px;
            display: inline-block;
            transition: 0.3s;
        }

        .btn:hover {
            background: #35516f;
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <div class="navbar">
        <div>Event Management</div>
        <div>
            <a href="dashboard.jsp" class="btn" style="padding:8px 18px;">Dashboard</a>
            <a href="LogoutServlet" class="btn" style="padding:8px 18px; background:#d9534f;">Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="title">My Events</div>

        <table>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Date</th>
                <th>Location</th>
                <th>Created At</th>
            </tr>

            <%
                if (events != null && !events.isEmpty()) {
                    for (Event e : events) {
            %>
            <tr>
                <td><%= e.getTitle() %></td>
                <td><%= e.getDescription() %></td>
                <td><%= e.getDate() %></td>
                <td><%= e.getLocation() %></td>
                <td><%= e.getCreatedAt() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5" class="no-events">You have not created any events.</td>
            </tr>
            <%
                }
            %>
        </table>

        <div class="links">
            <a href="addEvent.jsp" class="btn">Add New Event</a>
            <a href="viewEvents.jsp" class="btn">View All Events</a>
        </div>
    </div>

</body>
</html>
