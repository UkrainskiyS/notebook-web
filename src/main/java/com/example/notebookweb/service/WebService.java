package com.example.notebookweb.service;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
import com.example.notebookweb.repository.GroupRepository;
import com.example.notebookweb.repository.NoteRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public record WebService(NoteRepository noteRepository, GroupRepository groupRepository) {

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

    public List<Note> getLastTen() {
        return noteRepository.findLastTen();
    }

    public List<String> getAllGroupNames() {
        return groupRepository.findAllNames();
    }

    public List<Group> getAllGroups() {
        return groupRepository.findAll();
    }
}
