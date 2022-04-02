    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.gui;

import com.codename1.components.FloatingHint;
import com.codename1.ui.Button;
import com.codename1.ui.Container;
import com.codename1.ui.Form;
import com.codename1.ui.Label;
import com.codename1.ui.TextField;
import com.codename1.ui.Toolbar;
import com.codename1.ui.layouts.BoxLayout;
import com.codename1.ui.util.Resources;
import com.mycompany.entities.Abonnement;
import com.mycompany.entities.Offre;
import com.mycompany.services.ServiceAbonnement;
import com.mycompany.services.ServiceOffre;


/**
 *
 * @author MY HP
 */
public class ModifierOffre extends BaseForm {

    Form current;

    public ModifierOffre(Resources res, Offre p) {

        super("Newsfeed", BoxLayout.y());

        Toolbar tb = new Toolbar(true);
        current = this;
        setToolbar(tb);
        getTitleArea().setUIID("Container");
        setTitle("Ajout Produit");
        getContentPane().setScrollVisible(false);

        super.addSideMenu(res);

        TextField duree = new TextField(p.getDuree(), "duree", 20, TextField.ANY);
        TextField solde = new TextField(p.getSolde(), "solde", 20, TextField.ANY);
        TextField description = new TextField(p.getDescription(), "description", 20, TextField.ANY);
   
       

      
 

        duree.setSingleLineTextArea(true);
         solde.setSingleLineTextArea(true);
          description.setSingleLineTextArea(true);
     
       
       

        Button btnModifier = new Button("Modifier");
        btnModifier.setUIID("Button");

        //OnClick Button
        btnModifier.addPointerPressedListener(l -> {

            
             p.setDuree(duree.getText());
              p.setSolde(solde.getText());
              p.setDescription(description.getText());
          
          

      

        //Appel a la methode UPDATE
        if (ServiceOffre.getInstance().modifierOffre(p)) {
            //If True
            new ListOffre(current).show();

        }
          });
        Button btnAnnuler = new Button("Annuler");
        btnAnnuler.addActionListener(e -> {

            new ListOffre(current).show();

        });

        Label l2 = new Label("");
   

        Label l1 = new Label();

        Container content = BoxLayout.encloseY(
                l1, l2,
                new FloatingHint(duree),
                createLineSeparator(),
                new FloatingHint(solde),
                createLineSeparator(),
                new FloatingHint(description),
                createLineSeparator(),
                
              
                
            
                btnModifier,
                btnAnnuler
                
        );
                        
    

add(content);
show();
                       
        
    }
    
    
}

