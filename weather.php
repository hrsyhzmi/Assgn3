<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

// Function to log user interaction
function log_user_interaction($user_id, $api_accessed, $function_used) {
    include('db_connection.php'); // Include database connection
    
    try {
        $sql = "INSERT INTO interaction_logs (user_id, api_accessed, function_used) VALUES (?, ?, ?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$user_id, $api_accessed, $function_used]);
    } catch (PDOException $e) {
        echo "Error logging interaction: " . $e->getMessage();
    }
}

if (isset($_POST['place'])) {
    $place = urlencode($_POST['place']);
    $apiKey = '8af25ddaf967173cbd6f2cc9b8e08cb3';
    $url = "https://api.openweathermap.org/data/2.5/forecast?q={$place}&appid={$apiKey}&units=metric";

    $response = file_get_contents($url);
    $responseData = json_decode($response, true);

    // Check if the API response contains an error
    if (isset($responseData['cod']) && $responseData['cod'] !== "200") {
        echo json_encode(["error" => "The place not found."]);
    } else {
        // Log the user interaction if successful
        log_user_interaction($_SESSION['user_id'], 'Weather API', 'Fetch Weather');
        echo $response;
    }
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="weather-page">
    <div class="sidebar weather-page">
        <h2>Menu</h2>
        <ul>
            <li><a href="news.php">News</a></li>
            <li><a href="calorie.php">Calorie</a></li>
            <li><a href="dashboard.php">Back</a></li>
        </ul>
    </div>

    <div class="content weather-page">
        <h1>Weather</h1>
        <form id="weatherForm" method="POST">
            <label for="place">Place:</label>
            <input type="text" id="place" name="place" required class="weather-page"><br><br>
            <button type="button" onclick="fetchWeather()" class="weather-page">Get Weather</button>
        </form>

        <table id="weatherTable" class="weather-page">
            <thead>
                <tr>
                    <th>Date-Time</th>
                    <th>Temperature</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <script>
        function fetchWeather() {
            const place = document.getElementById("place").value;

            const formData = new FormData();
            formData.append('place', place);

            fetch('', { 
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                const weatherTable = document.getElementById("weatherTable").getElementsByTagName('tbody')[0];
                weatherTable.innerHTML = '';

 // Handle the error message
 if (data.error) {
                const row = weatherTable.insertRow();
                row.innerHTML = `
                    <td colspan="3" style="color: red; text-align: center;">${data.error}</td>
                `;
                return;
            }


                const dailyEntries = data.list.slice(0, 8);

                dailyEntries.forEach(entry => {
                    const row = weatherTable.insertRow();
                    row.innerHTML = ` 
                        <td>${new Date(entry.dt_txt).toLocaleString()}</td>
                        <td>${entry.main.temp} °C</td>
                        <td>${entry.weather[0].description}</td>
                    `;
                });
            })


            .catch(error => {
            const weatherTable = document.getElementById("weatherTable").getElementsByTagName('tbody')[0];
            weatherTable.innerHTML = `
                <tr>
                    <td colspan="3" style="color: red; text-align: center;">No place found.</td>
                </tr>
            `;
            console.error('Error:', error);
        });
        }
    </script>
</body>
</html>
