/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import javax.ejb.Stateless;

/**
 *
 * @author Admin
 */
@Stateless
public class cc_Bean {
    public cc_Bean(){
        
    }
    public double rupees_dollar(double a){
        return a/83.96;
    }
    public double rupees_euro(double a){
        return a/91.70;
    }
    public double rupees_dinar(double a){
        return a/274.99;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}

