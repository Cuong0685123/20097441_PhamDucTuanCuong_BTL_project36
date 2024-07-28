package dao;

import model.Order;
import model.OrderItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class OrderDAO extends BaseDAO {

    public int insertOrder(Order order) throws SQLException {
        String sql = "INSERT INTO orders (customer_name, customer_age, customer_address, customer_phone, total_price) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, order.getCustomerName());
            statement.setInt(2, order.getCustomerAge());
            statement.setString(3, order.getCustomerAddress());
            statement.setString(4, order.getCustomerPhone());
            statement.setDouble(5, order.getTotalPrice());
            int affectedRows = statement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            } else {
                throw new SQLException("Creating order failed, no rows affected.");
            }
        }
        return 0;
    }

    public void insertOrderItems(int orderId, List<OrderItem> orderItems) throws SQLException {
        String sql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            for (OrderItem item : orderItems) {
                statement.setInt(1, orderId);
                statement.setInt(2, item.getProductId());
                statement.setInt(3, item.getQuantity());
                statement.setDouble(4, item.getPrice());
                statement.addBatch();
            }
            statement.executeBatch();
        }
    }
}
