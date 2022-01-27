package com.example.notebookweb.service;

import com.example.notebookweb.logic.Saver;
import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
import com.example.notebookweb.model.User;
import com.example.notebookweb.repository.GroupRepository;
import com.example.notebookweb.repository.NoteRepository;
import com.example.notebookweb.repository.UserRepository;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service
@Transactional
@AllArgsConstructor
public class LogicService {
  private UserRepository userRepository;
  private GroupRepository groupRepository;
  private NoteRepository noteRepository;
  private Saver saver;

  public boolean save(String username, Object object) {
    User user = userRepository.findUserByUsername(username);

    if (object instanceof Group) {
      return saver.saveGroup(user, (Group) object);
    } else {
      return saver.saveNote(user, new ObjectMapper().convertValue(object, new TypeReference<>() {}));
    }
  }

  public void deleteGroup(Long id) {
    Group group = groupRepository.getById(id);
    noteRepository.deleteAllByGroup(group);
    groupRepository.delete(group);
  }

  public void deleteNote(Long note) {
    noteRepository.delete(noteRepository.getById(note));
  }

  public void updateNote(Map<String, String> map) {
    Note note = noteRepository.getById(Long.parseLong(map.get("id")));
    note.update(map.get("text"));
    noteRepository.save(note);
  }
}
