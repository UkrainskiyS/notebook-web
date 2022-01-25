package com.example.notebookweb.controller;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.model.Note;
import com.example.notebookweb.service.WebService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Controller for web-pages
 */

@Controller
@AllArgsConstructor
public class WebController {
    private WebService service;

    @GetMapping
    public String main(Model model) {
        model.addAttribute("notes", service.getLastTen());
        return "main";
    }

    @GetMapping("/note/new")
    public String newNote(Model model) {
        model.addAttribute("groups", service.getAllGroupNames());
        return "note/new_note";
    }

    @GetMapping("/note/edit")
    public String editNote(@RequestParam Long note, Model model) {
        model.addAttribute("note", service.getNote(note));
        return "note/edit_note";
    }

    @PostMapping("/note/new")
    public ResponseEntity<?> saveNote(@RequestBody Map<String, String> request) {
        if (service.saveNote(request)) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/group/all")
    public String allGroups(Model model) {
        model.addAttribute("groups", service.getAllGroups().stream()
                .sorted(Comparator.comparing(Group::getName))
                .collect(Collectors.toList()));
        return "group/all_groups";
    }

    @GetMapping("/note/all")
    public String allNotes(Model model) {
        model.addAttribute("notes", service.getAllNotes().stream()
                .sorted(Comparator.comparing(Note::getName))
                .collect(Collectors.toList()));
        return "note/all_notes";
    }

    @GetMapping("/note/show")
    public String showNote(@RequestParam Long note, Model model) {
        model.addAttribute("note", service.getNote(note));
        return "/note/show_note";
    }
}
