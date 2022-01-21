package com.example.notebookweb;

import com.example.notebookweb.model.Note;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public record WebService(List<Note> noteList) {
}
