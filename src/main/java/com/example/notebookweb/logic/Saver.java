package com.example.notebookweb.logic;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
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

  public boolean saveNote(Map<String, String> request) {
    Group group = groupRepository.getByName(request.get("group"));
    if (noteRepository.existsByGroupAndName(group, request.get("name"))) {
      return false;
    }

    noteRepository.save(
        new Note(
            group,
            LocalDateTime.now(ZoneId.of("Europe/Moscow")),
            request.get("name"),
            request.get("text")));
    return true;
  }

  public boolean saveGroup(Group group) {
    if (groupRepository.existsByName(group.getName())) {
      return false;
    } else {
      groupRepository.save(group);
      return true;
    }
  }
}
