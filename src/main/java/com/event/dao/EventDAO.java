package com.event.dao;

import java.sql.*;
import java.util.*;
import com.event.model.Event;
import com.event.util.DBConnection;

public class EventDAO {

    // -----------------------
    // MAP RESULTSET TO EVENT
    // -----------------------
    private Event mapEvent(ResultSet rs) throws SQLException {
        Event e = new Event();
        e.setId(rs.getInt("id"));
        e.setTitle(rs.getString("title"));
        e.setDescription(rs.getString("description"));
        e.setDate(rs.getDate("date").toLocalDate()); // Convert SQL Date → LocalDate
        e.setLocation(rs.getString("location"));
        e.setCreatedBy(rs.getInt("createdBy"));
        e.setCreatedAt(rs.getTimestamp("createdAt"));
        return e;
    }

    // -----------------------
    // CREATE EVENT
    // -----------------------
    public boolean createEvent(Event event) {
        String sql = "INSERT INTO events (title, description, date, location, createdBy) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, event.getTitle());
            ps.setString(2, event.getDescription());
            ps.setDate(3, java.sql.Date.valueOf(event.getDate())); // LocalDate → SQL Date
            ps.setString(4, event.getLocation());
            ps.setInt(5, event.getCreatedBy());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // -----------------------
    // GET EVENTS BY USER
    // -----------------------
    public List<Event> getEventsByUser(int userId) {
        List<Event> list = new ArrayList<>();
        String sql = "SELECT * FROM events WHERE createdBy = ? ORDER BY date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapEvent(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // -----------------------
    // GET ALL EVENTS
    // -----------------------
    public List<Event> getAllEvents() {
        List<Event> list = new ArrayList<>();
        String sql = "SELECT * FROM events ORDER BY date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapEvent(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
