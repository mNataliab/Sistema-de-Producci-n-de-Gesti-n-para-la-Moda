/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.HibernateUtil;
import Modelos.Usuario;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Jose
 */
public class UsuarioController extends HttpServlet {

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

            case "create":
                registrar(request, response);
                break;

            case "admin":
                administrar(request, response);
                break;

            case "update":
                actualizar(request, response);

                break;

            case "delete":
                eliminar(request, response);

                break;

        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        int documento = Integer.parseInt(request.getParameter("documento"));
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("email");
        String contrasena = request.getParameter("documento");
        String cargo = request.getParameter("underwear");
        String estado = request.getParameter("derwear");
        String genero = request.getParameter("nderwear");
        String encriptacion = DigestUtils.md5Hex(contrasena);

        ArrayList con = new ArrayList();
        Query p = sesion.createQuery("FROM Usuario WHERE documento = "+documento+" ");
        con = (ArrayList) p.list();

        ArrayList cor = new ArrayList();
        Query c = sesion.createQuery("FROM Usuario WHERE correo = '"+correo+"' ");
        cor = (ArrayList) c.list();

        if (con.size() != 0) {
             try {
            request.getRequestDispatcher("RegistrarUsuarios.jsp?rta=mal").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        

        }else if(cor.size() != 0){
           try {
            request.getRequestDispatcher("RegistrarUsuarios.jsp?rta=malr").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        } else {

            Usuario t = new Usuario(nombre, apellido, documento, telefono, correo, cargo, estado, genero, encriptacion);
            //GUARDAMOS EBJETO EN BD
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(t);
            session.getTransaction().commit();
            session.close();

            try {

                response.sendRedirect("UsuarioController?action=admin&rta=Yes");
            } catch (IOException ex) {
                Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    //CREAMOS EL OBJETO CON DATOS EN     EL FORMULARIO
    private void administrar(HttpServletRequest request, HttpServletResponse response) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Query q = session.createQuery("FROM Usuario");
        ArrayList listaObjetos = (ArrayList) q.list();
        session.close();
        ArrayList<Usuario> usuari = new ArrayList<>();

        for (Object usu : listaObjetos) {
            Usuario us = (Usuario) usu;
            usuari.add(us);
        }

        request.setAttribute("LISTAR", usuari);

        try {
            request.getRequestDispatcher("AdministrarUsuario.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Usuario usuarios = (Usuario) session.get(Usuario.class, Integer.parseInt(request.getParameter("id")));

        request.setAttribute("usuarioss", usuarios);

        if (request.getMethod().equalsIgnoreCase("GET")) {
            try {
                request.getRequestDispatcher("EditarUsuario.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {

            String contrasena = request.getParameter("documento");
            String encriptacion = DigestUtils.md5Hex(contrasena);

            usuarios.setNombre(request.getParameter("nombre"));
            usuarios.setApellido(request.getParameter("apellido"));
            usuarios.setDocumento(Integer.parseInt(request.getParameter("documento")));
            usuarios.setTelefono(request.getParameter("telefono"));
            usuarios.setCorreo(request.getParameter("email"));
            usuarios.setContrasena(encriptacion);
            usuarios.setCargo(request.getParameter("underwear"));
            usuarios.setEstado(request.getParameter("derwear"));
            usuarios.setGenero(request.getParameter("nderwear"));

            session.beginTransaction();
            session.saveOrUpdate(usuarios);
            session.getTransaction().commit();

            try {
                response.sendRedirect("UsuarioController?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    public void eliminar(HttpServletRequest request, HttpServletResponse response) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Usuario productos = (Usuario) session.get(Usuario.class, Integer.parseInt(request.getParameter("id")));
        session.beginTransaction();
        session.delete(productos);
        session.getTransaction().commit();
        session.close();

        try {
            response.sendRedirect("UsuarioController?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
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
