package com.example.notebookweb.controller;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.service.WebService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class RESTController {
    private WebService service;


    @GetMapping("/search")
    public List<String> search(@RequestParam String note) {
        return service.searchNotes(note);
    }

    @PostMapping("/group/new")
    public ResponseEntity<?> newGroup(@RequestBody Group group) {
        if (service.saveGroup(group)) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/group/delete")
    public void deleteGroup(@RequestParam Long id) {
        service.deleteGroup(id);
    }

    @GetMapping("/note/delete")
    public void deleteNote(@RequestParam Long id) {
        service.deleteNote(id);
    }

    @PostMapping("/note/update")
    public void updateNote(@RequestBody Map<String, String> map) {
        service.updateNote(map);
    }
}
