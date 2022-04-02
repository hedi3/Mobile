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
import com.mycompany.entities.Offre;
import com.mycompany.utils.Statics;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 *
 * @author MY HP
 */
public class ServiceOffre {

    //singleton
    public Database db;
    public static ServiceOffre instance = null;

    public static boolean resultOK = true;
    ArrayList resultpanier = new ArrayList();
   
    public static ArrayList<Abonnement> resultpa = new ArrayList<>();
    //Initialisation connection request
    private ConnectionRequest req;
    

    public static ServiceOffre getInstance() {
        if (instance == null) {
            instance = new ServiceOffre();
        }
        return instance;
    }

    public ServiceOffre() {

        req = new ConnectionRequest();

    }

    //Ajout
    public void ajouterOffre(Offre ab) {

        String url = Statics.BASE_URL + "/AddOfJSON/new?duree=" + ab.getDuree() + "&solde=" + ab.getSolde() + "&description=" + ab.getDescription();

        req.setUrl(url);
        req.addResponseListener((e) -> {

            String str = new String(req.getResponseData());
            System.out.println("Data ==" + str);

        });

        NetworkManager.getInstance().addToQueueAndWait(req);   //Excecution REQ

    }

    //Affichage
    public ArrayList<Offre> affichageOffre() {
        ArrayList<Offre> result = new ArrayList<>();

        String url = Statics.BASE_URL + "/affo";
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
                        Offre pr = new Offre();

                        float id = Float.parseFloat(obj.get("id").toString());
                        pr.setId((int) Float.parseFloat(obj.get("id").toString())); 
                        pr.setDuree(obj.get("duree").toString());

                       
                        pr.setSolde(obj.get("solde").toString());
                        pr.setDescription(obj.get("description").toString());
                       
                      

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
    public boolean deleteOffre(int id) {
        String url = Statics.BASE_URL + "/deleteOfJSON/" + id;

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
    public boolean modifierOffre(Offre p) {

        String url = Statics.BASE_URL + "/updatOfJSON/" + p.getId() + "?duree=" + p.getDuree() + "&solde=" + p.getSolde()+ "&description=" + p.getDescription();
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
