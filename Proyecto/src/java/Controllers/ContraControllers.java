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
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Jose
 */
public class ContraControllers extends HttpServlet {

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

            case "update":
                contra(request, response);
                break;

            case "up":
                cont(request, response);
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

    private void contra(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        String contrasena = request.getParameter("documento");
        String correo = request.getParameter("email");
        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();

        String encriptacion = DigestUtils.md5Hex(contrasena);
        Transaction tx = sesion.beginTransaction();
        Query q = sesion.createQuery("Update Usuario set contrasena=:n where idUsuario=:i");
        q.setParameter("n", encriptacion);
        q.setParameter("i", empleado);

        int status = q.executeUpdate();
        System.out.println(status);
        tx.commit();

        try {
            response.sendRedirect("DatosUsuario.jsp");
        } catch (IOException ex) {
            Logger.getLogger(ContraControllers.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void cont(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();

        Transaction tx = sesion.beginTransaction();
        Query q = sesion.createQuery("Update Usuario set correo=:n,telefono=:y where idUsuario=:i");
        q.setParameter("n", email);
        q.setParameter("y", telefono);
        q.setParameter("i", empleado);

        int status = q.executeUpdate();
        System.out.println(status);
        tx.commit();


        try {
            response.sendRedirect("DatosUsuario.jsp");
        } catch (IOException ex) {
            Logger.getLogger(ContraControllers.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
