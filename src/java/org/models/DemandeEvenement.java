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
public class DemandeEvenement {
    private int idDemande;
    private String dateDebutEvent;
    private String heureDebutEvent;
    
    private String heureFinEvent;
    private String lieuEvent;
    private int nbrInvite;
    private int idClient;
    private int idAnimation;
    private int idDecoration;
    private int idMenu;

    public String getLieuEvent() {
        return lieuEvent;
    }

    public void setLieuEvent(String lieuEvent) {
        this.lieuEvent = lieuEvent;
    }
    
    public DemandeEvenement() {
    }

    public int getIdDemande() {
        return idDemande;
    }

    public void setIdDemande(int idDemande) {
        this.idDemande = idDemande;
    }

    public void setDateDebutEvent(String dateDebutEvent) {
        this.dateDebutEvent = dateDebutEvent;
    }

    public void setHeureDebutEvent(String heureDebutEvent) {
        this.heureDebutEvent = heureDebutEvent;
    }

    

    public void setHeureFinEvent(String heureFinEvent) {
        this.heureFinEvent = heureFinEvent;
    }

    public void setNbrInvite(int nbrInvite) {
        this.nbrInvite = nbrInvite;
    }


    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    public void setIdAnimation(int idAnimation) {
        this.idAnimation = idAnimation;
    }

    public void setIdDecoration(int idDecoration) {
        this.idDecoration = idDecoration;
    }

    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

  
    public String getDateDebutEvent() {
        return dateDebutEvent;
    }

    public String getHeureDebutEvent() {
        return heureDebutEvent;
    }

    

    public String getHeureFinEvent() {
        return heureFinEvent;
    }

    public int getNbrInvite() {
        return nbrInvite;
    }

    public int getIdClient() {
        return idClient;
    }

    public int getIdAnimation() {
        return idAnimation;
    }

    public int getIdDecoration() {
        return idDecoration;
    }

    public int getIdMenu() {
        return idMenu;
    }

}


