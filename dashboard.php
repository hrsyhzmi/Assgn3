<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    // Redirect to login page if not logged in
    header("Location: login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="dashboard-page">
    <header>
    <h1>Welcome to 3in1 Apps</h1>
        <h2>Get News, Weather, and Know Your Calories in One App!!</h2>
    </header>

    <div class="button-container">
        <button onclick="window.location.href='news.php'">News</button>
        <button onclick="window.location.href='weather.php'">Weather</button>
        <button onclick="window.location.href='calorie.php'">Calories Calculator</button>
        <button onclick="window.location.href='index.html'">Logout</button>
    </div>
    </div>
</body>
</html>
