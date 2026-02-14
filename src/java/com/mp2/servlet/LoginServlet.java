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

        try {
            // NullValueException Check
            if ((user == null || user.trim().isEmpty()) && (pass == null || pass.trim().isEmpty())) {
                throw new NullValueException("Username and Password are required.");
            }

            try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
                // Check if user exists
                String sql = "SELECT * FROM USERS WHERE username = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, user);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String dbPassVal = rs.getString("password");
                    String role = rs.getString("role");

                    if (dbPassVal.equals(pass)) {
                        // Success
                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);
                        session.setAttribute("role", role);
                        response.sendRedirect("success.jsp");
                    } else {
                        // Correct user, wrong password (error_2)
                        response.sendRedirect("error_2.jsp");
                    }
                } else {
                    // Username not found
                    if (pass == null || pass.trim().isEmpty()) {
                        // error_1.jsp (Username not in DB, password blank)
                        response.sendRedirect("error_1.jsp");
                    } else {
                        // error_3.jsp (Username and password both incorrect, not blank)
                        response.sendRedirect("error_3.jsp");
                    }
                }
            }
        } catch (NullValueException e) {
            throw new ServletException(e); // noLoginCredentials.jsp
        } catch (SQLException e) {
            // Log the actual DB error
            e.printStackTrace();
            throw new ServletException("Database Error", e);
        }
    }
}
