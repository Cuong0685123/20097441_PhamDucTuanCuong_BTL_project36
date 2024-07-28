package controller;

import model.Product;
import model.User;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addProduct")
public class AddProductController extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null && "employee".equals(user.getRole())) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            String imageUrl = request.getParameter("imageUrl");
            int soldCount = Integer.parseInt(request.getParameter("soldCount"));
            double rating = Double.parseDouble(request.getParameter("rating"));
            int reviewCount = Integer.parseInt(request.getParameter("reviewCount"));

            Product product = new Product();
            product.setName(name);
            product.setPrice(price);
            product.setDiscount(discount);
            product.setImageUrl(imageUrl);
            product.setSoldCount(soldCount);
            product.setRating(rating);
            product.setReviewCount(reviewCount);

            productService.addProduct(product);

            response.sendRedirect("addProduct.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
