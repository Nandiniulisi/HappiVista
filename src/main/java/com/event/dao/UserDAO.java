package com.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.event.model.User;
import com.event.util.DBConnection;

public class UserDAO {

    // -----------------------
    // MAP RESULTSET TO USER
    // -----------------------
    private User mapUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setPasswordHash(rs.getString("password_hash"));
        user.setSalt(rs.getString("salt"));
        user.setRole(rs.getString("role"));
        user.setPhone(rs.getString("phone"));
        return user;
    }

    // -----------------------
    // REGISTER USER
    // -----------------------
    public boolean register(User user) {
        String sql = "INSERT INTO users (name, email, password_hash, salt, role, phone) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPasswordHash());
            ps.setString(4, user.getSalt());
            ps.setString(5, user.getRole());
            ps.setString(6, user.getPhone());

            int rows = ps.executeUpdate();
            System.out.println("Rows inserted: " + rows); // Debugging
            return rows > 0;

        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // -----------------------
    // GET USER BY EMAIL
    // -----------------------
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email.trim());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapUser(rs);
            }

        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
