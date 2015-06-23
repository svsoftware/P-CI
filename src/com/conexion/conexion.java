/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Christianlp
 * @date 23/06/2015
 * @time 05:49:53 PM
 * @package com.conexion
 * @project proyectoCI
 */
public class conexion {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/dbventas";
    private static final String USER ="root";
    private static final String PW = "";
    Connection jCnn = null;
    public Connection connection(){
        try{
            Class.forName(DRIVER);
            jCnn=DriverManager.getConnection(URL,USER,PW);
        }catch(ClassNotFoundException e){
            JOptionPane.showMessageDialog(null, e);
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return jCnn;
    }

}
