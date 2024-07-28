package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String jdbcURL = "jdbc:mariadb://localhost:3303/shop";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "root";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Connection established successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Connection failed.");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.err.println("Driver not found.");
        }
        return connection;
    }
}
