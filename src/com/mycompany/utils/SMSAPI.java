/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.utils;

import static com.codename1.ui.events.ActionEvent.Type.Response;
import java.util.Map;
import com.codename1.components.ToastBar;
import  com.codename1.io.rest.Response;
import com.codename1.io.rest.Rest;
import com.codename1.util.Base64;
import java.util.Map;


/**
 *
 * @author LENOVO
 */
public class SMSAPI {
     String accountSID = "ACb79f0b97cadcb593285c929ac05d0357";
    String authToken = "753acfe23069ddeab9b1bc311701beea";
    String fromPhone = "+13203346023";
        String too = "+21654164001";

    
    public  SMSAPI(String message, String to){
        
        Response <Map> result = Rest.post("https://api.twilio.com/2010-04-01/Accounts/" + accountSID + "/Messages.json").
        queryParam("To", to).
        queryParam("From", fromPhone).
        queryParam("Body", message).
        header("Authorization", "Basic " + Base64.encodeNoNewline((accountSID + ":" + authToken).getBytes())).
        getAsJsonMap();
        System.out.println(result.getResponseData());
        
        
        if(result.getResponseData() != null) {
            String error = (String)result.getResponseData().get("error_message");
        if(error != null) {
            System.out.println(error);
        }
        } else {
            //ToastBar.showErrorMessage("Error sending SMS: " + result.getResponseCode());
        }
        }
    
    public void malek(String message){
        
        Response <Map> result = Rest.post("https://api.twilio.com/2010-04-01/Accounts/" + accountSID + "/Messages.json").
        queryParam("To", too).
        queryParam("From", fromPhone).
        queryParam("Body", message).
        header("Authorization", "Basic " + Base64.encodeNoNewline((accountSID + ":" + authToken).getBytes())).
        getAsJsonMap();
        System.out.println(result.getResponseData());
        
        
        if(result.getResponseData() != null) {
            String error = (String)result.getResponseData().get("error_message");
        if(error != null) {
            System.out.println(error);
        }
        } else {
            //ToastBar.showErrorMessage("Error sending SMS: " + result.getResponseCode());
        }
        }
    
}
