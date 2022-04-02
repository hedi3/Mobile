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
import com.mycompany.entities.Reclamation;
import com.mycompany.services.ServiceAbonnement;
import com.mycompany.services.ServiceReclamation;


/**
 *
 * @author MY HP
 */
public class ModifierReclamation extends BaseForm {

    Form current;

    public ModifierReclamation(Resources res, Reclamation p) {

        super("Newsfeed", BoxLayout.y());

        Toolbar tb = new Toolbar(true);
        current = this;
        setToolbar(tb);
        getTitleArea().setUIID("Container");
        setTitle("Ajout Produit");
        getContentPane().setScrollVisible(false);

        super.addSideMenu(res);

        TextField ref = new TextField(p.getRef(), "ref", 20, TextField.ANY);
        TextField sujet = new TextField(p.getSujet(), "sujet", 20, TextField.ANY);
        TextField content = new TextField(p.getContent(), "content", 20, TextField.ANY);
   
       

      
 

        ref.setSingleLineTextArea(true);
        sujet.setSingleLineTextArea(true);
        content.setSingleLineTextArea(true);
     
       
       

        Button btnModifier = new Button("Modifier");
        btnModifier.setUIID("Button");

        //OnClick Button
        btnModifier.addPointerPressedListener(l -> {

            
             p.setRef(ref.getText());
              p.setSujet(sujet.getText());
              p.setContent(content.getText());
          
          

      

        //Appel a la methode UPDATE
        if (ServiceReclamation.getInstance().modifierRe(p)) {
            //If True
            new ListReclamation(current).show();

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
                new FloatingHint(sujet),
                createLineSeparator(),
                new FloatingHint(content),
                createLineSeparator(),
                
              
                
            
                btnModifier,
                btnAnnuler
                
        );
                        
    

add(c);
show();
                       
        
    }
    
    
}

