/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.HibernateUtil;
import Modelos.Ingreso;
import Modelos.Salida;
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
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Alejandro Bernal
 */
public class LoginPruebaController extends HttpServlet {

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
            case "cerrar_sesion":
                cerrar_sesion(request, response);
                break;

            case "update":
                update(request, response);
                break;

            case "url":
                inicio(request, response);
                break;
            case "error404":
                error404(request, response);
                break;
        }

    }

    private void error404(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.sendRedirect("404.jsp");
    }

    private void cerrar_sesion(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        if (session != null) {
            HttpSession httpSesion = request.getSession();
            httpSesion.setAttribute("Usuario", null);
            httpSesion.setAttribute("idPerfil", null);
            session.invalidate();
            try {
                response.sendRedirect("Login.jsp");
            } catch (IOException ex) {
                Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
            }
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

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();

        if (action.equals("update")) {

            String contrasena1 = request.getParameter("loginPass1");
            String correo1 = request.getParameter("loginEmail1");
            int documento = Integer.parseInt(request.getParameter("loginNumero"));

            String encriptacion = DigestUtils.md5Hex(contrasena1);
            System.out.print(encriptacion);

            ArrayList con = new ArrayList();
            Query l = sesion.createQuery("FROM Usuario WHERE correo='"+correo1+"' AND  documento = '"+documento+"'AND estado = 'Activo'");
            con = (ArrayList) l.list();

       


                Transaction tx = sesion.beginTransaction();
                Query q = sesion.createQuery("update Usuario set contrasena=:n where documento=:i");
                q.setParameter("n", encriptacion);
                q.setParameter("i", documento);

                int status = q.executeUpdate();
                System.out.println(status);
                tx.commit();

                try {
                    response.sendRedirect("Login.jsp?action=correcto");
                } catch (IOException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                }

        

            

        } else if (action.equals("inicio")) {

            String correo = request.getParameter("loginEmail");
            String contrasena = request.getParameter("loginPass");
            String cargo = request.getParameter("cargo");
            String encriptacion = DigestUtils.md5Hex(contrasena);
            ArrayList corr = new ArrayList();

            Query co = sesion.createQuery("FROM Usuario WHERE correo = '" + correo + "'");
            corr = (ArrayList) co.list();

            ArrayList con = new ArrayList();
            Query p = sesion.createQuery("FROM Usuario WHERE correo='" + correo + "'AND  contrasena = '" + encriptacion + "'AND estado = 'Activo'");
            con = (ArrayList) p.list();

            sesion.close();

            if (corr.size() != 0 || con.size() != 0) {
                if (cargo != null) {
                    if (corr.size() == 1) {

                        if (con.size() == 1) {

                            for (Object usuario1 : corr) {
                                HttpSession httpSesion = request.getSession();
                                String perfil = "";
                                int id = 0;
                                Usuario usu = (Usuario) usuario1;
                                perfil = usu.getCargo();
                                id = usu.getIdUsuario();
                                httpSesion.setAttribute("Usuario", usu);
                                httpSesion.setAttribute("idPerfil", perfil);

                                try {

                                    request.getRequestDispatcher("Home.jsp").forward(request, response);
                                } catch (ServletException ex) {
                                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                                } catch (IOException ex) {
                                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                                }

                            }

                        }else {
                System.out.println("Por favor ingrese los datos correctamente o puede que su usuario no existe");
                try {

                    request.getRequestDispatcher("Login.jsp?action=No").forward(request, response);
                } catch (ServletException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
                    }else {
                System.out.println("Por favor ingrese los datos correctamente o puede que su usuario no existe");
                try {

                    request.getRequestDispatcher("Login.jsp?action=No").forward(request, response);
                } catch (ServletException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
                }else {
                System.out.println("Por favor ingrese los datos correctamente o puede que su usuario no existe");
                try {

                    request.getRequestDispatcher("Login.jsp?action=No").forward(request, response);
                } catch (ServletException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            } else {
                System.out.println("Por favor ingrese los datos correctamente o puede que su usuario no existe");
                try {

                    request.getRequestDispatcher("Login.jsp?action=No").forward(request, response);
                } catch (ServletException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }

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

    private void update(HttpServletRequest request, HttpServletResponse response) {
        /* String correo = request.getParameter("loginEmail");
        String contrasena = request.getParameter("loginPassnew");

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        ArrayList corr = new ArrayList();
        Query co = sesion.createQuery("FROM Usuario WHERE correo = '" + correo + "'");
        corr = (ArrayList) co.list();
        sesion.close();

        if (corr.size() == 1) {
            Query query = sesion.createQuery("update Usuario set contrasena = :stockName"
                    + " where correo = :stockCode");
            query.setParameter("stockName", correo);
            query.setParameter("stockCode", contrasena);
            int rowCount = query.executeUpdate();

            System.out.println("Rows affected: " + rowCount);
        }*/

    }

    private void inicio(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("404.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
