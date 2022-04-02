/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.services;

import com.codename1.db.Database;
import com.codename1.io.CharArrayReader;
import com.codename1.io.ConnectionRequest;
import com.codename1.io.JSONParser;
import com.codename1.io.NetworkEvent;
import com.codename1.io.NetworkManager;

import com.codename1.ui.events.ActionListener;

import com.mycompany.entities.Abonnement;
import com.mycompany.utils.Statics;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 *
 * @author MY HP
 */
public class ServiceAbonnement {

    //singleton
    public Database db;
    public static ServiceAbonnement instance = null;

    public static boolean resultOK = true;
    ArrayList resultpanier = new ArrayList();
   
    public static ArrayList<Abonnement> resultpa = new ArrayList<>();
    //Initialisation connection request
    private ConnectionRequest req;
    

    public static ServiceAbonnement getInstance() {
        if (instance == null) {
            instance = new ServiceAbonnement();
        }
        return instance;
    }

    public ServiceAbonnement() {

        req = new ConnectionRequest();

    }

    //Ajout
    public void ajouterAbonnement(Abonnement ab) {

        String url = Statics.BASE_URL + "/AddAbJSON/new?name=" + ab.getName() + "&email=" + ab.getEmail() + "&numtel=" + ab.getNumtel();

        req.setUrl(url);
        req.addResponseListener((e) -> {

            String str = new String(req.getResponseData());
            System.out.println("Data ==" + str);

        });

        NetworkManager.getInstance().addToQueueAndWait(req);   //Excecution REQ

    }

    //Affichage
    public ArrayList<Abonnement> affichageAb() {
        ArrayList<Abonnement> result = new ArrayList<>();

        String url = Statics.BASE_URL + "/test";
        req.setUrl(url);

        req.addResponseListener(new ActionListener<NetworkEvent>() {
            @Override
            public void actionPerformed(NetworkEvent evt) {

                JSONParser jsonp;
                jsonp = new JSONParser();

                try {
                    Map<String, Object> map = jsonp.parseJSON(new CharArrayReader(new String(req.getResponseData()).toCharArray()));

                    List<Map<String, Object>> listOfMap = (List<Map<String, Object>>) map.get("root");

                    for (Map<String, Object> obj : listOfMap) {
                        Abonnement pr = new Abonnement();

                        float id = Float.parseFloat(obj.get("id").toString());
                        pr.setId((int) Float.parseFloat(obj.get("id").toString())); 
                        pr.setName(obj.get("name").toString());

                       
                        pr.setEmail(obj.get("email").toString());
                        pr.setNumtel(obj.get("num_tel").toString());
                       
                      

                        //InsertData into ArrayList result
                        result.add(pr);

                    }

                } catch (Exception ex) {
                    System.out.println("Error houni : " + ex.getMessage());
                }
            }

        });
        NetworkManager.getInstance().addToQueueAndWait(req);   //Excecution REQ
        return result;

    }

    
    //DELETE
    public boolean deleteAb(int id) {
        String url = Statics.BASE_URL + "/deleteAbJSON/" + id;

        req.setUrl(url);
        req.addResponseListener(new ActionListener<NetworkEvent>() {
            @Override
            public void actionPerformed(NetworkEvent evt) {
                req.removeResponseCodeListener(this);

            }

        });

        NetworkManager.getInstance().addToQueueAndWait(req);   //Excecution REQ
        return resultOK;
    }

    //UPDATE
    public boolean modifierAb(Abonnement p) {

        String url = Statics.BASE_URL + "/updatAbJSON/" + p.getId() + "?name=" + p.getName() + "&email=" + p.getEmail()  + "&numtel=" + p.getNumtel();
        req.setUrl(url);

        req.addResponseListener(new ActionListener<NetworkEvent>() {
            @Override
            public void actionPerformed(NetworkEvent evt) {

                resultOK = req.getResponseCode() == 200; //code 200 si c bon
                req.removeResponseListener(this);
            }

        });

        NetworkManager.getInstance().addToQueueAndWait(req);
        return resultOK;
    }


    

    

   

}
