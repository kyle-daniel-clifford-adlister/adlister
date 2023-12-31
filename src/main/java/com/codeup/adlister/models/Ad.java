package com.codeup.adlister.models;

import java.util.ArrayList;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private ArrayList<String> category;
    private double cost;

    public Ad(long id, long userId, String title, String description, double cost) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.cost = cost;
    }
    public Ad(long userId, String title, String description, double cost) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.cost = cost;
    }

    public Ad(long userId, String title, String description, double cost, ArrayList<String>category) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.cost = cost;
        this.category = category;
    }


    // Getters and Setters

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<String> getCategory() {
        return category;
    }

    public void setCategory(ArrayList<String> category) {
        this.category = category;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public Object getCategoryNames() {
        return null;
    }
}
