/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.gui;

import com.codename1.ui.Button;
import com.codename1.ui.Form;
import com.codename1.ui.Label;
import com.codename1.ui.layouts.BoxLayout;
import com.codename1.ui.plaf.UIManager;
import com.codename1.ui.util.Resources;

/**
 *
 * @author FK Info
 */
public class Home extends Form {

    public Home(Form current) {
        this.current = current;
        
    }
Form current;
private Resources theme;

    public Home() {
        current=this;
        theme = UIManager.initFirstTheme("/theme");
        setTitle("Tuniflix");
        setLayout(BoxLayout.y());
        add(new Label("choose an option"));
        Button btnAbonnement=new Button("abonnements");
         Button btnOffre=new Button("offres");
         Button btnRec=new Button("reclamation");
         Button btnMat=new Button("materiel");
        btnAbonnement.addActionListener(e->new AjoutAbonnement(theme).show());
         btnOffre.addActionListener(e->new AjoutOffre(theme).show());
          btnRec.addActionListener(e->new AjoutReclamation(theme).show());
         btnMat.addActionListener(e->new AjoutMateriel(theme).show());
        addAll(btnAbonnement,btnOffre,btnRec,btnMat);
    }
    
    
}
