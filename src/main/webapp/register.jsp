<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register | HappiVista</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Roboto', sans-serif; }

        body {
            background-image: url("${pageContext.request.contextPath}/assets/gold_background11.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
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

        h1 { text-align: center; margin-bottom: 30px; color: #333; }

        label { font-weight: 500; color: #555; }

        input[type="text"], 
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

        input[type="text"]:focus, 
        input[type="email"]:focus, 
        input[type="password"]:focus {
            border-color: #2575fc;
            box-shadow: 0 0 5px rgba(37,117,252,0.5);
            outline: none;
        }

        /* Updated button color to gold */
        input[type="submit"] {
    		width: 100%;
    		padding: 12px;
    		background: #FFEB3B; /* Full light gold */
    		border: none;
    		border-radius: 8px;
    		color: #333; /* Dark text for contrast */
    		font-size: 16px;
    		font-weight: 500;
    		cursor: pointer;
    		transition: background 0.3s ease, transform 0.2s ease;
		}

		input[type="submit"]:hover {
    		background: #FDC885; /* Slightly darker light gold on hover */
    		transform: scale(1.02);
}

        .alert {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            text-align: center;
            font-weight: 500;
        }

        .alert.success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .alert.error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #2575fc;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a:hover { color: #6a11cb; }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px);}
            to { opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Register</h1>

        <%
            String msg = request.getParameter("msg");
            if (msg != null) {
                switch(msg) {
                    case "error":
                        out.println("<div class='alert error'>Registration failed. Try again.</div>");
                        break;
                    case "registered":
                        out.println("<div class='alert success'>Registration successful! Please login.</div>");
                        break;
                    case "empty":
                        out.println("<div class='alert error'>Please fill all required fields.</div>");
                        break;
                    case "exists":
                        out.println("<div class='alert error'>Email already exists. Please login.</div>");
                        break;
                }
            }
        %>

        <form action="register" method="post">
            <label>Name:</label>
            <input type="text" name="name" placeholder="Enter your full name" required>

            <label>Email:</label>
            <input type="email" name="email" placeholder="Enter your email" required>

            <label>Phone:</label>
            <input type="text" name="phone" placeholder="Enter your phone number" required pattern="[0-9]{10}" title="Enter a 10-digit phone number">

            <label>Password:</label>
            <input type="password" name="password" placeholder="Enter a secure password" required>

            <input type="submit" value="Register">
        </form>

        <a href="login.jsp">Already have an account? Login</a>
    </div>
</body>
</html>



