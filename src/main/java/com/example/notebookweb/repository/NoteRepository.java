package com.example.notebookweb.repository;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NoteRepository extends JpaRepository<Note, Long> {

    @Query(value = "select * from notes order by last_update desc limit 10", nativeQuery = true)
    List<Note> findLastTen();

    boolean existsByGroupAndName(Group group, String name);

    void deleteAllByGroup(Group group);

}
