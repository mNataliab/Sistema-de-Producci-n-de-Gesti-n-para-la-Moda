/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.HibernateUtil;
import Modelos.Pedido;
import Modelos.Producto;
import Modelos.TipoProducto;
import Modelos.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Natalia
 */
public class ProductosController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "admin":
                admin(request, response);
                break;

            case "create":
                registrar(request, response);
                break;

            case "actualizar":
                actualizar(request, response);
                break;

            case "eliminar":
                eliminar(request, response);
                break;

            case "redireccionar":
                redireccionar(request, response);
                break;

            case "ver":
                ver(request, response);
                break;

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Pedido cotizacion = (Pedido) sesion.get(Pedido.class, Integer.parseInt(request.getParameter("id")));
        int conti = cotizacion.getIdPedido();

        Cookie p = new Cookie("id", request.getParameter("id"));
        System.out.println(request.getParameter("id"));
        p.setPath("/");
        response.addCookie(p);

        Query q = sesion.createQuery("FROM Producto where pedido = '" + conti + "'");
        ArrayList Productos = (ArrayList) q.list();

        ArrayList<Producto> ped = new ArrayList<Producto>();

        for (Object pe : Productos) {

            Producto pedido = (Producto) pe;
            ped.add(pedido);

        }

        request.setAttribute("listaped", Productos);

        Query qprofesor = (Query) sesion.createQuery("FROM TipoProducto");
        ArrayList listaprofesor = (ArrayList) qprofesor.list();

        ArrayList<TipoProducto> tproducto = new ArrayList<>();
        PrintWriter out = response.getWriter();
        for (Object Obj : listaprofesor) {
            TipoProducto prof = (TipoProducto) Obj;
            tproducto.add(prof);
            out.println("Imprime " + prof.getNombre());
        }
        request.setAttribute("Arraytipoproducto", tproducto);

        try {
            request.getRequestDispatcher("ConsultarProducto.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Cookie[] c = request.getCookies();
        int co = 0;
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("id")) {
                co = i;
            }
        }
        int id = Integer.parseInt(c[co].getValue());
        System.out.println("desde aqui :P" + id);

        Pedido cotizacion = (Pedido) sesion.get(Pedido.class, id);
        int conti = cotizacion.getIdPedido();
        double cantidad;
        cantidad = Double.parseDouble(request.getParameter("cantidad"));
        String descripcion = request.getParameter("descripcion");

        TipoProducto tipoProducto = (TipoProducto) sesion.get(TipoProducto.class, Integer.parseInt(request.getParameter("idtproducto")));

        String Cliente_Material = request.getParameter("radio");
        if (Cliente_Material.equalsIgnoreCase("true") || Cliente_Material.equalsIgnoreCase("false")) {
            boolean material = Boolean.valueOf(Cliente_Material);

            Producto producto_cotizacion = new Producto(cotizacion, tipoProducto, cantidad, "Pendiente", material, descripcion);

            sesion.beginTransaction();
            sesion.save(producto_cotizacion);
            sesion.getTransaction().commit();
            sesion.close();
            try {

                response.sendRedirect("Productos?action=admin&id=" + conti + "");

            } catch (IOException ex) {
                Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Producto coti = (Producto) sesion.get(Producto.class, Integer.parseInt(request.getParameter("id")));//cualquier nombre

        Query p = sesion.createQuery("From TipoProducto ");
        ArrayList tipoProducto = (ArrayList) p.list();

        ArrayList<TipoProducto> client = new ArrayList<TipoProducto>(); //Arraylist de objetos salones
        for (Object obj : tipoProducto) {
            TipoProducto clie = (TipoProducto) obj;
            client.add(clie);
        }

        request.setAttribute("ListaProducto", client);

        if (request.getMethod().equalsIgnoreCase("GET")) { //muestra el formulario get 
            request.setAttribute("tipoProducto", coti);

            try {
                request.getRequestDispatcher("Actuproducto.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {//si guarda lo que envio el formulario
            double cantidad;
            cantidad = Double.parseDouble(request.getParameter("cantidad"));

            coti.setCantidad(cantidad);
            coti.setEstado("estado");
            coti.setDescripcion("descripcion");
            String Cliente_Material = request.getParameter("radio");
            if (Cliente_Material.equalsIgnoreCase("true") || Cliente_Material.equalsIgnoreCase("false")) {
                boolean material = Boolean.valueOf(Cliente_Material);
                coti.setDescripcion("material");

            }
            Pedido cotizacion = (Pedido) sesion.get(Pedido.class, Integer.parseInt(request.getParameter("id")));
            int conti = cotizacion.getIdPedido();
            coti.setPedido(cotizacion);

            TipoProducto cotis = (TipoProducto) sesion.get(TipoProducto.class, Integer.parseInt(request.getParameter("id2")));
            coti.setTipoProducto(cotis);
            //cualquier nombre            coti.setTipoProducto("idtproducto");

            sesion.beginTransaction();
            sesion.saveOrUpdate(coti);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("Productos?action=admin&id=" + conti + "");
            } catch (IOException ex) {
                Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {

        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Producto var = (Producto) sesion.get(Producto.class, Integer.parseInt(request.getParameter("id")));

        sesion.beginTransaction();
        sesion.delete(var);
        sesion.getTransaction().commit();
        sesion.close();
        int conti = var.getPedido().getIdPedido();

        try {
            response.sendRedirect("Productos?action=admin&id=" + conti + "");
        } catch (IOException ex) {
            Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void redireccionar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Pedido cotizacion = (Pedido) sesion.get(Pedido.class, Integer.parseInt(request.getParameter("id")));
        int conti = cotizacion.getIdPedido();

        String estado = "Finalizado";
        String estadoP = "Produccion";
        cotizacion.setEstado(estado);
        sesion.beginTransaction();
        sesion.saveOrUpdate(cotizacion);
        sesion.getTransaction().commit();

        Query q = sesion.createQuery("FROM Producto where pedido = '" + conti + "'");
        ArrayList Productos = (ArrayList) q.list();

        ArrayList<Producto> ped = new ArrayList<Producto>();

        for (Object pe : Productos) {

            Producto pedido = (Producto) pe;
            pedido.setEstado(estadoP);
            sesion.beginTransaction();
            sesion.saveOrUpdate(cotizacion);
            sesion.getTransaction().commit();
            ped.add(pedido);

        }
        request.setAttribute("Arraytipoproducto", ped);

        try {
            request.getRequestDispatcher("InformeMaterial.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();
    }

    private void ver(HttpServletRequest request, HttpServletResponse response) {
        
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Producto empleado = (Producto) sesion.get(Producto.class, Integer.parseInt(request.getParameter("id")));//cualquier nombre

        if (request.getMethod().equalsIgnoreCase("GET")) { //muestra el formulario get 
            request.setAttribute("producto", empleado);
            
            try {
                request.getRequestDispatcher("VerProducto.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
            }

         

        }
    }
}
