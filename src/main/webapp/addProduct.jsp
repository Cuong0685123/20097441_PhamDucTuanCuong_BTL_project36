<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thêm Sản Phẩm</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .login-button {
            margin-left: auto;
        }
        .main-nav ul {
            display: flex;
            list-style: none;
            padding: 0;
        }
        .main-nav ul li {
            margin-right: 20px;
        }
        .main-nav .category-button {
            margin-left: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <div class="logo">
            <img src="images/logo.png" alt="Logo">
        </div>
        <div class="top-nav">
            <ul>
                <li>Giao hàng nhanh</li>
                <li>Hoàn tiền</li>
                <li>Liên hệ</li>
                <li class="login-button">
                    <a href="/20097441_PhamDucTuanCuong_BTL/login.jsp"><button>Đăng nhập</button></a>
                </li>
            </ul>
        </div>
    </header>
    <nav class="main-nav">
        <ul>
            <li class="category-button">
                <a href="/20097441_PhamDucTuanCuong_BTL/products"><button>Danh mục sản phẩm</button></a>
            </li>
            <li>
                <a href="/20097441_PhamDucTuanCuong_BTL/aboutUs.jsp"><button>Về chúng tôi</button></a>
            </li>
            <li>Bản tin mỗi ngày</li>
        </ul>
        <div class="search">
            <input type="text" placeholder="Nhập nội dung tìm kiếm...">
            <button>Tìm kiếm</button>
        </div>
        <div class="add-product">
            <a href="/20097441_PhamDucTuanCuong_BTL/addProduct.jsp">
                <button>Thêm sản phẩm</button>
            </a>
        </div>
    </nav>
    <main>
        <h2>Thêm Sản Phẩm</h2>
        <form action="/20097441_PhamDucTuanCuong_BTL/products" method="Post">
            <div>
                <label for="name">Tên Sản Phẩm:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div>
                <label for="price">Giá:</label>
                <input type="number" id="price" name="price" step="0.01" required>
            </div>
            <div>
                <label for="discount">Giảm Giá (%):</label>
                <input type="number" id="discount" name="discount" min="0" max="100" required>
            </div>
            <div>
                <label for="imageUrl">URL Hình Ảnh:</label>
                <input type="text" id="imageUrl" name="imageUrl" required>
            </div>
            <div>
                <label for="soldCount">Số Lượng Đã Bán:</label>
                <input type="number" id="soldCount" name="soldCount" min="0" required>
            </div>
            <div>
                <label for="rating">Đánh Giá:</label>
                <input type="number" id="rating" name="rating" step="0.1" min="0" max="5" required>
            </div>
            <div>
                <label for="reviewCount">Số Lượng Đánh Giá:</label>
                <input type="number" id="reviewCount" name="reviewCount" min="0" required>
            </div>
            <div>
                <button type="submit">Thêm Sản Phẩm</button>
            </div>
        </form>
    </main>
    <footer>
        <p>&copy; 2024 Quà Quê Việt</p>
    </footer>
</div>
</body>
</html>
