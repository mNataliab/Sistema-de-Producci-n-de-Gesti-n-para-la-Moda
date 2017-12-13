/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.HibernateUtil;
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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ALEJANDRO BERNAL
 */
public class ControllerSalida extends HttpServlet {

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

            case "select":
                Select(request, response);
                break;

            case "select2":
                Select2(request, response);
                break;
            case "validacion":
                validacion(request, response);
                break;

            case "actualizar":
                actualizar(request, response);
                break;

            case "admin":
                administrar(request, response);
                break;

            case "select3":
                select3(request, response);
                break;

            case "estado":
                estado(request, response);
                break;

        }
    }

    private void validacion(HttpServletRequest request, HttpServletResponse response) {

        PrintWriter ot = null;
        try {
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            double doc = Double.parseDouble(request.getParameter("cantidad"));
            String id = request.getParameter("id");
            ArrayList emp = new ArrayList();
            ArrayList empq = new ArrayList();
            Query q = (Query) sesion.createQuery("FROM Material WHERE idMaterial = '" + id + "' ");
            emp = (ArrayList) q.list();
            ArrayList<Material> arraySalida = new ArrayList<Material>();

            ot = response.getWriter();
            for (Object Obj : emp) {
                Material ssali = (Material) Obj;

                if (ssali.getCantidad() < doc) {
                    ot.print("si");
                } else {
                    ot.print("no");
                }
            }
            sesion.close();

        } catch (IOException ex) {
            Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ot.close();
        }

    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = Modelos.HibernateUtil.getSessionFactory().openSession();

        //   int id = Integer.parseInt(request.getParameter("id"));
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

        Material sali = (Material) sesion.get(Material.class, Integer.parseInt(request.getParameter("idMaterial")));
        double suma = sali.getCantidad();

        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();

        Usuario usua = (Usuario) sesion.get(Usuario.class, empleado);

        Date fecha = new Date();

        double Cantidad = Double.parseDouble(request.getParameter("cantidad"));

        if (suma >= Cantidad) {
            double CantidadFinal = suma - Cantidad;

            Salida salida = new Salida(sali, cotizacion, usua, fecha, Cantidad);

            sali.setCantidad(CantidadFinal);
            sesion.beginTransaction();
            sesion.saveOrUpdate(sali);
            sesion.getTransaction().commit();

            sesion.beginTransaction();
            sesion.save(salida);
            sesion.getTransaction().commit();

            sesion.close();

            try {
                response.sendRedirect("ControllerSalida?action=admin&rta=Yes");
            } catch (IOException ex) {
                Logger.getLogger(ControllerSalida.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (suma < Cantidad) {
            try {

                request.getRequestDispatcher("ControllerSalida?action=select3&id='" + conti + "'").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    private void Select(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        System.out.println(id);
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();
        String cargo = em.getCargo();
        System.out.println(empleado);
        if (cargo.equals("Administrador")) {

            Query q = sesion.createQuery("FROM Pedido WHERE estado = 'Finalizado'");
            ArrayList listaObjetos = (ArrayList) q.list();
            ArrayList<Pedido> Arrayusuario = new ArrayList<Pedido>();

            for (Object Obj : listaObjetos) {
                Pedido usu = (Pedido) Obj;
                Arrayusuario.add(usu);
            }
            request.setAttribute("Arrayusuario", Arrayusuario);
            try {
                request.getRequestDispatcher("RegistroSalida.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerSalida.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerSalida.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {

            Query q = sesion.createQuery("FROM Pedido WHERE estado = 'Finalizado' AND usuario = '" + empleado + "'");
            ArrayList listaObjetos = (ArrayList) q.list();
            ArrayList<Pedido> Arrayusuario = new ArrayList<Pedido>();

            for (Object Obj : listaObjetos) {
                Pedido usu = (Pedido) Obj;
                Arrayusuario.add(usu);
            }
            request.setAttribute("Arrayusuario", Arrayusuario);
            try {
                request.getRequestDispatcher("RegistroSalida.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerSalida.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerSalida.class.getName()).log(Level.SEVERE, null, ex);
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

    private void actualizar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Salida material = (Salida) sesion.get(Salida.class, Integer.parseInt(request.getParameter("id")));

        Query q = sesion.createQuery("FROM Material");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Material> ArrayMaterial = new ArrayList<Material>();

        for (Object Obj : listaObjetos) {
            Material usu = (Material) Obj;
            ArrayMaterial.add(usu);
        }
        request.setAttribute("ArrayMaterials", ArrayMaterial);

        if (request.getMethod().equalsIgnoreCase("GET")) {
            request.setAttribute("salida", material);
            try {

                request.getRequestDispatcher("actuSalida.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {

            //Material mate = (Material) sesion.get(Usuario.class, Integer.parseInt(request.getParameter("idMaterial")));
            Double Cantidad = Double.parseDouble(request.getParameter("Cantidad"));

            double suma = material.getCantidad();

            if (suma >= Cantidad) {
                material.setCantidad(Cantidad);
                Material mate = (Material) sesion.get(Material.class, Integer.parseInt(request.getParameter("idtMaterial")));
                material.setMaterial(mate);

                sesion.beginTransaction();
                sesion.saveOrUpdate(material);
                sesion.getTransaction().commit();

                try {
                    response.sendRedirect("ControllerSalida?action=admin");
                } catch (IOException ex) {
                    Logger.getLogger(ControllerMateriales.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {

                try {

                    request.getRequestDispatcher("RegistrarSalida.jsp").forward(request, response);
                } catch (ServletException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(LoginPruebaController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

        }
    }

    private void Select2(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Query q = sesion.createQuery("FROM Material");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Material> Arrayusuario = new ArrayList<Material>();

        for (Object Obj : listaObjetos) {
            Material usu = (Material) Obj;
            Arrayusuario.add(usu);
        }
        request.setAttribute("arrayMaterial", Arrayusuario);
        try {
            request.getRequestDispatcher("RegistrarSalida.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ControllerSalida.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerSalida.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void administrar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();
        String cargo = em.getCargo();
        System.out.println(empleado);

        if (cargo.equals("Administrador")) {

            Query qw = (Query) sesion.createQuery("FROM Salida");//en este punto hace un select de todos las material que hay en la base de datos 
            ArrayList mates = (ArrayList) qw.list();

            ArrayList<Salida> maters = new ArrayList<Salida>();

            for (Object material : mates) {
                Salida materi = (Salida) material;
                maters.add(materi);
            }

            request.setAttribute("ListaSalida", maters); //en este punto crear un array que se llama ListaMaterial y que contenga 
            try {
                request.getRequestDispatcher("frmltodoS.jsp").forward(request, response);//aqui le dices a la vista qeu muestre todos los datos
            } catch (ServletException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            }
            sesion.close();
        } else {

            Query qw = (Query) sesion.createQuery("FROM Salida where usuario = '" + empleado + "'");//en este punto hace un select de todos las material que hay en la base de datos 
            ArrayList mates = (ArrayList) qw.list();

            ArrayList<Salida> maters = new ArrayList<Salida>();

            for (Object material : mates) {
                Salida materi = (Salida) material;
                maters.add(materi);
            }

            request.setAttribute("ListaSalida", maters); //en este punto crear un array que se llama ListaMaterial y que contenga 
            try {
                request.getRequestDispatcher("frmltodoS.jsp").forward(request, response);//aqui le dices a la vista qeu muestre todos los datos
            } catch (ServletException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerIngreso.class.getName()).log(Level.SEVERE, null, ex);

            }

        }
    }

    private void select3(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Query q = sesion.createQuery("FROM Material");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Material> Arrayusuario = new ArrayList<Material>();

        for (Object Obj : listaObjetos) {
            Material usu = (Material) Obj;
            Arrayusuario.add(usu);
        }
        request.setAttribute("arrayMaterial", Arrayusuario);
        try {
            request.getRequestDispatcher("RegistrarSalida.jsp?rta=mal").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ControllerSalida.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerSalida.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void estado(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Salida cotizacion = (Salida) sesion.get(Salida.class, Integer.parseInt(request.getParameter("id")));
        double cantidad = cotizacion.getCantidad();
        String nombre = cotizacion.getMaterial().getNombre();
        double cantidad_e = cotizacion.getMaterial().getCantidad();

        double cantidadT = cantidad + cantidad_e;

        Transaction tx = sesion.beginTransaction();
        Query q = sesion.createQuery("update Material set cantidad=:n where nombre=:i");
        q.setParameter("n", cantidadT);
        q.setParameter("i", nombre);

        int status = q.executeUpdate();
        System.out.println(status);
        tx.commit();

        sesion.beginTransaction();
        sesion.delete(cotizacion);
        sesion.getTransaction().commit();
        sesion.close();
        try {
            response.sendRedirect("ControllerSalida?action=admin&rta=Si");
        } catch (IOException ex) {
            Logger.getLogger(ControllerSalida.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }
}
