package com.techm.banking.controller;

import com.techm.banking.model.User;
import com.techm.banking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping
    public ResponseEntity<String> home(){
        return new ResponseEntity<>("WELCOME TO ONLINE BANKING SYSTEM", HttpStatus.OK);
    }

    @GetMapping("/login")
    public ResponseEntity<String> loginUser(@RequestParam("username") String name,@RequestParam("password") String password){
        User user=new User();
        user.setEmail(name);
        user.setPassword(password);
        if(userService.authenticationUser(user)){
            return new ResponseEntity<>("Login Successful",HttpStatus.OK);
        }
        else{
            return new ResponseEntity<>("Invalid Username or Password",HttpStatus.UNAUTHORIZED);
        }
    }

    @PostMapping("/create")
    public ResponseEntity<String> createUser(@RequestBody User user){
        if(userService.registerUser(user)){
            return new ResponseEntity<>("User created Successfully"+user,HttpStatus.CREATED);
        }
        else{
            return new ResponseEntity<>("User creation failed",HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<Optional<User>> updateUser(@RequestBody User user,@PathVariable("id") Integer id){
        Optional<User> user1=userService.updateUser(user,id);
        return new ResponseEntity<>(user1,HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Optional<User>> getUserById(@PathVariable("id") Integer id){
        return new ResponseEntity<>(userService.getUserById(id),HttpStatus.OK);
    }


}
