/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.HibernateUtil;
import Modelos.Material;
import Modelos.Pedido;
import Modelos.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Equipo13
 */
public class ControllerMateriales extends HttpServlet {

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
            //llega a este punto y se va para el metodod de administar si 
            case "admin":
                Administrar(request, response);
            case "actualizar":
                actualizar(request, response);

        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = Modelos.HibernateUtil.getSessionFactory().openSession();

        String Nombre = request.getParameter("Nombre");
        System.out.print(Nombre);
        double Cantidad = Double.parseDouble(request.getParameter("Cantidad"));
        String UnidadMedida = request.getParameter("Unidad");

        ArrayList con = new ArrayList();
        Query p = sesion.createQuery("FROM Material WHERE nombre = '" + Nombre + "' ");
        con = (ArrayList) p.list();

        if (con.size() == 0) {
            Material material = new Material(Nombre, Cantidad, UnidadMedida);

            sesion.beginTransaction();
            sesion.save(material);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("ControllerMateriales?action=admin&rta=Yes");
            } catch (IOException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            }
            sesion.close();

        }else{
            
             try {
                response.sendRedirect("RegistrarMaterial.jsp?rta=mal");
            } catch (IOException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        
        
        
        }

    }

    private void Administrar(HttpServletRequest request, HttpServletResponse response) {
        // tatis tu no puedes llamar a la lista basicamente por que al llamar a consultarmaterial.jsp 
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Query q = (Query) sesion.createQuery("FROM Material");//en este punto hace un select de todos las material que hay en la base de datos 
        ArrayList mate = (ArrayList) q.list();
        sesion.close();

        ArrayList<Material> mater = new ArrayList<Material>();

        for (Object material : mate) {
            Material materi = (Material) material;
            mater.add(materi);
        }
        request.setAttribute("ListaMaterial", mater); //en este punto crear un array que se llama ListaMaterial y que contenga 

        try {
            request.getRequestDispatcher("ConsultarMaterial.jsp").forward(request, response);//aqui le dices a la vista qeu muestre todos los datos
        } catch (ServletException ex) {
            Logger.getLogger(ControllerMateriales.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerMateriales.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void actualizar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query q = sesion.createQuery("FROM Material");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Material> ArrayMaterial = new ArrayList<Material>();

        for (Object Obj : listaObjetos) {
            Material usu = (Material) Obj;
            ArrayMaterial.add(usu);
        }
        request.setAttribute("ArrayMaterial", ArrayMaterial);

        Material material = (Material) sesion.get(Material.class, Integer.parseInt(request.getParameter("id")));
        if (request.getMethod().equalsIgnoreCase("GET")) {
            try {
                request.setAttribute("material", material);

                request.getRequestDispatcher("ActualizarMaterial.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerMateriales.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerMateriales.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {

            //Material mate = (Material) sesion.get(Usuario.class, Integer.parseInt(request.getParameter("idMaterial")));
            String Nombre = request.getParameter("Nombre");//en este paso le decimos que tome el valor que tenga el imput nombre
            material.setNombre(Nombre);//que hace esto??' aqui le damos el uevo valor que queremos que tenga 

            Double Cantidad = Double.parseDouble(request.getParameter("Cantidad"));
            material.setCantidad(Cantidad);

            String medida = request.getParameter("Unidad");
            material.setUnidadMedida(medida);

            sesion.beginTransaction();
            sesion.saveOrUpdate(material);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("ControllerMateriales?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(ControllerMateriales.class.getName()).log(Level.SEVERE, null, ex);
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
