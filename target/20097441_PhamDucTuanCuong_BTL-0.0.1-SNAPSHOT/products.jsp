<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="styles.css">
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
            </ul>
        </div>
    </header>
    <nav class="main-nav">
        <ul>
            <li>Danh mục sản phẩm</li>
            <li>Về chúng tôi</li>
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
        <h2>Đồ Phong Thủy</h2>
        <div class="filters">
            <button>Lọc theo giá</button>
            <button>Lọc sản phẩm</button>
        </div>
        <div class="product-list">
         <form action="/20097441_PhamDucTuanCuong_BTL/products" method="Post">
            <c:forEach var="product" items="${productList}">
                <div class="product">
                    <img src="${product.imageUrl}" alt="${product.name}">
                    <h3>${product.name}</h3>
                    <p>Giá: ${product.price}</p>
                    <p>Giảm giá: ${product.discount}%</p>
                    <p>Đã bán: ${product.soldCount}</p>
                    <p>Đánh giá: ${product.rating} (${product.reviewCount} đánh giá)</p>
                </div>
            </c:forEach>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Quà Quê Việt</p>
    </footer>
</div>
</body>
</html>
