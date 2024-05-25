package com.techm.inventory.service.impl;

import com.techm.inventory.dto.LoginRequest;
import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.techm.inventory.model.User;
import com.techm.inventory.repository.UserRepository;
import com.techm.inventory.service.UserService;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostConstruct
    public void createDefaultAdmin() {
        if (userRepository.findUserByEmail("admin@gmail.com").isEmpty()) {
            User admin = new User();
            admin.setEmail("admin@gmail.com");
            admin.setPassword(passwordEncoder.encode("Admin@123"));
            admin.setFirstName("Admin");
            admin.setLastName(" RK ");
            admin.setRole("ADMIN");
            admin.setAccountCreationDate(LocalDateTime.now());
            userRepository.save(admin);
        }
    }

    /*Use Only Once if password is not encrypted initially*/

    /*
     * @PostConstruct public void encryptAllUsersPassword() { List<User> allUser =
     * userRepository.findAll(); for (User u : allUser) {
     * u.setPassword(passwordEncoder.encode(u.getPassword()));
     * userRepository.save(u); } }
     */

    @Override
    public User userRegistration(User user, HttpSession session) {
        Optional<User> checkExistingUser = userRepository.findUserByEmail(user.getEmail());
        System.out.println("Duplicate Email");
        if (checkExistingUser.isPresent()) {
            session.setAttribute("failMsg", "Email Id Already Exist !");
            return null;
        }
        session.setAttribute("succMsg", "Registration Successful");
        user.setAccountCreationDate(LocalDateTime.now());
        user.setRole("USER");
        user.setPassword(passwordEncoder.encode(user.getPassword()));
//		user.setRole("ROLE_USER"); //Role
        return userRepository.save(user);
    }

    @Override
    public User userLogin(LoginRequest loginRequest) {
        Optional<User> userOptional = userRepository.findUserByEmail(loginRequest.getEmail());
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            if (passwordEncoder.matches(loginRequest.getPassword(), user.getPassword())) {
                return user;
            }
        }
        return null;
    }

    @Override
    public User getUserById(Integer userId) {
        return userRepository.findById(userId).orElse(null);
    }

    @Override
    public User editUserDetails(User user) {
        User oldUser = getUserById(user.getUserId());

        if(!oldUser.getEmail().equals(user.getEmail())) {
            Optional<User> optionalUser=userRepository.findUserByEmail(user.getEmail());
            if(optionalUser.isPresent())
                return null;
        }

        oldUser.setFirstName(user.getFirstName());
        oldUser.setLastName(user.getLastName());
        oldUser.setEmail(user.getEmail());
        if(!oldUser.getPassword().equals(user.getPassword()))
            oldUser.setPassword(passwordEncoder.encode(user.getPassword()));
        oldUser.setPhone(user.getPhone());
        oldUser.getAddress().setCity(user.getAddress().getCity());
        oldUser.getAddress().setState(user.getAddress().getState());
        oldUser.getAddress().setCountry(user.getAddress().getCountry());
        oldUser.getAddress().setPincode(user.getAddress().getPincode());

        return userRepository.save(oldUser);
    }

    @Override
    public User editUserByAdmin(User user) {
        System.out.println(user);
        User oldUser = editUserDetails(user);
        if(oldUser==null)
            return null;
        System.out.println(user);
        oldUser.setIsAccountActive(user.getIsAccountActive());
        return userRepository.save(oldUser);
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public List<User> getAllActiveCustomers() {
        List<User> activeUsers = getAllUsers().stream().filter(user -> user.getIsAccountActive().equals(true))
                .filter(user -> user.getRole().equals("USER")).toList();
        return activeUsers;
    }

    @Override
    public List<User> getAllCustomers() {
        return getAllUsers().stream().filter(user -> user.getRole().equals("USER")).toList();
    }

}
