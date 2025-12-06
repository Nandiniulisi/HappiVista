<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HappiVista</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;

            /* BACKGROUND IMAGE CONFIGURATION */
            background-image: url("${pageContext.request.contextPath}/assets/gold_background3.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
        }

        /* Navigation Bar */
        .navbar {
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* LOGO + TITLE wrapper */
        .logo-area {
            display: flex;
            align-items: center;
        }

        /* Logo image */
        .logo {
            height: 95px;   /* Change as needed */
            width: auto;
            margin-right: 10px;
        }

        /* 🟩 Title Color Changed to BLACK */
        .navbar .title {
            color: black;
            font-size: 22px;
            font-weight: bold;
        }

        /* Updated → Black Links */
        .navbar a {
            color: black;
            text-decoration: none;
            margin-left: 20px;
            font-size: 18px;
            font-weight: 600;
        }

        .navbar a:hover {
            color: #333;
        }

        /* Content Wrapper */
        .content-wrapper {
            text-align: center;
            margin-top: 100px;
        }
        
        /* Main Content Box */
        .container {
            text-align: center;
            padding: 40px;
            border-radius: 10px;
            display: inline-block;
            max-width: 800px;
        }

        h1 {
            font-size: 40px;
            color: #333;
            margin-top: 0;
        }
        h2 {
            color: #444;
            font-weight: normal;
        }
        p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #666;
        }
        
        .btn {
            background-color: #2e8b57;
            color: white;
            padding: 12px 25px;
            margin: 10px;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #256b45;
        }

        .learn-more {
            margin-top: 20px;
            font-size: 17px;
            color: #555;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <div class="navbar">

        <!-- LOGO + TITLE -->
        <div class="logo-area">
            <img src="${pageContext.request.contextPath}/assets/HappiVista_logo.png" class="logo" alt="Logo" />
            <div class="title">HappiVista</div>
        </div>

        <div>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </div>

    <div class="content-wrapper">
        <div class="container">
            <h1>Welcome to HappiVista</h1>
            <h2>Turning your happiest visions into reality</h2>
            <h2>From idea to celebration — HappiVista makes it seamless</h2>
        </div>
    </div>

</body>

</html>
