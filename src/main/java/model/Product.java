package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private int discount;
    private String imageUrl;
    private int soldCount;
    private double rating;
    private int reviewCount;

    // Constructor, getters, and setters
    public Product(int id, String name, double price, int discount, String imageUrl, int soldCount, double rating, int reviewCount) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.imageUrl = imageUrl;
        this.soldCount = soldCount;
        this.rating = rating;
        this.reviewCount = reviewCount;
    }

    public Product() {}

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public int getDiscount() { return discount; }
    public void setDiscount(int discount) { this.discount = discount; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public int getSoldCount() { return soldCount; }
    public void setSoldCount(int soldCount) { this.soldCount = soldCount; }
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }
    public int getReviewCount() { return reviewCount; }
    public void setReviewCount(int reviewCount) { this.reviewCount = reviewCount; }
}
