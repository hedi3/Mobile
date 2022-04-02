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
public class Reclamation {
    private int id;
    private String sujet;
    private String ref ;
    private String content ;

    public Reclamation() {
    }

    public Reclamation(String sujet, String ref, String content) {
        this.sujet = sujet;
        this.ref = ref;
        this.content = content;
    }

    public Reclamation(int id, String sujet, String ref, String content) {
        this.id = id;
        this.sujet = sujet;
        this.ref = ref;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSujet() {
        return sujet;
    }

    public void setSujet(String sujet) {
        this.sujet = sujet;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
