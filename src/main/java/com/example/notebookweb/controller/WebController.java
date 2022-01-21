package com.example.notebookweb.controller;

import com.example.notebookweb.WebService;
import com.example.notebookweb.model.Note;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * Controller for web-pages
 */

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
        model.addAttribute("notes", service.noteList());
        return "note/all_notes";
    }
}
