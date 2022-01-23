package com.example.notebookweb.controller;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.service.WebService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
}