<?php
session_start();
require_once 'db_connection.php'; // Ensure this is correctly included

$emailError = $passwordError = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Check if email exists in the database using PDO
    try {
        $stmt = $pdo->prepare("SELECT * FROM users WHERE email = :email");
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Verify the password
            if (password_verify($password, $user['password'])) {
                $_SESSION['user_id'] = $user['user_id'];
                var_dump($_SESSION); // Check if session is set
                header("Location: dashboard.php");
                exit();
            } else {
                $passwordError = "Invalid password.";
            }
        } else {
            $emailError = "No user found with that email.";
        }

        $stmt = null;
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="login-page">
    <div class="login-container">
        <h2>Login</h2>
        <form method="POST" action="login.php">
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required>
            <div class="error"><?= $emailError ?></div><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required>
            <div class="error"><?= $passwordError ?></div><br>

            <button type="submit">Login</button>
        </form>
        <div class="register-link">
            <p>Don't have an account? <a href="register.php">Register</a></p>
            <p><a href="forgot_password.php">Forgot Password?</a></p>
        </div>
    </div>
</body>
</html>
