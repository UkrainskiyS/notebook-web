package com.example.notebookweb.model;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
@Entity
@Table(name = "notes")
@RequiredArgsConstructor
public class Note {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @ManyToOne
  @JoinColumn(name = "group_id", nullable = false)
  private Group group;

  @Column(name = "last_update")
  private LocalDateTime dateTime;

  @Column(nullable = false)
  private String name;

  @Column(nullable = false, length = 3000)
  private String text;

  public Note(Group group, LocalDateTime dateTime, String name, String text) {
    this.group = group;
    this.dateTime = dateTime;
    this.name = name;
    this.text = text;
  }

  public String getDateTime() {
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("H:mm:ss dd.MM.yyyy");
    return dateTime.format(formatter);
  }

  public void update(String text) {
    dateTime = LocalDateTime.now(ZoneId.of("Europe/Moscow"));
    this.text = text;
  }
}
