/*
 * Project: ICS2609 MP2
 * Developers: Bugtong, Ryekarlo P. & Cruz, Fulbert Francis A.
 */
package com.mp2.servlet;

import com.mp2.exception.AuthenticationException;
import com.mp2.exception.NullValueException;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private String dbURL;
    private String dbUser;
    private String dbPass;
    private String dbDriver;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dbDriver = config.getInitParameter("dbDriver");
        dbURL = config.getInitParameter("dbURL");
        dbUser = config.getInitParameter("dbUser");
        dbPass = config.getInitParameter("dbPassword");
        
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // Normalize inputs
        if (user == null) user = "";
        if (pass == null) pass = "";
        user = user.trim();
        pass = pass.trim();

        try {
            // NullValueException Check: Both username and password left blank
            if (user.isEmpty() && pass.isEmpty()) {
                throw new NullValueException("Credentials missing");
            }

            try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
                String sql = "SELECT * FROM USERS WHERE username = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, user);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String dbPassVal = rs.getString("password");
                    String role = rs.getString("role");

                    if (dbPassVal.equals(pass)) {
                        // Success Page
                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);
                        session.setAttribute("role", role);
                        response.sendRedirect("success.jsp");
                        return;
                    } else {
                        // Error 2: Correct username, incorrect password
                        response.sendRedirect("error_2.jsp");
                        return;
                    }
                } else {
                    // Username not found in DB
                    if (pass.isEmpty()) {
                        // Error 1: Username not in DB, password blank
                        response.sendRedirect("error_1.jsp");
                        return;
                    } else {
                        // Error 3: Both incorrect (not blank)
                        response.sendRedirect("error_3.jsp");
                        return;
                    }
                }
            }
        } catch (NullValueException e) {
            // Map to noLoginCredentials.jsp
            throw new ServletException(e);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error_3.jsp");
            return;
        }
    }
}
