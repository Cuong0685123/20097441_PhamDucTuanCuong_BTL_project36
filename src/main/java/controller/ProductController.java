package controller;

import model.Product;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService(); // Tạo đối tượng service
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.getAllProducts(); // Lấy tất cả sản phẩm
        request.setAttribute("productList", productList); // Đặt danh sách sản phẩm vào request
        RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
        dispatcher.forward(request, response); // Chuyển tiếp đến JSP
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");

        if (!"employee".equals(role)) {
            response.sendRedirect("accessDenied.jsp");
            return;
        }

        // Xử lý thêm sản phẩm (có thể thêm vào đây)
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        String imageUrl = request.getParameter("imageUrl");
        int soldCount = Integer.parseInt(request.getParameter("soldCount"));
        double rating = Double.parseDouble(request.getParameter("rating"));
        int reviewCount = Integer.parseInt(request.getParameter("reviewCount"));

        Product newProduct = new Product();
        newProduct.setName(name);
        newProduct.setPrice(price);
        newProduct.setDiscount(discount);
        newProduct.setImageUrl(imageUrl);
        newProduct.setSoldCount(soldCount);
        newProduct.setRating(rating);
        newProduct.setReviewCount(reviewCount);

        productService.addProduct(newProduct);

        response.sendRedirect("products"); // Chuyển hướng đến danh sách sản phẩm
    }
}
