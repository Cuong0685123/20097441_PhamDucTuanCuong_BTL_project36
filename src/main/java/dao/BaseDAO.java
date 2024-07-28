package dao;

import java.sql.Connection;
import util.DatabaseConnection;

public abstract class BaseDAO {
    protected Connection getConnection() {
        return DatabaseConnection.getConnection();
    }
}
