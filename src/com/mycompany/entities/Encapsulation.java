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
public class Encapsulation {
    protected static int id;
    protected static String nom;

    protected static String  password;
    protected static String email;

    public static int getid() {
        return id;
    }

    public static void setid(int id) {
        Encapsulation.id = id;
    }

  
    public static String getNom() {
        return nom;
    }

    public static void setNom(String nom) {
        Encapsulation.nom = nom;
    }

   

   
  

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        Encapsulation.password = password;
    }

    public static String getEmail() {
        return email;
    }

    public static void setEmail(String email) {
        Encapsulation.email = email;
    }

  
    public Encapsulation() {
    }

       public Encapsulation(int id,String nom,String password, String email ) {
        this.id = id;
        this.nom=nom;
        
        this.password=password;
        this.email = email;
      
            }
        
       public static void setCompte(Users users )
    {
        Encapsulation.id = users.getId();
        Encapsulation.nom= users.getNom();
       
        Encapsulation.password = users.getPassword();
        Encapsulation.email = users.getEmail();
       
      
    }
   
    
}
