<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Prevent back button caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Session validation
    if (session.getAttribute("user") == null) {
        response.sendRedirect("error_session.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard | Sheif Lab</title>
        <style>
            :root {
                --primary: #3b82f6;
                --background: #0f172a;
                --text: #f8fafc;
            }
            body { background: var(--background); color: var(--text); font-family: sans-serif; text-align: center; margin: 0; }
            header, footer { padding: 2rem; background: rgba(30, 41, 59, 0.5); }
            .container { padding: 5rem; }
            .badge { background: var(--primary); padding: 0.25rem 0.75rem; border-radius: 9999px; font-size: 0.8rem; }
            .btn-logout { display: inline-block; margin-top: 2rem; color: #ef4444; text-decoration: none; border: 1px solid #ef4444; padding: 0.5rem 1rem; border-radius: 0.5rem; }
        </style>
    </head>
    <body>
        <header>
            <h1>System Console</h1>
        </header>

        <div class="container">
            <h2>Welcome, <%= session.getAttribute("user") %>!</h2>
            <p>Your System Role: <span class="badge"><%= session.getAttribute("role") %></span></p>
            <a href="LogoutServlet" class="btn-logout">Terminate Session</a>
        </div>

        <footer>
            <p>${initParam.footerText}</p>
        </footer>
    </body>
</html>
