package com.techm.inventory.repository;

import com.techm.inventory.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Integer> {
    Optional<User> getUserByEmailAndPassword(String email,String password);
    Optional<User> findUserByEmail(String email);
}
