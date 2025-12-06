package com.event.model;

import java.time.LocalDate;
import java.sql.Timestamp;

public class Event {

    private int id;
    private String title;
    private String description;
    private LocalDate date;       // Changed from String to LocalDate
    private String location;
    private int createdBy;
    private Timestamp createdAt;

    public Event() {}

    // Getters and Setters

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public int getCreatedBy() { return createdBy; }
    public void setCreatedBy(int createdBy) { this.createdBy = createdBy; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
