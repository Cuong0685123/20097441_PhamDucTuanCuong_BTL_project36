package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDAO extends BaseDAO {
    private static final String SELECT_ALL_PRODUCTS_SQL = "SELECT * FROM product";
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO product (name, price, discount, imageUrl, soldCount, rating, reviewCount) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_PRODUCT_BY_ID_SQL = "SELECT * FROM product WHERE id = ?";

    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL_PRODUCTS_SQL);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id")); // Assuming 'id' is the primary key
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getInt("discount"));
                product.setImageUrl(rs.getString("imageUrl"));
                product.setSoldCount(rs.getInt("soldCount"));
                product.setRating(rs.getDouble("rating"));
                product.setReviewCount(rs.getInt("reviewCount"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public void insertProduct(Product product) {
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            pstmt.setString(1, product.getName());
            pstmt.setDouble(2, product.getPrice());
            pstmt.setInt(3, product.getDiscount());
            pstmt.setString(4, product.getImageUrl());
            pstmt.setInt(5, product.getSoldCount());
            pstmt.setDouble(6, product.getRating());
            pstmt.setInt(7, product.getReviewCount());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Product selectProductById(int id) {
        Product product = null;
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_BY_ID_SQL)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setDiscount(rs.getInt("discount"));
                    product.setImageUrl(rs.getString("imageUrl"));
                    product.setSoldCount(rs.getInt("soldCount"));
                    product.setRating(rs.getDouble("rating"));
                    product.setReviewCount(rs.getInt("reviewCount"));
                    
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
    public Product getProductById(int productId) throws SQLException {
        String sql = "SELECT * FROM product WHERE id = ?";
        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setInt(1, productId);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setDiscount(rs.getInt("discount"));
                    product.setImageUrl(rs.getString("imageUrl"));
                    product.setSoldCount(rs.getInt("soldCount"));
                    product.setRating(rs.getDouble("rating"));
                    product.setReviewCount(rs.getInt("reviewCount"));
                    return product;
                } else {
                    return null; // Hoặc ném ngoại lệ nếu không tìm thấy sản phẩm
                }
            }
        }
    }
    
}

