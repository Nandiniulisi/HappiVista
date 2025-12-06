<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | HappiVista</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
		 * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: 'Roboto', sans-serif;
   		 }

    	body {
        margin: 0;
        padding: 0;
        background-image: url("${pageContext.request.contextPath}/assets/gold_background11.jpg");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;

        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    	}
        .container {
            background-color: #fff;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
            animation: fadeIn 1s ease;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        label {
            font-weight: 500;
            color: #555;
        }

        input[type="email"], 
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        input[type="email"]:focus, 
        input[type="password"]:focus {
            border-color: #feb47b;
            box-shadow: 0 0 5px rgba(254,180,123,0.5);
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #feb47b;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #ff7e5f;
        }

        .alert {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            text-align: center;
            font-weight: 500;
        }

        .alert.success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert.error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #feb47b;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #ff7e5f;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px);}
            to { opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login</h1>

        <%
            String msg = request.getParameter("msg");
            if (msg != null) {
                if ("invalid".equals(msg)) {
        %>
                    <div class="alert error">Invalid email or password.</div>
        <%
                } else if ("registered".equals(msg)) {
        %>
                    <div class="alert success">Registration successful! Please login.</div>
        <%
                }
            }
        %>

        <form action="login" method="post">
            <label>Email:</label>
            <input type="email" name="email" placeholder="Enter your email" required>

            <label>Password:</label>
            <input type="password" name="password" placeholder="Enter your password" required>

            <input type="submit" value="Login">
        </form>

        <a href="register.jsp">Don't have an account? Register</a>
    </div>
</body>
</html>
