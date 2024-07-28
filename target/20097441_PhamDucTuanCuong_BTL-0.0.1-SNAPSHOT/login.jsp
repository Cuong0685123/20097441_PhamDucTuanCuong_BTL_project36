<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
    <header>
        <h2>Đăng Nhập</h2>
    </header>
    <main>
        <form action="user" method="post">
            <input type="hidden" name="action" value="login">
            <div>
                <label for="username">Tên Đăng Nhập:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div>
                <label for="password">Mật Khẩu:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div>
                <button type="submit">Đăng Nhập</button>
            </div>
            <div>
                <a href="register.jsp">Chưa có tài khoản? Đăng ký ngay</a>
            </div>
        </form>
        <% if(request.getParameter("error") != null) { %>
            <p style="color:red;">Tên đăng nhập hoặc mật khẩu không chính xác</p>
        <% } %>
    </main>
</div>
</body>
</html>
