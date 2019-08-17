/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.models;

/**
 *
 * @author lenovo
 */
public class Personnes {
    private int id;
    private String nom;
    private String prenom;
    private String email;
    private String addresse;
    private int telephone;
    private String username;
    private String type;
    private String password;
    private String DateNaissance;
    private String DateEmbauche;

    public String getDateNaissance() {
        return DateNaissance;
    }

    public String getDateEmbauche() {
        return DateEmbauche;
    }

    public void setDateNaissance(String DateNaissance) {
        this.DateNaissance = DateNaissance;
    }

    public void setDateEmbauche(String DateEmbauche) {
        this.DateEmbauche = DateEmbauche;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public Personnes() {
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getEmail() {
        return email;
    }

    public String getAddresse() {
        return addresse;
    }

    public int getTelephone() {
        return telephone;
    }

    public String getUsername() {
        return username;
    }

   

    public String getType() {
        return type;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddresse(String addresse) {
        this.addresse = addresse;
    }

    public void setTelephone(int telephone) {
        this.telephone = telephone;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setPassword(String password) {
        this.password = password;
    }
   

}
