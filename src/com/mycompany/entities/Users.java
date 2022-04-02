/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entities;

/**
 *
 * @author ISSAM
 */
public class Users {
     private int id;
    private String nom;
 
    private String password;
    private String email;


    public Users(int id, String nom, String password, String email) {
        this.id = id;
        this.nom = nom;
     
        this.password = password;
        this.email = email;
    
    }

    public Users() {
    }

    public Users(String nom, String password, String email) {
         this.nom = nom;
        
        this.password = password;
        this.email = email;
    }

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


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

  

    

    
   
    
}
