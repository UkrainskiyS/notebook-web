package com.example.notebookweb.service;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
import com.example.notebookweb.repository.GroupRepository;
import com.example.notebookweb.repository.NoteRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class GetterService {
    private NoteRepository noteRepository;
    private GroupRepository groupRepository;

    public List<Group> getAllGroups() {
        return groupRepository.findAll();
    }

    public Note getNote(Long id) {
        return noteRepository.getById(id);
    }

    public List<Note> getLastTen() {
        return noteRepository.findLastTen();
    }

    public List<String> getAllGroupNames() {
        return groupRepository.findAllNames();
    }

    public List<Note> getAllNotes() {
        return noteRepository.findAll();
    }
}
