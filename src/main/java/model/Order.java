package model;

public class Order {
    private int id;
    private int productId;
    private int quantity;
    private double totalPrice;
    private String customerName;
    private int customerAge;
    private String customerAddress;
    private String customerPhone;

    // Constructors
    public Order() {}

    public Order(int id, int productId, int quantity, double totalPrice, String customerName, int customerAge, String customerAddress, String customerPhone) {
        this.id = id;
        this.productId = productId;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.customerName = customerName;
        this.customerAge = customerAge;
        this.customerAddress = customerAddress;
        this.customerPhone = customerPhone;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public int getCustomerAge() { return customerAge; }
    public void setCustomerAge(int customerAge) { this.customerAge = customerAge; }

    public String getCustomerAddress() { return customerAddress; }
    public void setCustomerAddress(String customerAddress) { this.customerAddress = customerAddress; }

    public String getCustomerPhone() { return customerPhone; }
    public void setCustomerPhone(String customerPhone) { this.customerPhone = customerPhone; }
}
