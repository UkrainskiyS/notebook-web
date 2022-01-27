package com.example.notebookweb.controller;

import com.example.notebookweb.configuration.WebConfig;
import com.example.notebookweb.model.User;
import com.example.notebookweb.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@AllArgsConstructor
public class AuthController {
  private WebConfig webConfig;
  private UserRepository userRepository;

  @RequestMapping(value = "/registration", method = RequestMethod.POST)
  public ResponseEntity<?> newUser(@RequestBody User user) {
    if (userRepository.existsByUsername(user.getUsername())) {
      return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    } else {
      user.setEnabled(true);
      user.setPassword(webConfig.encoder().encode(user.getPassword()));
      userRepository.save(user);
      return new ResponseEntity<>(HttpStatus.OK);
    }
  }

  @GetMapping("/registration")
  public String registrationPage() {
    return "auth/registration";
  }
}
