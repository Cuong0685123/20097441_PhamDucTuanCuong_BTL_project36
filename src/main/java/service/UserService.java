package service;

import dao.UserDAO;
import model.User;

public class UserService {
    private UserDAO userDAO;

    public UserService() {
        userDAO = new UserDAO();
    }

    public void registerUser(User user) {
        userDAO.registerUser(user);
    }

    public User validateUser(String username, String password) {
        return userDAO.validateUser(username, password);
    }
}
