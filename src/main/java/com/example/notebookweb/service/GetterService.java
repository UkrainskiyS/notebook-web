package com.example.notebookweb.service;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
import com.example.notebookweb.repository.GroupRepository;
import com.example.notebookweb.repository.NoteRepository;
import com.example.notebookweb.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class GetterService {
  private UserRepository userRepository;
  private NoteRepository noteRepository;
  private GroupRepository groupRepository;

  public List<Group> getAllGroups(String username) {
    return groupRepository.findAllByUser(userRepository.findUserByUsername(username));
  }

  public Note getNote(Long id) {
    return noteRepository.getById(id);
  }

  public List<Note> getLastTen(String username) {
    return noteRepository.findLastTenByUserId(userRepository.findUserByUsername(username).getId());
  }

  public List<String> getAllGroupNames(String username) {
    return groupRepository.findAllByUser(userRepository.findUserByUsername(username)).stream()
            .map(Group::getName)
            .collect(Collectors.toList());
  }

  public List<Note> getAllNotes(String username) {
    return noteRepository.findAllByUserId(userRepository.findUserByUsername(username).getId());
  }
}
