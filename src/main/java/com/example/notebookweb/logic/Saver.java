package com.example.notebookweb.logic;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
import com.example.notebookweb.model.User;
import com.example.notebookweb.repository.GroupRepository;
import com.example.notebookweb.repository.NoteRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Map;

@Component
@AllArgsConstructor
public class Saver {
  private NoteRepository noteRepository;
  private GroupRepository groupRepository;

  public boolean saveNote(User user, Map<String, String> request) {
    Group group = groupRepository.getByUserAndName(user, request.get("group"));
    if (noteRepository.existsByUserIdAndGroupAndName(user.getId(), group, request.get("name"))) {
      return false;
    }

    noteRepository.save(
        new Note(
            user.getId(),
            group,
            LocalDateTime.now(ZoneId.of("Europe/Moscow")),
            request.get("name"),
            request.get("text")));
    return true;
  }

  public boolean saveGroup(User user, Group group) {
    if (groupRepository.existsByUserAndName(user, group.getName())) {
      return false;
    } else {
      group.setUser(user);
      groupRepository.save(group);
      return true;
    }
  }
}
