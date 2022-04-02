/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.services;

import com.codename1.io.CharArrayReader;
import com.codename1.io.ConnectionRequest;
import com.codename1.io.JSONParser;
import com.codename1.io.MultipartRequest;
import com.codename1.io.NetworkEvent;
import com.codename1.io.NetworkManager;
import com.codename1.ui.events.ActionListener;
import com.mycompany.entities.Users;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import com.mycompany.utils.Statics;

/**
 *
 * @author ISSAM
 */
public class ServiceUser {
      public ArrayList<Users> comptes;
    public Users users;
    public static ServiceUser instance;
    public boolean resultOK;
    private ConnectionRequest req;

    public ServiceUser() {
        req = new ConnectionRequest();
        users = new Users();
    }

    public static ServiceUser getInstance() {
        if (instance == null) {
            instance = new ServiceUser();
        }
        return instance;

    }
    
     public Users login(String mail, String mdp) {
        String url = "http://127.0.0.1:8000/users/json_loginjob/" + mail + "/" + mdp;
        req.setUrl(url);
        req.addResponseListener(new ActionListener<NetworkEvent>() {
            @Override
            public void actionPerformed(NetworkEvent evt) {
                
                users = findCompte(new String(req.getResponseData()));
                System.out.println(users);
                req.removeResponseListener(this);
            }
        });
        NetworkManager.getInstance().addToQueueAndWait(req);
        return users;

    }
     public Users findCompte(String jsonText) {

        try {
            
            JSONParser j = new JSONParser();
            j.setIncludeNulls(true);
            if(!jsonText.equals("null")){
                Map<String, Object> compteListJson = j.parseJSON(new CharArrayReader(jsonText.toCharArray()));
                if(compteListJson.containsKey("id"))
                   users.setId((int) Float.parseFloat(compteListJson.get("id").toString()));
                if(compteListJson.containsKey("name"))
                    users.setNom(compteListJson.get("name").toString());
                 if(compteListJson.containsKey("password"))
                    users.setPassword(compteListJson.get("password").toString());
                if(compteListJson.containsKey("email"))
                    users.setEmail(compteListJson.get("email").toString());
                 
               

            }  
        } catch (IOException ex) {
            return users;
        }
        return users;
    }
       public void addCompte(Users c) {
           MultipartRequest con = new MultipartRequest();
        String url = "http://127.0.0.1:8000/users/add2?name="+c.getNom()+"&password=" + c.getPassword()+ "&email=" + c.getEmail();
        con.setUrl(url);
      con.addResponseListener((ee)->{
      String str = new String(con.getResponseData());
          System.out.println(str);
      });
        NetworkManager.getInstance().addToQueueAndWait(con);
     
    }
     public boolean deleteCompte(Users c) {
        String url = Statics.BASE_URL + "/users/deleteuser/" + c.getId();
        req.setUrl(url);
        req.addResponseListener(new ActionListener<NetworkEvent>() {
            @Override
            public void actionPerformed(NetworkEvent evt) {
                resultOK = req.getResponseCode() == 200; //Code HTTP 200 OK
                req.removeResponseListener(this);
            }
        });
        NetworkManager.getInstance().addToQueueAndWait(req);
        return resultOK;
    }
  
    
    
}
