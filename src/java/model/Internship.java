/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author charles
 */
public class Internship {
    private int id;
    private String title;
    private String description;
    private Date closingDate;

    public Internship(int id, String title, String description, Date closingDate) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.closingDate = closingDate;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public Date getClosingDate() {
        return closingDate;
    }
    
}
