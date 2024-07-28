<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
    <header>
        <h2>Đăng Ký Tài Khoản</h2>
    </header>
    <main>
        <form action="user" method="post">
            <input type="hidden" name="action" value="register">
            <div>
                <label for="username">Tên Đăng Nhập:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div>
                <label for="password">Mật Khẩu:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div>
                <label for="role">Vai Trò:</label>
                <select id="role" name="role" required>
                    <option value="employee">Nhân Viên</option>
                    <option value="customer">Khách Hàng</option>
                </select>
            </div>
            <div>
                <button type="submit">Đăng Ký</button>
            </div>
        </form>
    </main>
</div>
</body>
</html>
