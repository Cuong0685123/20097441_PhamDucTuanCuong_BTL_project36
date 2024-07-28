<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
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
        .filters {
            margin-bottom: 20px;
        }
        .filters button {
            margin-right: 10px;
        }
        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .product {
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px;
            width: 200px;
            text-align: center;
            box-sizing: border-box;
        }
        .product img {
            max-width: 100%;
            height: auto;
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
        <c:if test="${sessionScope.role == 'employee'}">
            <div class="add-product">
                <a href="/20097441_PhamDucTuanCuong_BTL/addProduct.jsp">
                    <button>Thêm sản phẩm</button>
                </a>
            </div>
        </c:if>
    </nav>
    <main>
        <h2>Đồ Phong Thủy</h2>
        <div class="filters">
         
        </div>
        <div class="product-list">
            <c:forEach var="product" items="${productList}">
                <div class="product">
                    <img src="${product.imageUrl}" alt="${product.name}">
                    <h3>${product.name}</h3>
                    <p>Giá: ${product.price} VNĐ</p>
                    <p>Giảm giá: ${product.discount}%</p>
                    <p>Đã bán: ${product.soldCount}</p>
                    <p>Đánh giá: ${product.rating} (${product.reviewCount} đánh giá)</p>
                    <a href="productDetail?id=${product.id}"><button>Chi tiết sản phẩm</button></a>
                    <a href="purchaseProduct?id=${product.id}"><button>Mua</button></a>
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
