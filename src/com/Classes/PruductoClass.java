/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Classes;

import java.sql.Date;

/**
 *
 * @author daniel
 */
public class PruductoClass extends PersonClass{
    private String cod_proveedor;
    private String descripcion;
    private double precio,stock;
    private Date fecha;

    public PruductoClass(String cod_proveedor, String descripcion, double precio, double stock, Date fecha) {
        this.cod_proveedor = cod_proveedor;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.fecha = fecha;
    }

    public PruductoClass() {
    }

    public String getCod_proveedor() {
        return cod_proveedor;
    }

    public void setCod_proveedor(String cod_proveedor) {
        this.cod_proveedor = cod_proveedor;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getStock() {
        return stock;
    }

    public void setStock(double stock) {
        this.stock = stock;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
    
}
