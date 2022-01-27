package com.example.notebookweb.repository;

import com.example.notebookweb.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
  User findUserByUsername(String name);

  boolean existsByUsername(String name);
}
