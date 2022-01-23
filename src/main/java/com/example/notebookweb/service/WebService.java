package com.example.notebookweb.service;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
import com.example.notebookweb.repository.GroupRepository;
import com.example.notebookweb.repository.NoteRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Transactional
public class WebService {
    private final NoteRepository noteRepository;
    private final GroupRepository groupRepository;

    public WebService(NoteRepository noteRepository, GroupRepository groupRepository) {
        this.noteRepository = noteRepository;
        this.groupRepository = groupRepository;
    }

    public boolean saveNote(Map<String, String> request) {
        Group group = groupRepository.getByName(request.get("group"));
        if (noteRepository.existsByGroupAndName(group, request.get("name"))) {
            return false;
        }

        noteRepository.save(new Note(
                group,
                LocalDateTime.now(ZoneId.of("Europe/Moscow")),
                request.get("name"),
                request.get("text"))
        );
        return true;
    }

    public List<String> searchNotes(String name) {
        return noteRepository.findAllByNameContaining(name).stream()
                .map(Note::toString)
                .collect(Collectors.toList());
    }

    public boolean saveGroup(Group group) {
        if (groupRepository.existsByName(group.getName())) {
            return false;
        } else {
            groupRepository.save(group);
            return true;
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

    public Note getNote(Long id) {
        return noteRepository.getById(id);
    }

    public void updateNote(Map<String, String> map) {
        Note note = noteRepository.getById(Long.parseLong(map.get("id")));
        note.update(map.get("text"));
        noteRepository.save(note);
    }

    public List<Note> getLastTen() {
        return noteRepository.findLastTen();
    }

    public List<String> getAllGroupNames() {
        return groupRepository.findAllNames();
    }

    public List<Group> getAllGroups() {
        return groupRepository.findAll();
    }

    public List<Note> getAllGroupNotes(Long id) {
        return noteRepository.findAllByGroup(groupRepository.getById(id));
    }

    public List<Note> getAllNotes() {
        return noteRepository.findAll();
    }
}
