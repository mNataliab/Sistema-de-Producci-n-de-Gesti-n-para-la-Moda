package Modelos;
// Generated 29/11/2017 08:00:02 PM by Hibernate Tools 4.3.1



/**
 * TipoProductoYMaterial generated by hbm2java
 */
public class TipoProductoYMaterial  implements java.io.Serializable {


     private Integer tipoProductoYMaterial;
     private Material material;
     private TipoProducto tipoProducto;
     private double cantidad;

    public TipoProductoYMaterial() {
    }

    public TipoProductoYMaterial(Material material, TipoProducto tipoProducto, double cantidad) {
       this.material = material;
       this.tipoProducto = tipoProducto;
       this.cantidad = cantidad;
    }
   
    public Integer getTipoProductoYMaterial() {
        return this.tipoProductoYMaterial;
    }
    
    public void setTipoProductoYMaterial(Integer tipoProductoYMaterial) {
        this.tipoProductoYMaterial = tipoProductoYMaterial;
    }
    public Material getMaterial() {
        return this.material;
    }
    
    public void setMaterial(Material material) {
        this.material = material;
    }
    public TipoProducto getTipoProducto() {
        return this.tipoProducto;
    }
    
    public void setTipoProducto(TipoProducto tipoProducto) {
        this.tipoProducto = tipoProducto;
    }
    public double getCantidad() {
        return this.cantidad;
    }
    
    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }




}


