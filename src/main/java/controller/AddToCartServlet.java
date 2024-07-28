package controller;

import model.Cart;
import model.Product;
import service.ProductService;
import util.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() throws ServletException {
        Connection connection = DatabaseConnection.getConnection();
        if (connection == null) {
            throw new ServletException("Failed to establish a database connection.");
        }
        productService = new ProductService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId;
        int quantity;
        try {
            // Lấy thông tin sản phẩm từ form
            productId = Integer.parseInt(request.getParameter("productId"));
            quantity = Integer.parseInt(request.getParameter("quantity"));

            // Lấy giỏ hàng từ session
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            // Lấy sản phẩm từ cơ sở dữ liệu
            Product product = productService.getProductById(productId);
            if (product == null) {
                response.sendRedirect("error.jsp"); // Hoặc trang khác nếu sản phẩm không tồn tại
                return;
            }

            // Thêm sản phẩm vào giỏ hàng
            cart.addProduct(product, quantity);

            // Chuyển hướng đến trang giỏ hàng hoặc trang trước đó
            response.sendRedirect("cart.jsp");
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid input format", e);
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
