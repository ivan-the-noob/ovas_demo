<?php
include 'config.php';

// Ensure session is started only if not already active
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$error_message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM user WHERE username='$username'";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        if (password_verify($password, $row['password'])) {
            $_SESSION['username'] = $username;
            header("Location: index.php");
            exit();
        } else {
            $error_message = 'Incorrect Password';
        }
    } else {
        $error_message = 'Username does not exist';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        header {
            background-color: white;
            width: 100%;
            padding: 8px 0;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1500px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .admin-login-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: orange;
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .admin-login-button:hover {
            background-color: darkorange;
        }

        body {
            font-family: Arial, sans-serif;
            background: url('https://wallpaper.dog/large/20612597.jpg') center center/cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #fff;
            padding: 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            width: 350px;
        }

        .login-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-container button:hover {
            background-color: #0056b3;
        }

        #login-nav {
            position: fixed !important;
            top: 0 !important;
            z-index: 1037;
            padding: 0.3em 2.5em !important;
        }

        #top-Nav {
            top: 2.3em;
        }

        .text-sm .layout-navbar-fixed .wrapper .main-header ~ .content-wrapper, 
        .layout-navbar-fixed .wrapper .main-header.text-sm ~ .content-wrapper {
            margin-top: calc(3.6) !important;
            padding-top: calc(3.2em) !important
        }
    </style>

    <script>
        function showError(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <header>
        <div class="header-container">
            <div class="logo">
                <!-- You can put a logo here if you want -->
            </div>
            <div class="login-link">
                <a href="./admin">Admin Login</a>
            </div>
        </div>
    </header>

    <div class="login-container">
        <center><h1>Login</h1></center>
        <form method="POST" action="login1.php">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <div class="login-link">
            <center>Don't have an account? <a href="register.php">Register</a></center>
        </div>
    </div>

    <?php
    if (!empty($error_message)) {
        echo "<script>showError('$error_message');</script>";
    }
    ?>
</body>
</html>
