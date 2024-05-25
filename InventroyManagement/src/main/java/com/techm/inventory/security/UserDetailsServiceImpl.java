/*
package com.techm.inventory.security;


import com.techm.inventory.model.User;
import com.techm.inventory.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> user=userRepository.findUserByEmail(username);
        if(user.isEmpty()){
            System.out.println("User (email id) not found");
            throw new UsernameNotFoundException("User not found...");
        }

        System.out.println("Authenticated Successfully with username : "+username);
        return new CustomUserDetails(user.get());
    }
}
*/
