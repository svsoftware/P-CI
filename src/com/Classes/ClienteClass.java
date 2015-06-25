/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.Classes;

/**
 *
 * @author Gustavo Adolfo
 */
public class ClienteClass extends PersonClass{
    private String ruc_cli;

    public ClienteClass(String ruc_cli) {
        this.ruc_cli = ruc_cli;
    }

    public ClienteClass() {
    }

    public String getRuc_cli() {
        return ruc_cli;
    }

    public void setRuc_cli(String ruc_cli) {
        this.ruc_cli = ruc_cli;
    }    
}
