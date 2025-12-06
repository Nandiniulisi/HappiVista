package com.event.controller;

import java.io.IOException;

import com.event.dao.UserDAO;
import com.event.model.User;
import com.event.util.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ---------------------------
        // Get & trim form parameters
        // ---------------------------
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        if (name != null) name = name.trim();
        if (email != null) email = email.trim();
        if (phone != null) phone = phone.trim();
        if (password != null) password = password.trim();

        // ---------------------------
        // Input validation
        // ---------------------------
        if (name == null || name.isEmpty() ||
            email == null || email.isEmpty() ||
            phone == null || phone.isEmpty() ||
            password == null || password.isEmpty()) {
            response.sendRedirect("register.jsp?msg=empty");
            return;
        }

        UserDAO dao = new UserDAO();

        // ---------------------------
        // Check if user already exists
        // ---------------------------
        if (dao.getUserByEmail(email) != null) {
            response.sendRedirect("register.jsp?msg=exists");
            return;
        }

        try {
            // ---------------------------
            // Generate salt & hashed password
            // ---------------------------
            String salt = PasswordUtil.generateSalt();
            String hashedPassword = PasswordUtil.hash(password, salt);

            // ---------------------------
            // Create User object
            // ---------------------------
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setSalt(salt);
            user.setPasswordHash(hashedPassword);
            user.setRole("attender");

            // ---------------------------
            // Register user
            // ---------------------------
            boolean ok = dao.register(user);

            if (ok) {
                response.sendRedirect("login.jsp?msg=registered");
            } else {
                response.sendRedirect("register.jsp?msg=error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?msg=error");
        }
    }
}
