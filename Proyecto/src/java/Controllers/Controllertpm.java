/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.HibernateUtil;
import Modelos.Material;
import Modelos.Pedido;
import Modelos.TipoProducto;
import Modelos.TipoProductoYMaterial;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class Controllertpm extends HttpServlet {

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
            case "eliminar":
                eliminar(request, response);
                break;
            case "redireccionar":
                redireccionar(request, response);
                break;
            case "admin1":
                admin1(request, response);
                break;    

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

        TipoProducto tipoProducto = (TipoProducto) sesion.get(TipoProducto.class, id);
        int conti = tipoProducto.getIdTipoProducto();
        
        double cantidad;
        cantidad = Double.parseDouble(request.getParameter("cantidad"));
      
       Material material = (Material) sesion.get(Material.class, Integer.parseInt(request.getParameter("idmaterial")));

        

           TipoProductoYMaterial tpm = new TipoProductoYMaterial(material, tipoProducto, cantidad);
            sesion.beginTransaction();
            sesion.save(tpm);
            sesion.getTransaction().commit();
            sesion.close();
            

        try {
            response.sendRedirect("Ctpm?action=admin&id=" + conti + "");
        } catch (IOException ex) {
            Logger.getLogger(Controllertpm.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    private void admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        TipoProducto tproducto = (TipoProducto) sesion.get(TipoProducto.class, Integer.parseInt(request.getParameter("id")));
        int tp = tproducto.getIdTipoProducto();
        Cookie p = new Cookie("id", request.getParameter("id"));
        System.out.println(request.getParameter("id"));
        p.setPath("/");
        response.addCookie(p);

        Query q = sesion.createQuery("FROM TipoProductoYMaterial where tipoProducto = '" + tp + "'");
        ArrayList TipoProducto = (ArrayList) q.list();

        ArrayList<TipoProductoYMaterial> ped = new ArrayList<TipoProductoYMaterial>();

        for (Object pe : TipoProducto) {

            TipoProductoYMaterial pedido = (TipoProductoYMaterial) pe;
            ped.add(pedido);

        }

        request.setAttribute("listatproducto", TipoProducto);
            PrintWriter out = response.getWriter();
      
        
        Query qp = (Query) sesion.createQuery("FROM Material");
        ArrayList lista = (ArrayList) qp.list();

        ArrayList<Material> m = new ArrayList<>();
       for (Object Obj : lista) {
           Material ma = (Material) Obj;
            m.add(ma);
            out.println("Imprime " + ma.getIdMaterial());
        }
        request.setAttribute("Arraymaterial", m);

        try {
            request.getRequestDispatcher("ConsultarTpm.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    
    
        private void redireccionar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        TipoProducto tp = (TipoProducto) sesion.get(TipoProducto.class, Integer.parseInt(request.getParameter("id")));
        int tipo = tp.getIdTipoProducto();

        
        tp.setNombre("nombre");
        sesion.beginTransaction();
        sesion.saveOrUpdate(tp);
        sesion.getTransaction().commit();

        Query q = sesion.createQuery("FROM TipoProductoYMaterial where TipoProducto = '" + tipo + "'");
        ArrayList tpm = (ArrayList) q.list();

        ArrayList<TipoProductoYMaterial> ped = new ArrayList<TipoProductoYMaterial>();

        for (Object pe : tpm) {

            TipoProductoYMaterial tipopm = (TipoProductoYMaterial) pe;
            tipopm.setTipoProducto(tp);
            sesion.beginTransaction();
            sesion.saveOrUpdate(tp);
            sesion.getTransaction().commit();
            ped.add(tipopm);

        }
        request.setAttribute("Arraytipoproducto", ped);

        
        try {
            request.getRequestDispatcher("Admintpm.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(Controllertpm.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    


    }
         private void eliminar(HttpServletRequest request, HttpServletResponse response) {

        Session sesion = HibernateUtil.getSessionFactory().openSession();

        TipoProductoYMaterial tpm = (TipoProductoYMaterial) sesion.get(TipoProductoYMaterial.class, Integer.parseInt(request.getParameter("id")));

        sesion.beginTransaction();
        sesion.delete(tpm);
        sesion.getTransaction().commit();
        sesion.close();
        int conti = tpm.getTipoProducto().getIdTipoProducto();

        try {
            response.sendRedirect("Ctpm?action=admin&id=" + conti + "");
        } catch (IOException ex) {
            Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

         private void admin1(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        TipoProducto tproducto = (TipoProducto) sesion.get(TipoProducto.class, Integer.parseInt(request.getParameter("id")));
        int tp = tproducto.getIdTipoProducto();
        Cookie p = new Cookie("id", request.getParameter("id"));
        System.out.println(request.getParameter("id"));
        p.setPath("/");
        response.addCookie(p);

        Query q = sesion.createQuery("FROM TipoProductoYMaterial where tipoProducto = '" + tp + "'");
        ArrayList TipoProducto = (ArrayList) q.list();

        ArrayList<TipoProductoYMaterial> ped = new ArrayList<TipoProductoYMaterial>();

        for (Object pe : TipoProducto) {

            TipoProductoYMaterial pedido = (TipoProductoYMaterial) pe;
            ped.add(pedido);

        }

        request.setAttribute("listatproducto", TipoProducto);
            PrintWriter out = response.getWriter();
      
        
        Query qp = (Query) sesion.createQuery("FROM Material");
        ArrayList lista = (ArrayList) qp.list();

        ArrayList<Material> m = new ArrayList<>();
       for (Object Obj : lista) {
           Material ma = (Material) Obj;
            m.add(ma);
            out.println("Imprime " + ma.getIdMaterial());
        }
        request.setAttribute("Arraymaterial", m);

        try {
            request.getRequestDispatcher("ConsultarTpmF.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
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

}
