package service;

import dao.OrderDAO;
import model.Order;
import model.OrderItem;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class OrderService {
    private OrderDAO orderDAO;

    public OrderService(Connection connection) {
        this.orderDAO = new OrderDAO(); // Khởi tạo DAO mà không cần kết nối ở đây
    }

    public int createOrder(Order order) throws SQLException {
        return orderDAO.insertOrder(order);
    }

    public void createOrderItems(int orderId, List<OrderItem> orderItems) throws SQLException {
        orderDAO.insertOrderItems(orderId, orderItems);
    }
}
