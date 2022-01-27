package com.example.notebookweb.repository;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GroupRepository extends JpaRepository<Group, Long> {

  List<Group> findAllByUser(User user);

  Group getByUserAndName(User user, String name);

  boolean existsByUserAndName(User user, String name);
}
