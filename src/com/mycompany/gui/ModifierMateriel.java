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
import com.mycompany.entities.Materiel;
import com.mycompany.services.ServiceMateriel;



/**
 *
 * @author MY HP
 */
public class ModifierMateriel extends BaseForm {

    Form current;

    public ModifierMateriel(Resources res, Materiel p) {

        super("Newsfeed", BoxLayout.y());

        Toolbar tb = new Toolbar(true);
        current = this;
        setToolbar(tb);
        getTitleArea().setUIID("Container");
        setTitle("Ajout Produit");
        getContentPane().setScrollVisible(false);

        super.addSideMenu(res);

        TextField ref = new TextField(p.getRef(), "ref", 20, TextField.ANY);
        TextField categorie = new TextField(p.getCategorie(), "categorie", 20, TextField.ANY);
        TextField description = new TextField(p.getDescription(), "description", 20, TextField.ANY);
   
       

      
 

        ref.setSingleLineTextArea(true);
        categorie.setSingleLineTextArea(true);
        description.setSingleLineTextArea(true);
     
       
       

        Button btnModifier = new Button("Modifier");
        btnModifier.setUIID("Button");

        //OnClick Button
        btnModifier.addPointerPressedListener(l -> {

            
             p.setRef(ref.getText());
              p.setCategorie(categorie.getText());
              p.setDescription(description.getText());
          
          

      

        //Appel a la methode UPDATE
        if (ServiceMateriel.getInstance().modifierMa(p)) {
            //If True
            new ListMateriel(current).show();

        }
          });
        Button btnAnnuler = new Button("Annuler");
        btnAnnuler.addActionListener(e -> {

            new ListAb(current).show();

        });

        Label l2 = new Label("");
   

        Label l1 = new Label();

        Container c = BoxLayout.encloseY(
                l1, l2,
                new FloatingHint(ref),
                createLineSeparator(),
                new FloatingHint(categorie),
                createLineSeparator(),
                new FloatingHint(description),
                createLineSeparator(),
                
              
                
            
                btnModifier,
                btnAnnuler
                
        );
                        
    

add(c);
show();
                       
        
    }
    
    
}

