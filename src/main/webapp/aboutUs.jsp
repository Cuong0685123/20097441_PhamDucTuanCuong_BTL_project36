<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Về Chúng Tôi</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #e60000;
            padding: 10px;
        }
        
        .logo img {
            height: 50px;
        }
        
        .top-nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }
        
        .top-nav ul li {
            color: white;
        }
        
        .main-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #a00000;
            padding: 10px;
        }
        
        .main-nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
        }
        
        .main-nav ul li {
            color: white;
        }
        
        .search {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .search input {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        
        .search button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            background-color: #ff0000;
            color: white;
        }
        
        main {
            padding: 20px;
        }
        
        .about-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: left; /* Căn trái các dòng ghi chú */
        }
        
        .about-section img {
            max-width: 100%;
            height: auto;
            margin: 20px 0;
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
            <li><a href="/20097441_PhamDucTuanCuong_BTL/about.jsp"><button>Về chúng tôi</button></a></li>
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
        <div class="about-section">
            <h1>Về Chúng Tôi</h1>
            <section>
                <h2>Giới thiệu về công ty</h2>
                <p>Quà Quê Việt chuyên cung cấp các sản phẩm Quà Tặng thân thiện và gần gủi với mọi gia đình Việt Nam gồm: Đồ Phong Thuỷ.</p>
                <p>Quà Quê Việt nơi mua sắm online, offline chất lượng, uy tín và giá rẻ. Nếu bạn là người đam mê mua sắm mà vẫn chưa tìm được một shop chuyên bán online và cả offline chất lượng, uy tín và có giá rẻ thì hãy tham khảo bài viết sau đây nhé.</p>
                <p>Hiểu được nhu cầu mua sắm ngày càng gia tăng và đặc biệt là những bạn trẻ ngày càng ưa chuộng cách thức mua hàng online nên Quà Quê Việt ngoài bán hàng offline thì còn cung cấp thêm dịch vụ bán qua mạng và giao hàng tận nhà.</p>
                <img src="images/about_us.png" alt="Về chúng tôi">
            </section>
            <section>
                <h2>Đồ Phong Thuỷ</h2>
                <p>Với ý nghĩ mang lại sự may mắn, tài lộc cho chủ nhân nên đây là sản phẩm luôn được nhiều người lựa chọn. Mặt hàng này có rất nhiều mẫu mã khác nhau như tỳ hưu, cóc ngậm tiền, gậy như ý, mèo cầu tài, kỳ lân gỗ,...được lựa chọn phù hợp với tuổi tác và cung mệnh của khách hàng.</p>
                <img src="images/team.png" alt="Đồ Phong Thuỷ của chúng tôi">
            </section>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Quà Quê Việt</p>
    </footer>
</div>
</body>
</html>
