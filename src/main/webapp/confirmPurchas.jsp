<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Xác Nhận Đơn Hàng</title>
    <link rel="stylesheet" href="styles.css">
    <script>
        // Check for purchase success and show alert
        window.onload = function() {
            const purchaseSuccess = '<%= session.getAttribute("purchaseSuccess") != null ? session.getAttribute("purchaseSuccess") : false %>';
            if (purchaseSuccess) {
                alert('Thanh toán thành công! Cảm ơn bạn đã mua hàng.');
                <% session.removeAttribute("purchaseSuccess"); %> // Clear the attribute after displaying the alert
            }
        };
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
                    <button>Thêm sản phẩm</button>
                </a>
            </div>
        </c:if>
    </nav>
    <main>
        <h2>Xác Nhận Đơn Hàng</h2>
        <div class="purchase-confirmation">
            <p>Cảm ơn bạn đã mua hàng!</p>
            <h3>Thông Tin Đơn Hàng</h3>
            <p><strong>Tổng giá:</strong> ${order.totalPrice} VND</p>
            <p><strong>Tên khách hàng:</strong> ${order.customerName}</p>
            <p><strong>Tuổi:</strong> ${order.customerAge}</p>
            <p><strong>Địa chỉ giao hàng:</strong> ${order.customerAddress}</p>
            <p><strong>Số điện thoại:</strong> ${order.customerPhone}</p>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Quà Quê Việt</p>
    </footer>
</div>
</body>
</html>
