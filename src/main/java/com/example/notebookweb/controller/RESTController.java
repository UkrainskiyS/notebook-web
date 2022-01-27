package com.example.notebookweb.controller;

import com.example.notebookweb.model.Group;
import com.example.notebookweb.service.LogicService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class RESTController {
  private LogicService logicService;

  @GetMapping("/group/delete")
  public void deleteGroup(@RequestParam Long id) {
    logicService.deleteGroup(id);
  }

  @GetMapping("/note/delete")
  public void deleteNote(@RequestParam Long id) {
    logicService.deleteNote(id);
  }

  /**
   * Save new text for note
   *
   * @param map Map with note parameters
   */
  @PostMapping("/note/update")
  public void updateNote(@RequestBody Map<String, String> map) {
    logicService.updateNote(map);
  }

  /**
   * Save new group if name not exist
   *
   * @param group New group
   * @return Status code 400 if name exist, else 200
   */
  @PostMapping("/group/new")
  public ResponseEntity<?> newGroup(@RequestBody Group group) {
    if (logicService.save(group)) {
      return new ResponseEntity<>(HttpStatus.OK);
    } else {
      return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
  }

  /**
   * Save new note if name not exist
   *
   * @param request New note
   * @return Status code 400 if name exist, else 200
   */
  @PostMapping("/note/new")
  public ResponseEntity<?> saveNote(@RequestBody Map<String, String> request) {
    if (logicService.save(request)) {
      return new ResponseEntity<>(HttpStatus.OK);
    } else {
      return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
  }
}
