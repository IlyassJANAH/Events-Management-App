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
public class Animation {
    private int id;
    private String Libelle;
    private Double Prix;
    private String Designation;

    public Animation() {
    }
    
    public String getLibelle() {
        return Libelle;
    }

    public int getId() {
        return id;
    }

    public Double getPrix() {
        return Prix;
    }

    public String getDesignation() {
        return Designation;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLibelle(String Libelle) {
        this.Libelle = Libelle;
    }
    
    public void setPrix(Double Prix) {
        this.Prix = Prix;
    }

    public void setDesignation(String Designation) {
        this.Designation = Designation;
    }
    
}
