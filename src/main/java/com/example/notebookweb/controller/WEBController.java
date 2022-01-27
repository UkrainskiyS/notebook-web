package com.example.notebookweb.controller;

import com.example.notebookweb.service.GetterService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

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
  public String main(Principal principal, Model model) {
    model.addAttribute("notes", getterService.getLastTen(principal.getName()));
    model.addAttribute("username", principal.getName());
    return "main";
  }

  /**
   * @param model All user's group names
   * @return Page with redactor
   */
  @GetMapping("/note/new")
  public String newNote(Principal principal, Model model) {
    model.addAttribute("groups", getterService.getAllGroupNames(principal.getName()));
    model.addAttribute("username", principal.getName());
    return "note/new_note";
  }

  /**
   * @param note Id note
   * @param model Note with all params
   * @return Page with editor for this note
   */
  @GetMapping("/note/edit")
  public String editNote(Principal principal, @RequestParam Long note, Model model) {
    model.addAttribute("note", getterService.getNote(note));
    model.addAttribute("username", principal.getName());
    return "note/edit_note";
  }

  /**
   * @param note Id note
   * @return Page with note
   */
  @GetMapping("/note/show")
  public String showNote(Principal principal, @RequestParam Long note, Model model) {
    model.addAttribute("note", getterService.getNote(note));
    model.addAttribute("username", principal.getName());
    return "/note/show_note";
  }

  @GetMapping("/group/all")
  public String allGroups(Principal principal, Model model) {
    model.addAttribute("groups", getterService.getAllGroups(principal.getName()));
    model.addAttribute("username", principal.getName());
    return "group/all_groups";
  }

  @GetMapping("/note/all")
  public String allNotes(Principal principal, Model model) {
    model.addAttribute("notes", getterService.getAllNotes(principal.getName()));
    model.addAttribute("username", principal.getName());
    return "note/all_notes";
  }
}
