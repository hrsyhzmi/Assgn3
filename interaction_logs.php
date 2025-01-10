<?php
session_start();

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    die("User is not logged in.");
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

// Function to fetch interaction logs with pagination, filtering, and sorting
function fetch_interaction_logs($page = 1, $filter_api = '', $filter_function = '', $filter_date = '', $sort = 'date_time') {
    global $pdo;
    $records_per_page = 15;
    $offset = ($page - 1) * $records_per_page;

    $sql = "SELECT il.id, u.username, il.api_accessed, il.function_used, il.date_time 
        FROM interaction_logs il 
        JOIN users u ON il.user_id = u.user_id 
        WHERE il.api_accessed LIKE :filter_api 
        AND il.function_used LIKE :filter_function 
        AND il.date_time LIKE :filter_date 
        ORDER BY $sort 
        LIMIT :offset, :records_per_page";

    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':filter_api', "%$filter_api%", PDO::PARAM_STR);
    $stmt->bindValue(':filter_function', "%$filter_function%", PDO::PARAM_STR);
    $stmt->bindValue(':filter_date', "%$filter_date%", PDO::PARAM_STR);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->bindValue(':records_per_page', $records_per_page, PDO::PARAM_INT);
    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch total record count for pagination
function get_total_record_count($filter_api = '', $filter_function = '', $filter_date = '') {
    global $pdo;
    $sql = "SELECT COUNT(*) FROM interaction_logs 
            WHERE api_accessed LIKE :filter_api 
            AND function_used LIKE :filter_function 
            AND date_time LIKE :filter_date";
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':filter_api', "%$filter_api%", PDO::PARAM_STR);
    $stmt->bindValue(':filter_function', "%$filter_function%", PDO::PARAM_STR);
    $stmt->bindValue(':filter_date', "%$filter_date%", PDO::PARAM_STR);
    $stmt->execute();
    return $stmt->fetchColumn();
}

// Function to export logs to CSV
function export_logs_to_csv($filter_api = '', $filter_function = '', $filter_date = '') {
    global $pdo;
    ob_clean();  // Clear the output buffer to ensure no other content is sent with the file
    $sql = "SELECT u.username, il.api_accessed, il.function_used, il.date_time 
            FROM interaction_logs il 
            JOIN users u ON il.user_id = u.user_id 
            WHERE il.api_accessed LIKE :filter_api 
            AND il.function_used LIKE :filter_function 
            AND il.date_time LIKE :filter_date";
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':filter_api', "%$filter_api%", PDO::PARAM_STR);
    $stmt->bindValue(':filter_function', "%$filter_function%", PDO::PARAM_STR);
    $stmt->bindValue(':filter_date', "%$filter_date%", PDO::PARAM_STR);
    $stmt->execute();

    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="filtered_interaction_logs.csv"');

    $output = fopen('php://output', 'w');
    fputcsv($output, ['Username', 'API Accessed', 'Function Used', 'Date/Time']);

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        fputcsv($output, $row);
    }

    fclose($output);
    exit();  // Exit to prevent further script execution
}


// Handle export request
if (isset($_GET['export'])) {
    $filter_api = $_GET['filter_api'] ?? '';
    $filter_function = $_GET['filter_function'] ?? '';
    $filter_date = $_GET['filter_date'] ?? '';
    export_logs_to_csv($filter_api, $filter_function, $filter_date);
    exit();
}

// Handle page and filter input
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$filter_api = $_GET['filter_api'] ?? '';
$filter_function = $_GET['filter_function'] ?? '';
$filter_date = $_GET['filter_date'] ?? '';
$total_records = get_total_record_count($filter_api, $filter_function, $filter_date);
$logs = fetch_interaction_logs($page, $filter_api, $filter_function, $filter_date);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Interaction Logs</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4 text-center">User Interaction Logs</h1>
        <form method="get" class="row g-3 mb-3">
            <div class="mb-3">
            <a href="index.html" class="btn btn-primary">Home</a>
            </div>
            <div class="col-md-3">
                <input type="text" name="filter_api" value="<?= htmlspecialchars($filter_api) ?>" class="form-control" placeholder="Filter by API">
            </div>
            <div class="col-md-3">
                <input type="text" name="filter_function" value="<?= htmlspecialchars($filter_function) ?>" class="form-control" placeholder="Filter by Function">
            </div>
            <div class="col-md-3">
                <input type="date" name="filter_date" value="<?= htmlspecialchars($filter_date) ?>" class="form-control" placeholder="Filter by Date">
            </div>
            <div class="col-md-3 d-flex">
                <button type="submit" class="btn btn-secondary me-2">Filter</button>
                <a href="?export=true&filter_api=<?= urlencode($filter_api) ?>&filter_function=<?= urlencode($filter_function) ?>&filter_date=<?= urlencode($filter_date) ?>" class="btn btn-success" target="_blank">Export CSV</a>


            </div>
        </form>

        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>NO</th>
                    <th>User</th>
                    <th>API Accessed</th>
                    <th>Function Used</th>
                    <th>Date/Time</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($logs as $row): ?>
                    <tr>
                        <td><?= $row['id'] ?></td>
                        <td><?= htmlspecialchars($row['username']) ?></td>
                        <td><?= htmlspecialchars($row['api_accessed']) ?></td>
                        <td><?= htmlspecialchars($row['function_used']) ?></td>
                        <td><?= htmlspecialchars($row['date_time']) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <!-- Pagination -->
        <nav>
            <ul class="pagination justify-content-center">
                <?php for ($i = 1; $i <= ceil($total_records / 15); $i++): ?>
                    <li class="page-item <?= ($i == $page) ? 'active' : '' ?>">
                        <a class="page-link" href="?page=<?= $i ?>&filter_api=<?= urlencode($filter_api) ?>&filter_function=<?= urlencode($filter_function) ?>&filter_date=<?= urlencode($filter_date) ?>"><?= $i ?></a>
                    </li>
                <?php endfor; ?>
            </ul>
        </nav>
    </div>
</body>
</html>
