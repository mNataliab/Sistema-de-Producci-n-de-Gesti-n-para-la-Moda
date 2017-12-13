/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.HibernateUtil;
import Modelos.Ingreso;
import Modelos.Material;
import Modelos.Pedido;
import Modelos.Salida;
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
 * @author Portatil-HP
 */
public class ControllerIngreso extends HttpServlet {

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
                Administrar(request, response);
                break;
            case "actualizar":
                actualizar(request, response);
                break;
            /* case "eliminar":
                eliminar(request, response);
                break;*/
            case "select":
                Select(request, response);
                break;
            /* case "ver":
                ver(request, response);
                break;*/

        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = Modelos.HibernateUtil.getSessionFactory().openSession();
        
        

        Material mater = (Material) sesion.get(Material.class, Integer.parseInt(request.getParameter("idMaterial")));
        double suma = mater.getCantidad();

        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();

        Usuario usua = (Usuario) sesion.get(Usuario.class, empleado);
        Date fecha = new Date();
        double Cantidad = Double.parseDouble(request.getParameter("cantidad"));
        double CantidadFinal = suma + Cantidad;
        String Observacion = request.getParameter("observacion");

        Ingreso ingre = new Ingreso(mater, usua, fecha, Cantidad, Observacion);

        mater.setCantidad(CantidadFinal);
        sesion.beginTransaction();
        sesion.saveOrUpdate(mater);
        sesion.getTransaction().commit();

        sesion.beginTransaction();
        sesion.save(ingre);
        sesion.getTransaction().commit();

        sesion.close();

        try {
            response.sendRedirect("ControllerIngreso?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void Administrar(HttpServletRequest request, HttpServletResponse response) {
        // tatis tu no puedes llamar a la lista basicamente por que al llamar a consultarmaterial.jsp 
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();
        String cargo = em.getCargo();
        System.out.println(empleado);

        if (cargo.equals("Administrador")) {
            Query q = (Query) sesion.createQuery("FROM Ingreso");//en este punto hace un select de todos las material que hay en la base de datos 
            ArrayList mate = (ArrayList) q.list();

            Query qw = (Query) sesion.createQuery("FROM Salida");//en este punto hace un select de todos las material que hay en la base de datos 
            ArrayList mates = (ArrayList) qw.list();

            ArrayList<Ingreso> mater = new ArrayList<Ingreso>();

            for (Object material : mate) {
                Ingreso materi = (Ingreso) material;
                mater.add(materi);
            }
            ArrayList<Salida> maters = new ArrayList<Salida>();

            for (Object material : mates) {
                Salida materi = (Salida) material;
                maters.add(materi);
            }
            request.setAttribute("ListaIngreso", mater); //en este punto crear un array que se llama ListaMaterial y que contenga 
            request.setAttribute("ListaSalida", maters); //en este punto crear un array que se llama ListaMaterial y que contenga 
            try {
                request.getRequestDispatcher("frmltodo.jsp").forward(request, response);//aqui le dices a la vista qeu muestre todos los datos
            } catch (ServletException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            }
            sesion.close();

        } else {
            Query qw = (Query) sesion.createQuery("FROM Salida WHERE usuario = '" + empleado + "'");//en este punto hace un select de todos las material que hay en la base de datos 
            ArrayList mates = (ArrayList) qw.list();

            ArrayList<Salida> maters = new ArrayList<Salida>();

            for (Object material : mates) {
                Salida materi = (Salida) material;
                maters.add(materi);
            }

            request.setAttribute("ListaSalida", maters); //en este punto crear un array que se llama ListaMaterial y que contenga 
            try {
                request.getRequestDispatcher("frmltodo.jsp").forward(request, response);//aqui le dices a la vista qeu muestre todos los datos
            } catch (ServletException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            }
            sesion.close();
        }

    }

    private void Select(HttpServletRequest request, HttpServletResponse response) {

        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Query qCarrera = (Query) sesion.createQuery("FROM Material");
        ArrayList listaCarrera = (ArrayList) qCarrera.list();

        ArrayList<Material> arrayCarrera = new ArrayList<Material>();

        for (Object Obj : listaCarrera) {
            Material salon = (Material) Obj;
            arrayCarrera.add(salon);

        }

        request.setAttribute("arrayMaterial", listaCarrera);

        sesion.close();
        try {
            request.getRequestDispatcher("RegistrarIngreso.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
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

    private void actualizar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Ingreso material = (Ingreso) sesion.get(Ingreso.class, Integer.parseInt(request.getParameter("id")));
        
        Query q = sesion.createQuery("FROM Material");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Material> ArrayMaterial = new ArrayList<Material>();

        for (Object Obj : listaObjetos) {
            Material usu = (Material) Obj;
            ArrayMaterial.add(usu);
        }
        request.setAttribute("ArrayMaterials", ArrayMaterial);

        if (request.getMethod().equalsIgnoreCase("GET")) {
            request.setAttribute("ingreso", material);
            try {

                request.getRequestDispatcher("actuIngreso.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {

            //Material mate = (Material) sesion.get(Usuario.class, Integer.parseInt(request.getParameter("idMaterial")));
            Double Cantidad = Double.parseDouble(request.getParameter("Cantidad"));
            material.setCantidad(Cantidad);

            String observacion = request.getParameter("Observacion");
            material.setObservacion(observacion);

            Material mate = (Material) sesion.get(Material.class, Integer.parseInt(request.getParameter("idtMaterial")));
            material.setMaterial(mate);

            sesion.beginTransaction();
            sesion.saveOrUpdate(material);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("ControllerIngreso?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(ControllerMateriales.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}
