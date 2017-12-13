/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.HibernateUtil;
import Modelos.Pedido;
import Modelos.TipoProducto;
import Modelos.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Natalia
 */
public class ControllerTipoProducto extends HttpServlet {

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
            case "estado":
                estado(request, response);
                break;    

        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        String nombre = request.getParameter("nombre");

        ArrayList con = new ArrayList();
        Query p = sesion.createQuery("FROM TipoProducto WHERE nombre = '" + nombre + "' ");
        con = (ArrayList) p.list();

        if (con.size() == 0) {

            TipoProducto tp = new TipoProducto(nombre, "Edicion");

            sesion.beginTransaction();
            sesion.save(tp);
            sesion.getTransaction().commit();
            sesion.close();

            try {
                response.sendRedirect("CTipoProducto?action=admin&rta=Yes");
            } catch (IOException ex) {
                Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {

            try {
                response.sendRedirect("_registrarproducto.jsp?rta=mal");
            } catch (IOException ex) {
                Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    public void admin(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Query q = sesion.createQuery("FROM TipoProducto");
        ArrayList TipoProducto = (ArrayList) q.list();

        ArrayList<TipoProducto> tproducto = new ArrayList<>();

        for (Object pe : TipoProducto) {

            TipoProducto tp = (TipoProducto) pe;
            tproducto.add(tp);

        }

        request.setAttribute("listatproducto", TipoProducto);

        try {
            request.getRequestDispatcher("Admintproducto.jsp").forward(request, response);
        } catch (IOException ex) {
            Logger.getLogger(ControllerTipoProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void actualizar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        TipoProducto tp = (TipoProducto) sesion.get(TipoProducto.class, Integer.parseInt(request.getParameter("id")));
        if (request.getMethod().equalsIgnoreCase("GET")) {

            request.setAttribute("Tipoproducto", tp);

            try {
                request.getRequestDispatcher("Actutproducto.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerTipoProducto.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerTipoProducto.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {

            tp.setNombre(request.getParameter("nombre"));

            sesion.beginTransaction();
            sesion.saveOrUpdate(tp);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("CTipoProducto?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }
        private void estado(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        TipoProducto tp = (TipoProducto) sesion.get(TipoProducto.class, Integer.parseInt(request.getParameter("id")));
        int conti = tp.getIdTipoProducto();

        String estado = "Finalizar";
      
        tp.setEstado(estado);
        sesion.beginTransaction();
        sesion.saveOrUpdate(tp);
        sesion.getTransaction().commit();

        
        try {
            request.getRequestDispatcher("CTipoProducto?action=admin").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ControllerTipoProducto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerTipoProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
  

     
        sesion.close();
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
    } // </editor-fold>

}
