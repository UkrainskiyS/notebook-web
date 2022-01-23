package com.example.notebookweb.repository;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NoteRepository extends JpaRepository<Note, Long> {
    boolean existsByGroupAndName(Group group, String name);

    List<Note> findAllByNameContaining(String name);

    List<Note> findAllByGroup(Group group);

    @Query(value = "select * from notes order by last_update desc limit 10", nativeQuery = true)
    List<Note> findLastTen();

    void deleteAllByGroup(Group group);

//    void deleteById(Long id);
}
