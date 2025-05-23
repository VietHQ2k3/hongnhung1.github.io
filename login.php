<?php
// login.php
session_start();
require_once "config.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Lấy thông tin từ form
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    // Truy vấn thông tin người dùng dựa trên email
    $sql = "SELECT * FROM users WHERE email = ?";
    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            if (password_verify($password, $row['password'])) {
                session_regenerate_id(true);
                $_SESSION['user_id'] = $row['user_id'];
                $_SESSION['username'] = $row['username'];
                $_SESSION['role'] = $row['role'];
                header("location: dashboard.php");
                exit;
            } else {
                $error = "Mật khẩu không đúng.";
            }
        } else {
            $error = "Không tìm thấy tài khoản với email này.";
        }
    } else {
        $error = "Lỗi hệ thống, vui lòng thử lại sau.";
    }
}
?>

<?php
session_start();
require_once "config.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE email = ?";
    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            if (password_verify($password, $row['password'])) {
                session_regenerate_id(true);
                $_SESSION['user_id'] = $row['user_id'];
                $_SESSION['username'] = $row['username'];
                $_SESSION['role'] = $row['role'];
                header("location: dashboard.php");
                exit;
            } else {
                header("Location: index.html?error=" . urlencode("Mật khẩu không đúng."));
                exit;
            }
        } else {
            header("Location: index.html?error=" . urlencode("Không tìm thấy tài khoản với email này."));
            exit;
        }
    } else {
        header("Location: index.html?error=" . urlencode("Lỗi hệ thống, vui lòng thử lại sau."));
        exit;
    }
} else {
    header("Location: index.html");
    exit;
}
