/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entities;

/**
 *
 * @author hedia
 */
public class Materiel {
    private int id;
    private String ref;
    private String categorie;
    private String description;

    public Materiel() {
    }

    public Materiel(String ref, String categorie, String description) {
        this.ref = ref;
        this.categorie = categorie;
        this.description = description;
    }

    public Materiel(int id, String ref, String categorie, String description) {
        this.id = id;
        this.ref = ref;
        this.categorie = categorie;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
