package com.example.notebookweb.repository;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NoteRepository extends JpaRepository<Note, Long> {

  List<Note> findLastTenByUserId(Long userId);

  boolean existsByUserIdAndGroupAndName(Long userId, Group group, String name);

  void deleteAllByGroup(Group group);

  List<Note> findAllByUserId(Long userId);
}
