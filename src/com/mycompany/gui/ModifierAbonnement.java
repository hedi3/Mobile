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
import com.mycompany.services.ServiceAbonnement;


/**
 *
 * @author MY HP
 */
public class ModifierAbonnement extends BaseForm {

    Form current;

    public ModifierAbonnement(Resources res, Abonnement p) {

        super("Newsfeed", BoxLayout.y());

        Toolbar tb = new Toolbar(true);
        current = this;
        setToolbar(tb);
        getTitleArea().setUIID("Container");
        setTitle("Ajout Produit");
        getContentPane().setScrollVisible(false);

        super.addSideMenu(res);

        TextField name = new TextField(p.getName(), "name", 20, TextField.ANY);
        TextField email = new TextField(p.getEmail(), "email", 20, TextField.ANY);
        TextField numtel = new TextField(p.getNumtel(), "numtel", 20, TextField.ANY);
   
       

      
 

        name.setSingleLineTextArea(true);
         email.setSingleLineTextArea(true);
          numtel.setSingleLineTextArea(true);
     
       
       

        Button btnModifier = new Button("Modifier");
        btnModifier.setUIID("Button");

        //OnClick Button
        btnModifier.addPointerPressedListener(l -> {

            
             p.setName(name.getText());
              p.setEmail(email.getText());
              p.setNumtel(numtel.getText());
          
          

      

        //Appel a la methode UPDATE
        if (ServiceAbonnement.getInstance().modifierAb(p)) {
            //If True
            new ListAb(current).show();

        }
          });
        Button btnAnnuler = new Button("Annuler");
        btnAnnuler.addActionListener(e -> {

            new ListAb(current).show();

        });

        Label l2 = new Label("");
   

        Label l1 = new Label();

        Container content = BoxLayout.encloseY(
                l1, l2,
                new FloatingHint(name),
                createLineSeparator(),
                new FloatingHint(email),
                createLineSeparator(),
                new FloatingHint(numtel),
                createLineSeparator(),
                
              
                
            
                btnModifier,
                btnAnnuler
                
        );
                        
    

add(content);
show();
                       
        
    }
    
    
}

