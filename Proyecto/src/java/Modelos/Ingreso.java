package Modelos;
// Generated 29/11/2017 08:00:02 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Ingreso generated by hbm2java
 */
public class Ingreso  implements java.io.Serializable {


     private Integer idIngreso;
     private Material material;
     private Usuario usuario;
     private Date fecha;
     private double cantidad;
     private String observacion;

    public Ingreso() {
    }

    public Ingreso(Material material, Usuario usuario, Date fecha, double cantidad, String observacion) {
       this.material = material;
       this.usuario = usuario;
       this.fecha = fecha;
       this.cantidad = cantidad;
       this.observacion = observacion;
    }
   
    public Integer getIdIngreso() {
        return this.idIngreso;
    }
    
    public void setIdIngreso(Integer idIngreso) {
        this.idIngreso = idIngreso;
    }
    public Material getMaterial() {
        return this.material;
    }
    
    public void setMaterial(Material material) {
        this.material = material;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public double getCantidad() {
        return this.cantidad;
    }
    
    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }
    public String getObservacion() {
        return this.observacion;
    }
    
    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }




}

