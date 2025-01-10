<?php
require_once 'db_connection.php';  // Use the PDO database connection file

$emailError = $usernameError = $passwordError = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $repeatPassword = $_POST['repeat_password'];

    // Validate input
    if ($password !== $repeatPassword) {
        $passwordError = "Passwords do not match.";
    } elseif (!preg_match('/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$/', $password)) {
        $passwordError = "Password must be at least 8 characters long, include 1 uppercase letter, 1 lowercase letter, and 1 number.";
    } else {
        try {
            // Prepare the SQL statement to check for existing username or email
            $stmt = $pdo->prepare("SELECT username, email FROM users WHERE username = :username OR email = :email");
            $stmt->bindParam(':username', $username);
            $stmt->bindParam(':email', $email);
            $stmt->execute();

            $result = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($result) {
                if ($result['username'] === $username) {
                    $usernameError = "Username already taken.";
                }
                if ($result['email'] === $email) {
                    $emailError = "Email already registered.";
                }
            } else {
                // Hash the password before storing it in the database
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

                // Prepare the SQL statement to insert a new user
                $insertStmt = $pdo->prepare("INSERT INTO users (username, email, password) VALUES (:username, :email, :password)");
                $insertStmt->bindParam(':username', $username);
                $insertStmt->bindParam(':email', $email);
                $insertStmt->bindParam(':password', $hashedPassword);

                if ($insertStmt->execute()) {
                    // Redirect to login page after successful registration
                    header("Location: login.php");
                    exit();
                } else {
                    echo "Error: " . $insertStmt->errorInfo();
                }
            }
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}

// Close the connection by setting it to null
$pdo = null;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="register-page">
    <div class="register-container">
        <h2>Register</h2>
        <form method="POST" action="register.php">
            <label for="username">Username:</label><br>
            <input type="text" id="username" name="username" required>
            <div class="error"><?= $usernameError ?></div><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required>
            <div class="error"><?= $emailError ?></div><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required>
            <div class="error"><?= $passwordError ?></div><br>

            <label for="repeat_password">Repeat Password:</label><br>
            <input type="password" id="repeat_password" name="repeat_password" required>
            <br>

            <button type="submit">Register</button>
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="login.php">Login</a></p>
        </div>
    </div>
</body>
</html>
