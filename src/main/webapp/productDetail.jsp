<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
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
        <c:if test="${sessionScope.role == 'employee'}">
            <div class="add-product">
                <a href="/20097441_PhamDucTuanCuong_BTL/addProduct.jsp">
                    <button>Thêm sản phẩm</button>
                </a>
            </div>
        </c:if>
    </nav>
    <main>
        <h2>Chi tiết sản phẩm</h2>
        <div class="product-detail">
            <img src="${product.imageUrl}" alt="${product.name}">
            <h3>${product.name}</h3>
            <p>Giá: ${product.price} VNĐ</p>
            <p>Giảm giá: ${product.discount}%</p>
            <p>Đã bán: ${product.soldCount}</p>
            <p>Đánh giá: ${product.rating} (${product.reviewCount} đánh giá)</p>
            
            <!-- Thêm form để thêm sản phẩm vào giỏ hàng -->
            <form action="/20097441_PhamDucTuanCuong_BTL/addToCart" method="post">
                <input type="hidden" name="productId" value="${product.id}">
                <label for="quantity">Số lượng:</label>
                <input type="number" id="quantity" name="quantity" value="1" min="1">
                <button type="submit">Thêm vào giỏ hàng</button>
            </form>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Quà Quê Việt</p>
    </footer>
</div>
</body>
</html>
