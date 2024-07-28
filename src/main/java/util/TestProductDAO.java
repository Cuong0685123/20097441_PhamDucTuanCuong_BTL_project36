package util;

import model.Product;

import java.util.List;

import dao.ProductDAO;

public class TestProductDAO {
    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.selectAllProducts();
        
        for (Product product : products) {
            System.out.println("ID: " + product.getId());
            System.out.println("Name: " + product.getName());
            System.out.println("Price: " + product.getPrice());
            System.out.println("Discount: " + product.getDiscount());
            System.out.println("Image URL: " + product.getImageUrl());
            System.out.println("Sold Count: " + product.getSoldCount());
            System.out.println("Rating: " + product.getRating());
            System.out.println("Review Count: " + product.getReviewCount());
            System.out.println("===================================");
        }
    }
}
