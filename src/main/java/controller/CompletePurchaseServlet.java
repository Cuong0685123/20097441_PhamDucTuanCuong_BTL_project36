package controller;

import model.Order;
import service.OrderService;
import util.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/completePurchase")
public class CompletePurchaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        Connection connection = DatabaseConnection.getConnection();
        if (connection == null) {
            throw new ServletException("Failed to establish a database connection.");
        }
        orderService = new OrderService(connection);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdStr = request.getParameter("productId");
        String quantityStr = request.getParameter("quantity");
        String totalPriceStr = request.getParameter("totalPrice");
        String name = request.getParameter("name");
        String ageStr = request.getParameter("age");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        try {
            int productId = Integer.parseInt(productIdStr);
            int quantity = Integer.parseInt(quantityStr);
            double totalPrice = Double.parseDouble(totalPriceStr); // Sử dụng double thay vì int
            int age = Integer.parseInt(ageStr);

            Order order = new Order(0, productId, quantity, totalPrice, name, age, address, phone);
            orderService.createOrder(order);

            request.setAttribute("order", order);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/confirmPurchase.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException | SQLException e) {
            throw new ServletException("Error creating order", e);
        }
    }
}
