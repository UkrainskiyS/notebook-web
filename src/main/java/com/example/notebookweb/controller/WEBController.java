package com.example.notebookweb.controller;

import com.example.notebookweb.service.GetterService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/** Controller for web-pages */
@Controller
@AllArgsConstructor
public class WEBController {
  private GetterService getterService;

  /**
   * @param model - Last 10 user's notes
   * @return Home page
   */
  @GetMapping
  public String main(Model model) {
    model.addAttribute("notes", getterService.getLastTen());
    System.out.println(SecurityContextHolder.getContext().getAuthentication().getName());

    return "main";
  }

  /**
   * @param model All user's group names
   * @return Page with redactor
   */
  @GetMapping("/note/new")
  public String newNote(Model model) {
    model.addAttribute("groups", getterService.getAllGroupNames());
    return "note/new_note";
  }

  /**
   * @param note Id note
   * @param model Note with all params
   * @return Page with editor for this note
   */
  @GetMapping("/note/edit")
  public String editNote(@RequestParam Long note, Model model) {
    model.addAttribute("note", getterService.getNote(note));
    return "note/edit_note";
  }

  /**
   * @param note Id note
   * @return Page with note
   */
  @GetMapping("/note/show")
  public String showNote(@RequestParam Long note, Model model) {
    model.addAttribute("note", getterService.getNote(note));
    return "/note/show_note";
  }

  @GetMapping("/group/all")
  public String allGroups(Model model) {
    model.addAttribute("groups", getterService.getAllGroups());
    return "group/all_groups";
  }

  @GetMapping("/note/all")
  public String allNotes(Model model) {
    model.addAttribute("notes", getterService.getAllNotes());
    return "note/all_notes";
  }
}
