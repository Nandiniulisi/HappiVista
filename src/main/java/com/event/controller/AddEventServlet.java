package com.event.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;

import com.event.dao.EventDAO;
import com.event.model.Event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // ---------------------------
        // Get form parameters
        // ---------------------------
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dateStr = request.getParameter("date");
        String location = request.getParameter("location");

        // ---------------------------
        // Validate required fields
        // ---------------------------
        if (title == null || title.isEmpty() || dateStr == null || dateStr.isEmpty()) {
            request.setAttribute("message", "Title and Date are required.");
            request.getRequestDispatcher("addEvent.jsp").forward(request, response);
            return;
        }

        // ---------------------------
        // Parse LocalDate
        // ---------------------------
        LocalDate eventDate;
        try {
            eventDate = LocalDate.parse(dateStr);  // expects YYYY-MM-DD format
        } catch (DateTimeParseException e) {
            request.setAttribute("message", "Invalid date format. Use YYYY-MM-DD.");
            request.getRequestDispatcher("addEvent.jsp").forward(request, response);
            return;
        }

        // ---------------------------
        // Check user session
        // ---------------------------
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int createdBy = (Integer) session.getAttribute("userId");

        // ---------------------------
        // Create Event object
        // ---------------------------
        Event event = new Event();
        event.setTitle(title);
        event.setDescription(description);
        event.setDate(eventDate);  // LocalDate
        event.setLocation(location);
        event.setCreatedBy(createdBy);

        // ---------------------------
        // Save event using DAO
        // ---------------------------
        EventDAO dao = new EventDAO();
        boolean success = dao.createEvent(event);

        // ---------------------------
        // Forward to events.jsp with updated list
        // ---------------------------
        List<Event> events = dao.getAllEvents(); // latest first

        request.setAttribute("events", events);

        if (success) {
            request.setAttribute("message", "Event created successfully!");
        } else {
            request.setAttribute("message", "Failed to create event. Try again.");
        }

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
