package com.techm.inventory.service;

import java.util.List;

import com.techm.inventory.dto.LoginRequest;
import com.techm.inventory.model.User;

import jakarta.servlet.http.HttpSession;

public interface UserService {

    public User userRegistration(User user, HttpSession session);

    public User userLogin(LoginRequest loginRequest);

    public User editUserDetails(User user);

    public User editUserByAdmin(User user);

    public User getUserById(Integer userId);

    public List<User> getAllUsers();

    public List<User> getAllActiveCustomers();
    public List<User> getAllCustomers();

}
