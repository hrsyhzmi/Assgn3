<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    // Redirect to login page if not logged in
    header("Location: login.php");
    exit();
}

include('db_connection.php'); // Include database connection

// Function to log user interaction
function log_user_interaction($user_id, $api_accessed, $function_used) {
    global $pdo;

    try {
        $sql = "INSERT INTO interaction_logs (user_id, api_accessed, function_used) VALUES (?, ?, ?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$user_id, $api_accessed, $function_used]);
        echo "Interaction logged successfully!";
    } catch (PDOException $e) {
        echo "Error logging interaction: " . $e->getMessage();
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Log the interaction for Calorie API
    log_user_interaction($_SESSION['user_id'], 'Calorie API', 'Calculate Calorie Burn');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calorie Burn Calculator</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="calorie-page">
    <div class="sidebar">
        <ul>
            <li><a href="news.php">News</a></li>
            <li><a href="weather.php">Weather</a></li>
            <li><a href="dashboard.php">Back</a></li>
        </ul>
    </div>

    <div class="container">
        <h1>Calorie Burn Calculator</h1>
        
        <!-- Calorie Form -->
        <form method="POST" id="calorieForm">
            <div class="mb-3">
                <label for="activity" class="form-label">Activity</label>
                <input type="text" id="activity" class="form-control" placeholder="e.g., running, cycling" required>
            </div>
            <div class="mb-3">
                <label for="weight" class="form-label">Weight (kg)</label>
                <input type="number" id="weight" class="form-control" placeholder="Enter your weight in kg" required>
            </div>
            <div class="mb-3">
                <label for="duration" class="form-label">Duration (minutes)</label>
                <input type="number" id="duration" class="form-control" placeholder="Enter duration in minutes" required>
            </div>
            <button type="submit" class="btn btn-primary">Calculate</button>
        </form>

        <hr>

        <!-- Results Display Area -->
        <div id="results" class="mt-4"></div>
    </div>

    <script>
        document.getElementById('calorieForm').addEventListener('submit', function(e) {
            e.preventDefault();

            const activity = document.getElementById('activity').value.trim();
            const weight = parseFloat(document.getElementById('weight').value);
            const duration = parseFloat(document.getElementById('duration').value);

            // Input validation
            if (weight <= 0 || duration <= 0) {
                alert('Please enter valid weight and duration values greater than zero.');
                return;
            }

            if (weight > 300) {
                alert('The entered weight seems unrealistic. Please check your input.');
                return;
            }

            if (duration > 300) {
                alert('Duration seems too high. Please ensure it’s entered in minutes.');
                return;
            }

            // API request to Calorie API
            const apiUrl = `https://api.api-ninjas.com/v1/caloriesburned?activity=${activity}`;
            const apiKey = '0fp390MsLF//2IXBNkGPtw==51rt9IdJjJfqEluM';

            fetch(apiUrl, {
                method: 'GET',
                headers: { 'X-Api-Key': apiKey },
                contentType: 'application/json'
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`Error: ${response.statusText}`);
                }
                return response.json();
            })
            .then(data => {
                if (data.length === 0) {
                    document.getElementById('results').innerText = 'No results found for the specified activity.';
                    return;
                }

                // Perform calorie calculations
                const defaultCalories = data[0].calories_per_hour;
                const defaultWeight = 70; // Average weight for default calculation
                const defaultDuration = 60; // Default duration for calculation
                const adjustedCalories = (defaultCalories / defaultWeight) * weight * (duration / defaultDuration);

                // Categorize calorie burn
                let calorieCategory = '';
                if (adjustedCalories < 100) {
                    calorieCategory = 'low';
                } else if (adjustedCalories <= 500) {
                    calorieCategory = 'moderate';
                } else {
                    calorieCategory = 'high';
                }

                // Weekly calorie calculation (example frequency: 3 times per week)
                const weeklyFrequency = 3;
                const weeklyCalories = adjustedCalories * weeklyFrequency;

                // Display results
                let resultsText = `For the activity "${activity}", you burned approximately ${adjustedCalories.toFixed(2)} kcal in ${duration} minutes.`;
                resultsText += `\nThis activity falls under the "${calorieCategory}" calorie burn category.`;
                resultsText += `\nIf you perform this activity ${weeklyFrequency} times per week, you'll burn approximately ${weeklyCalories.toFixed(2)} kcal per week.`;

                // Provide suggestions based on calorie burn
                if (adjustedCalories < 200) {
                    resultsText += '\nConsider increasing the duration or choosing a higher-intensity activity to burn more calories.';
                } else if (adjustedCalories > 500) {
                    resultsText += '\nGreat job! You’ve burned a significant amount of calories. Keep it up!';
                }

                document.getElementById('results').innerText = resultsText;

                // Log the interaction
                fetch('calorie.php', {
                    method: 'POST',
                    body: new FormData(document.getElementById('calorieForm'))
                });
            })
            .catch(error => {
                console.error(error);
                document.getElementById('results').innerText = 'An error occurred. Please try again later.';
            });
        });
    </script>
</body>
</html>
