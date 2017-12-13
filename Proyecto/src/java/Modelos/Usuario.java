package Modelos;
// Generated 29/11/2017 08:00:02 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private Integer idUsuario;
     private String nombre;
     private String apellido;
     private int documento;
     private String telefono;
     private String correo;
     private String cargo;
     private String estado;
     private String genero;
     private String contrasena;
     private Set<Salida> salidas = new HashSet<Salida>(0);
     private Set<Ingreso> ingresos = new HashSet<Ingreso>(0);
     private Set<Pedido> pedidos = new HashSet<Pedido>(0);

    public Usuario() {
    }

	
    public Usuario(String nombre, String apellido, int documento, String telefono, String correo, String cargo, String estado, String genero, String contrasena) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.documento = documento;
        this.telefono = telefono;
        this.correo = correo;
        this.cargo = cargo;
        this.estado = estado;
        this.genero = genero;
        this.contrasena = contrasena;
    }
    public Usuario(String nombre, String apellido, int documento, String telefono, String correo, String cargo, String estado, String genero, String contrasena, Set<Salida> salidas, Set<Ingreso> ingresos, Set<Pedido> pedidos) {
       this.nombre = nombre;
       this.apellido = apellido;
       this.documento = documento;
       this.telefono = telefono;
       this.correo = correo;
       this.cargo = cargo;
       this.estado = estado;
       this.genero = genero;
       this.contrasena = contrasena;
       this.salidas = salidas;
       this.ingresos = ingresos;
       this.pedidos = pedidos;
    }
   
    public Integer getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellido() {
        return this.apellido;
    }
    
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    public int getDocumento() {
        return this.documento;
    }
    
    public void setDocumento(int documento) {
        this.documento = documento;
    }
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getCorreo() {
        return this.correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public String getCargo() {
        return this.cargo;
    }
    
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    public String getEstado() {
        return this.estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public String getGenero() {
        return this.genero;
    }
    
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public String getContrasena() {
        return this.contrasena;
    }
    
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    public Set<Salida> getSalidas() {
        return this.salidas;
    }
    
    public void setSalidas(Set<Salida> salidas) {
        this.salidas = salidas;
    }
    public Set<Ingreso> getIngresos() {
        return this.ingresos;
    }
    
    public void setIngresos(Set<Ingreso> ingresos) {
        this.ingresos = ingresos;
    }
    public Set<Pedido> getPedidos() {
        return this.pedidos;
    }
    
    public void setPedidos(Set<Pedido> pedidos) {
        this.pedidos = pedidos;
    }




}


