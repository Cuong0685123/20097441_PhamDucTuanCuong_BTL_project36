<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Thanh toán</h1>
    </header>
    <main>
        <h2>Thông tin giao hàng</h2>
        <form action="checkout" method="post">
            <label for="name">Tên:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="age">Tuổi:</label>
            <input type="number" id="age" name="age" required>
            
            <label for="address">Địa chỉ:</label>
            <input type="text" id="address" name="address" required>
            
            <label for="phone">Số điện thoại:</label>
            <input type="text" id="phone" name="phone" required>
            
            <input type="submit" value="Hoàn tất thanh toán">
        </form>
    </main>
    <footer>
        <p>&copy; 2024 Quà Quê Việt</p>
    </footer>
</div>
</body>
</html>
