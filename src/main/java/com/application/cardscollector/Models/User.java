package com.application.cardscollector.Models;

public class User {
    // Propriété de la classe User
    private int id;
    private String nom;
    private String prenom;
    private String identifiant;
    private String password;

    // GETTERS & SETTERS

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getPrenom() {
        return prenom;
    }
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    public String getIdentifiant() {
        return identifiant;
    }
    public void setIdentifiant(String identifiant) {
        this.identifiant = identifiant;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public User(int id, String nom, String prenom, String identifiant, String password) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.identifiant = identifiant;
        this.password = password;
    }
    
}
