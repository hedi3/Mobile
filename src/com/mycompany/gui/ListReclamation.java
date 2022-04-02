/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.gui;

import com.codename1.components.ImageViewer;
import com.codename1.components.SpanLabel;
import com.codename1.ui.Button;
import com.codename1.ui.Component;
import com.codename1.ui.Container;
import com.codename1.ui.Dialog;
import com.codename1.ui.EncodedImage;
import com.codename1.ui.Font;
import com.codename1.ui.FontImage;
import com.codename1.ui.Form;
import com.codename1.ui.Image;
import com.codename1.ui.Label;
import com.codename1.ui.TextField;
import com.codename1.ui.URLImage;
import com.codename1.ui.layouts.BoxLayout;
import com.codename1.ui.plaf.UIManager;
import com.codename1.ui.util.Resources;
import com.mycompany.entities.Reclamation;
import com.mycompany.services.ServiceReclamation;


import java.util.ArrayList;

/**
 *
 * @author FK Info
 */
public class ListReclamation extends Form {
Form current;
 Resources theme;
public Component createLineSeparator() {
        Label separator = new Label("", "WhiteSeparator");
        separator.setShowEvenIfBlank(true);
        return separator;
    }

   public ListReclamation(Form previous) {
       theme = UIManager.initFirstTheme("/theme");
        setTitle("Liste des réclamations");
            //search tbadel 3onwen tool bar
//prepare field
TextField searchField;
searchField = new TextField("", "Chercher une reclamation");
searchField.getHintLabel().setUIID("Title");
searchField.setUIID("Title");
getToolbar().setTitleComponent(searchField);
//if field content changed
searchField.addDataChangedListener((i1, i2) -> {
String t = searchField.getText();
if(t.length() < 1) {
for(Component cmp : getContentPane()) {
cmp.setHidden(false);
cmp.setVisible(true);
}
} else {
t = t.toLowerCase();
for(Component cmp: getContentPane()) {
//tekhou el val ta3 el champ : champ li 3malt 3lih el recherche type span label (emplacement : container->label )
String val = ((Label) ((Container) cmp).getComponentAt(0) ).getText();
System.out.println(   (  (Label) ((Container) cmp).getComponentAt(0) ).getText() );
boolean show = val != null && val.toLowerCase().indexOf(t) > -1;
cmp.setHidden(!show);
cmp.setVisible(show);
}
}
getContentPane().animateLayout(250);
});
          ArrayList<Reclamation>liste=ServiceReclamation.getInstance().affichageRe();
        for(Reclamation art : liste)
        {
            addButton(art);
        }
        getToolbar().addMaterialCommandToLeftBar("", FontImage.MATERIAL_ARROW_BACK, e-> previous.showBack());
 }

    private void addButton(Reclamation a) {
     
        
        Label ta1 = new Label("Name :" + a.getRef(),"NewsTopLine");
        Label ta2 = new Label("Sujet :" + a.getSujet(),"NewsTopLine");
        Label ta3 = new Label("Content :" + a.getContent(),"NewsTopLine");
     
       
     
        Font smallPlainSystemFont = Font.createSystemFont(Font.FACE_SYSTEM, Font.STYLE_BOLD, Font.SIZE_SMALL);
        
       
       
        ta1.getStyle().setFgColor(0x1e3642);
        ta1.getStyle().setFont(smallPlainSystemFont);
        ta2.getStyle().setFgColor(0x1e3642);
        ta2.getStyle().setFont(smallPlainSystemFont);
         ta3.getStyle().setFgColor(0x1e3642);
        ta3.getStyle().setFont(smallPlainSystemFont);
        
        
         Button bth=new Button("Home");
          bth.addActionListener(s->new Home().show());
        
         
       current=this;
Button bt=new Button("Modifier!");
          bt.addActionListener(s->new ModifierReclamation(theme,a).show());
        createLineSeparator();
     Button btns=new Button("supprimer");
          btns.addActionListener(e->{ 
           
          Dialog dig= new Dialog("Suppression");
          
          if(dig.show("Suppression","Voulez-vous supprimer cette reclamation? ","Annuler","Oui")){
              
              dig.dispose();
          }else{
              
              dig.dispose();
              //Appel a la methode supprimer
              if(ServiceReclamation.getInstance().deleteRe(a.getId())){
                  
                  new ListReclamation(current).show();
              }
              
               createLineSeparator();
         
          }
          
        });
          add(BoxLayout.encloseY(ta1,ta2,ta3,btns,bt,bth));

  
      
   
    }
}
