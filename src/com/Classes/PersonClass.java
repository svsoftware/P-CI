/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.Classes;

/**
 *
 * @author Christianlp
 * @date 23/06/2015
 * @time 05:59:17 PM
 * @package com.Classes
 * @project proyectoCI
 */
public class PersonClass {
    private String Cod;
    private String name;
    private String LastName;
    private String dni;
    private String direc;
    private String phone;
    private String mail;
    private String Pass;
    private String estado;
    
    public String getCod() {
        return Cod;
    }

    public void setCod(String Cod) {
        this.Cod = Cod;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getDirec() {
        return direc;
    }

    public void setDirec(String direc) {
        this.direc = direc;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String Pass) {
        this.Pass = Pass;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
        
    
    
    public PersonClass() {
    }

    public PersonClass(String Cod, String name, String LastName, String dni, String direc, String phone, String mail, String Pass, String estado) {
        this.Cod = Cod;
        this.name = name;
        this.LastName = LastName;
        this.dni = dni;
        this.direc = direc;
        this.phone = phone;
        this.mail = mail;
        this.Pass = Pass;
        this.estado = estado;
    }

   
    

}
