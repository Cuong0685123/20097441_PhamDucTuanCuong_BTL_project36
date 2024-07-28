package controller;

import model.Cart;
import model.Order;
import model.OrderItem;
import model.Product;
import service.OrderService;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
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
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        String customerName = request.getParameter("name");
        String customerAgeStr = request.getParameter("age");
        String customerAddress = request.getParameter("address");
        String customerPhone = request.getParameter("phone");

        try {
            int customerAge = Integer.parseInt(customerAgeStr);
            double totalPrice = cart.getTotalPrice();

            Order order = new Order();
            order.setCustomerName(customerName);
            order.setCustomerAge(customerAge);
            order.setCustomerAddress(customerAddress);
            order.setCustomerPhone(customerPhone);
            order.setTotalPrice(totalPrice);

            int orderId = orderService.createOrder(order);

            List<OrderItem> orderItems = new ArrayList<>();
            for (Map.Entry<Product, Integer> entry : cart.getItems().entrySet()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderId(orderId);
                orderItem.setProductId(entry.getKey().getId());
                orderItem.setQuantity(entry.getValue());
                orderItem.setPrice(entry.getKey().getPrice());
                orderItems.add(orderItem);
            }

            orderService.createOrderItems(orderId, orderItems);

            session.removeAttribute("cart");

            request.setAttribute("order", order);
            request.setAttribute("orderItems", orderItems);
            request.getRequestDispatcher("confirmPurchas.jsp").forward(request, response);
        } catch (NumberFormatException | SQLException e) {
            throw new ServletException("Error processing order", e);
        }
    }
}
