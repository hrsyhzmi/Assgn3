<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Function to log user interaction (server-side)
function log_user_interaction($user_id, $api_accessed, $function_used) {
    include('db_connection.php'); // Include your database connection

    try {
        $sql = "INSERT INTO interaction_logs (user_id, api_accessed, function_used) VALUES (?, ?, ?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$user_id, $api_accessed, $function_used]);
    } catch (PDOException $e) {
        echo "Error logging interaction: " . $e->getMessage();
    }
}

// Handle AJAX request for logging
if (isset($_POST['log_interaction'])) {
    log_user_interaction($_SESSION['user_id'], 'News API', $_POST['function_used']);
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="news-page">
    <div class="sidebar">
        <ul>
            <li><a href="weather.php">Weather</a></li>
            <li><a href="calorie.php">Calorie</a></li>
            <li><a href="dashboard.php">Back</a></li>
        </ul>
    </div>

    <div class="main-content">
        <h1>Top News</h1>
        <div class="search-bar">
            <input type="text" id="news-search" placeholder="Search news...">
            <select id="news-section">
                <option value="home">Home</option>
                <option value="world">World</option>
                <option value="technology">Technology</option>
                <option value="science">Science</option>
                <option value="health">Health</option>
                <option value="sports">Sports</option>
            </select>
            <button id="search-button">Search</button>
        </div>

        <div id="news-container">
            <!-- News articles will be loaded here dynamically -->
        </div>
    </div>

<script>
    $(document).ready(function() {
        const apiKey = 'TYvxdFGtbPHNqMJpvTEEGcN29cnvGWzE';
        const apiUrl = 'https://api.nytimes.com/svc/topstories/v2/{section}.json?api-key=' + apiKey;

        // Function to load top news for a selected section
        function loadTopNews(section = 'home') {
            fetchNews(section);
        }

        // Function to fetch news
        function fetchNews(section, query = '') {
            const url = apiUrl.replace('{section}', section);

            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Failed to fetch news');
                    }
                    return response.json();
                })
                .then(data => {
                    if (!data.results) {
                        throw new Error('No articles found');
                    }
                    // Filter articles based on the search query (if provided)
                    const filteredArticles = query
                        ? data.results.filter(article =>
                              article.title.toLowerCase().includes(query.toLowerCase())
                          )
                        : data.results;

                    displayNews(filteredArticles);
                    logUserInteraction(`Fetch News for ${section}${query ? ` with query "${query}"` : ''}`);
                })
                .catch(error => {
                    console.error("Error fetching news:", error);
                    $("#news-container").html("<p>Error loading news. Please try again later.</p>");
                });
        }

        // Function to display news articles
        function displayNews(articles) {
            const container = $("#news-container");
            container.empty();

            if (!articles || articles.length === 0) {
                container.html("<p>No news articles found.</p>");
                return;
            }

            articles.forEach(article => {
                const newsItem = `
                    <div class="news-item">
                        <img src="${article.multimedia && article.multimedia.length > 0 ? article.multimedia[0].url : 'default-image-path.jpg'}" alt="News Image" class="news-image">
                        <div class="news-details">
                            <h2><a href="${article.url}" target="_blank">${article.title}</a></h2>
                            <p>${article.abstract || 'No description available.'}</p>
                            <p class="news-meta">Published on: ${new Date(article.published_date).toLocaleDateString()}</p>
                        </div>
                    </div>
                `;
                container.append(newsItem);
            });
        }

        // Log user interaction with PHP (AJAX call)
        function logUserInteraction(functionUsed) {
            $.ajax({
                url: 'news.php',
                method: 'POST',
                data: {
                    log_interaction: true,
                    function_used: functionUsed
                },
                success: function(response) {
                    console.log('User interaction logged.');
                }
            });
        }

        // Load top news on page load
        loadTopNews();

        // Search button functionality
        $("#search-button").click(function() {
            const section = $("#news-section").val();
            const query = $("#news-search").val();
            fetchNews(section, query);

            // Log the search functionality interaction
            logUserInteraction(`Search News for ${section} with query "${query}"`);
        });
    });
</script>

</body>
</html>
