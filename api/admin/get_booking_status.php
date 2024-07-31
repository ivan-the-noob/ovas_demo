<?php
include('appointment.php'); // Adjust the path as necessary

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $date = $_POST['date'];
    $user_id = $_POST['user_id']; // Assuming you have user_id in your session or request

    $query = "SELECT * FROM appointment_list WHERE user_id='$user_id' AND DATE(date_created)='$date'";
    $result = mysqli_query($conn, $query);
    $appointments = [];

    while ($row = mysqli_fetch_assoc($result)) {
        $appointments[] = $row;
    }

    echo json_encode($appointments);
}
?>
