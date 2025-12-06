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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            resp.sendRedirect("login.jsp?msg=empty");
            return;
        }

        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(email);

        // ❌ User not found
        if (user == null) {
            resp.sendRedirect("login.jsp?msg=invalid");
            return;
        }

        try {
            // Hash input password using stored salt
            String hashedInput = PasswordUtil.hash(password, user.getSalt());

            // Compare hashed values
            if (hashedInput.equals(user.getPasswordHash())) {

                // Start session for logged-in user
                HttpSession session = req.getSession();
                session.setAttribute("userId", user.getId());
                session.setAttribute("userName", user.getName());
                session.setAttribute("userEmail", user.getEmail());

                // Redirect to dashboard
                resp.sendRedirect("dashboard.jsp");

            } else {
                resp.sendRedirect("login.jsp?msg=invalid");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?msg=error");
        }
    }
}
