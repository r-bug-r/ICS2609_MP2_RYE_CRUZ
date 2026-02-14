<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login | Sheif Lab</title>
        <style>
            :root {
                --primary: #3b82f6;
                --background: #0f172a;
                --card: #1e293b;
                --text: #f8fafc;
            }
            body {
                background-color: var(--background);
                color: var(--text);
                font-family: 'Inter', system-ui, sans-serif;
                display: flex;
                flex-direction: column;
                min-hieght: 100vh;
                margin: 0;
            }
            header, footer {
                padding: 2rem;
                text-align: center;
                background: rgba(30, 41, 59, 0.5);
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }
            main {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 2rem;
            }
            .card {
                background: var(--card);
                padding: 2.5rem;
                border-radius: 1rem;
                box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                width: 100%;
                max-width: 400px;
                border: 1px solid rgba(255, 255, 255, 0.05);
            }
            .input-group {
                margin-bottom: 1.5rem;
            }
            label {
                display: block;
                margin-bottom: 0.5rem;
                font-size: 0.875rem;
                opacity: 0.8;
            }
            input {
                width: 100%;
                padding: 0.75rem;
                background: rgba(15, 23, 42, 0.5);
                border: 1px solid rgba(255, 255, 255, 0.1);
                border-radius: 0.5rem;
                color: white;
                box-sizing: border-box;
            }
            button {
                width: 100%;
                padding: 0.75rem;
                background: var(--primary);
                color: white;
                border: none;
                border-radius: 0.5rem;
                font-weight: 600;
                cursor: pointer;
                transition: opacity 0.2s;
            }
            button:hover { opacity: 0.9; }
        </style>
    </head>
    <body>
        <header>
            <h1>${initParam.headerTitle}</h1>
        </header>
        
        <main>
            <div class="card">
                <form action="LoginServlet" method="POST">
                    <div class="input-group">
                        <label>Username</label>
                        <input type="text" name="username" placeholder="Enter username">
                    </div>
                    <div class="input-group">
                        <label>Password</label>
                        <input type="password" name="password" placeholder="Enter password">
                    </div>
                    <button type="submit">Login to Console</button>
                </form>
            </div>
        </main>

        <footer>
            <p>${initParam.footerText}</p>
        </footer>
    </body>
</html>
