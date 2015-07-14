/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.Interfaces.InterfaceOp;
import com.conexion.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author daniel
 */
public class DaoProducto implements InterfaceOp {
    
    

    @Override
    public void insertarRegistro() {
//        Connection connection = null;
//        PreparedStatement preparedStatement = null;
//        try{
//       
//            
//            connection = conexion.connect();
//            preparedStatement=connection.prepareStatement("INSERT INTO productos(cod_pro,cod_proveedor,descrip_pro,precio_pro,stock_pro,fecha_pro) VALUES(?,?,?,?,?,?)");
//            preparedStatement.setString(1, person.getFirtsName());
//            preparedStatement.setString(2, person.getLastName());
//            preparedStatement.executeUpdate();
//            System.out.println("INSERT INTO person(first_name,last_name) VALUES(?,?)");
//        }catch(Exception e){
//            e.printStackTrace();
//        }finally{
//            if(connection!=null){
//                try{
//                    connection.close();
//                }catch(SQLException e){
//                    e.printStackTrace();
//                }
//            }
//        }
        
        
    }

    @Override
    public void modificar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actualizar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void mostrar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
