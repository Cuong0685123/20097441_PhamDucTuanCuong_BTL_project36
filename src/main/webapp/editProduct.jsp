<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Product,service.ProductService" %>
<%
    String id = request.getParameter("id");
    ProductService productService = new ProductService();
    Product product = productService.getProductById(Integer.parseInt(id));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sửa sản phẩm</title>
</head>
<body>
    <h2>Sửa sản phẩm</h2>
    <form action="/20097441_PhamDucTuanCuong_BTL/products" method="post">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="${product.id}">
        <label for="name">Tên sản phẩm:</label>
        <input type="text" name="name" value="${product.name}" required><br>
        <label for="price">Giá:</label>
        <input type="number" step="0.01" name="price" value="${product.price}" required><br>
        <label for="discount">Giảm giá (%):</label>
        <input type="number" name="discount" value="${product.discount}" required><br>
        <label for="imageUrl">Đường dẫn hình ảnh:</label>
        <input type="text" name="imageUrl" value="${product.imageUrl}" required><br>
        <label for="soldCount">Đã bán:</label>
        <input type="number" name="soldCount" value="${product.soldCount}" required><br>
        <label for="rating">Đánh giá:</label>
        <input type="number" step="0.1" name="rating" value="${product.rating}" required><br>
        <label for="reviewCount">Số lượng đánh giá:</label>
        <input type="number" name="reviewCount" value="${product.reviewCount}" required><br>
        <button type="submit">Cập nhật</button>
    </form>
</body>
</html>
