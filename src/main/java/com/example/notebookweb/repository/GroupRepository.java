package com.example.notebookweb.repository;

import com.example.notebookweb.model.Group;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GroupRepository extends JpaRepository<Group, Long> {

    /**
     * @return All group's names
     */

    @Query(value = "select name from groups;", nativeQuery = true)
    List<String> findAllNames();

    Group getByName(String name);

    boolean existsByName(String name);
}
