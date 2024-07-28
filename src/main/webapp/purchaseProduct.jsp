<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mua Sản Phẩm</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .product-detail {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
        }
        .product-image {
            flex: 1;
            max-width: 50%;
        }
        .product-form {
            flex: 1;
            max-width: 50%;
            margin-left: 20px;
        }
        .product-form div {
            margin-bottom: 10px;
        }
        .product-form label {
            display: block;
            margin-bottom: 5px;
        }
        .product-form input, .product-form span {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
    </style>
    <script>
        function updatePrice() {
            const quantity = document.getElementById('quantity').value;
            const price = parseFloat(document.getElementById('price').innerText);
            const total = quantity * price;
            document.getElementById('totalPrice').innerText = 'Tổng giá: ' + total + ' VND';
            document.getElementById('totalPriceInput').value = total;
        }
    </script>
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
                </a>
            </div>
        </c:if>
    </nav>
    <main>
        <h2>Mua Sản Phẩm</h2>
        <div class="product-detail">
            <div class="product-image">
                <img src="${product.imageUrl}" alt="${product.name}">
                <h3>${product.name}</h3>
                <p>Giá: <span id="price">${product.price}</span> VND</p>
            </div>
            <div class="product-form">
                <form action="/20097441_PhamDucTuanCuong_BTL/completePurchase" method="post">
                    <div>
                        <label for="productId">Product ID:</label>
                        <input type="text" id="productId" name="productId" value="${product.id}" readonly>
                    </div>
                    <div>
                        <label for="quantity">Số lượng:</label>
                        <input type="number" id="quantity" name="quantity" value="1" min="1" onchange="updatePrice()" required>
                    </div>
                    <div>
                        <label for="totalPrice">Tổng giá:</label>
                        <span id="totalPrice">Tổng giá: ${product.price} VND</span>
                    </div>
                    <input type="hidden" id="totalPriceInput" name="totalPrice" value="${product.price}">
                    <div>
                        <label for="name">Tên:</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div>
                        <label for="age">Tuổi:</label>
                        <input type="number" id="age" name="age" required>
                    </div>
                    <div>
                        <label for="address">Địa chỉ giao hàng:</label>
                        <input type="text" id="address" name="address" required>
                    </div>
                    <div>
                        <label for="phone">Số điện thoại:</label>
                        <input type="tel" id="phone" name="phone" required>
                    </div>
                    <button type="submit">Xác nhận mua</button>
                </form>
            </div>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Quà Quê Việt</p>
    </footer>
</div>
</body>
</html>
