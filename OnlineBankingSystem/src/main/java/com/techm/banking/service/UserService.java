package com.techm.banking.service;

import com.techm.banking.model.User;

import java.util.Optional;

public interface UserService {
    Boolean registerUser(User user);
    Boolean authenticationUser(User user);
    Optional<User> getUserById(Integer userId);
    Optional<User> updateUser(User user, Integer userId);
//    Optional<User> getUserByAccountNoAndPassword(String accountNo, String password );
}
