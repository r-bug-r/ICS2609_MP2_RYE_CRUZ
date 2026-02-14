<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Missing Credentials</title>
        <style>
            body { background: #0f172a; color: white; font-family: sans-serif; text-align: center; padding: 5rem; }
            .btn { color: #3b82f6; text-decoration: none; border: 1px solid #3b82f6; padding: 0.5rem 1rem; border-radius: 0.5rem; }
        </style>
    </head>
    <body>
        <h1 style="color: #ef4444;">ERROR: NULL_VALUE_EXCEPTION</h1>
        <p>Login attempt failed because both the username and password fields were left empty.</p>
        <p>Please provide your credentials to access the system.</p>
        <br><br>
        <a href="index.jsp" class="btn">Back to Login</a>
    </body>
</html>
