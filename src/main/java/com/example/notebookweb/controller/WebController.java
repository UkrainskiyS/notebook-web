package com.example.notebookweb.controller;

import com.example.notebookweb.WebService;
import com.example.notebookweb.model.Note;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@AllArgsConstructor
public class WebController {
    private WebService service;

    @GetMapping
    public String main() {
        return "main";
    }

    @GetMapping("/note/new")
    public String newNote(Model model) {
        model.addAttribute("note", new Note());
        return "note/new_note";
    }

    @PostMapping("/note/new")
    public String saveNote(@ModelAttribute Note note) {
        service.noteList().add(note);
        return "main";
    }

    @GetMapping("/all")
    public String all(Model model) {
        List<Note> noteList = getNotes();
        noteList.addAll(service.noteList());
        model.addAttribute("notes", noteList);
        return "note/all_notes";
    }

    private List<Note> getNotes() {
        return IntStream.range(0, 10)
                .mapToObj(i -> new Note("group_" + i, "name_" + i, "text_" + i))
                .collect(Collectors.toList());
    }
}
