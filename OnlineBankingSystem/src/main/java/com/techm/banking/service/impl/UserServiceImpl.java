package com.techm.banking.service.impl;

import com.techm.banking.model.User;
import com.techm.banking.repository.UserRepository;
import com.techm.banking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserRepository userRepository;

    @Override
    public Boolean registerUser(User user) {
        User user1 = userRepository.getUserByEmail(user.getEmail());
        if (user1 == null) {
            userRepository.save(user);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean authenticationUser(User user) {
        User u1 = userRepository.getUserByEmail(user.getEmail());
        return u1 != null && user.getPassword().equals(u1.getPassword());
    }

    @Override
    public Optional<User> getUserById(Integer userId) {
        return userRepository.findById(userId);
    }

    @Override
    public Optional<User> updateUser(User user, Integer userId) {
//        Optional<User> user1 = userRepository.findById(userId);
//        if (user1.isPresent()) {
//            user.setUserId(userId);
//            userRepository.save(user);
//        }
//        return user1;


        return Optional.ofNullable(userRepository.findById(userId).map(u -> {
            u.setUserId(userId);
            u.setEmail(user.getEmail());
            u.setPassword(user.getPassword());
            u.setMobile(user.getMobile());
            u.setAddress(user.getAddress());
            u.setFirstName(user.getFirstName());
            u.setLastName(user.getLastName());
            return userRepository.save(u);
        }).orElseThrow(() -> new IllegalArgumentException("Not a valid user")));
    }



}
