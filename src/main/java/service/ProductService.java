package service;

import dao.ProductDAO;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private ProductDAO productDAO;

    public ProductService() {
        productDAO = new ProductDAO();
    }

    public List<Product> getAllProducts() {
        return productDAO.selectAllProducts();
    }

    public void addProduct(Product product) {
        productDAO.insertProduct(product);
    }

    public Product getProductById(int id)throws SQLException {
        return productDAO.selectProductById(id);
    }
    
  
}
