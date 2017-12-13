/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.HibernateUtil;
import Modelos.Pedido;
import Modelos.Producto;
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
import javax.swing.JOptionPane;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Karen Baez
 */
public class ControllerPedido extends HttpServlet {

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
                admin(request, response);
                break;
            case "actualizar":
                actualizar(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
            case "Select":
                Select(request, response);
                break;
            case "ver":
                ver(request, response);
                break;
            case "redireccionar":
                produccion(request, response);
                break;
            case "cargarprodped":
                prodpedi(request, response);
                break;
            case "finalizar":
                finalizar(request, response);
                break;
            case "finalizado":
                finalizaado(request, response);
                break;
            case "final":
                final2(request, response);
                break;
            case "estado":
                estado(request, response);
                break;
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        String clientes = request.getParameter("cliente");
        java.util.Date fecha = new java.util.Date();
        String estado = "Edicion";
        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();
        System.out.println(empleado);
        Usuario emple = (Usuario) sesion.get(Usuario.class, empleado);

        Pedido pedido = new Pedido(emple, estado, clientes, fecha);

        sesion.beginTransaction();
        sesion.save(pedido);
        sesion.getTransaction().commit();
        int id = pedido.getIdPedido();
        sesion.close();

        try {
            response.sendRedirect("Productos?action=admin&id=" + id + "");
        } catch (IOException ex) {
            Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void admin(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();
        String cargo = em.getCargo();
        System.out.println(empleado);

        if (cargo.equals("Administrador")) {
            Query q = sesion.createQuery("FROM Pedido");
            ArrayList Pedido = (ArrayList) q.list();

            ArrayList<Pedido> ped = new ArrayList<>();

            for (Object pe : Pedido) {

                Pedido pedido = (Pedido) pe;
                ped.add(pedido);

            }

            request.setAttribute("listaped", Pedido);

            try {
                request.getRequestDispatcher("ConsultarPedido.jsp").forward(request, response);
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            Query q = sesion.createQuery("FROM Pedido WHERE usuario = '" + empleado + "'");
            ArrayList Pedido = (ArrayList) q.list();

            ArrayList<Pedido> ped = new ArrayList<>();

            for (Object pe : Pedido) {

                Pedido pedido = (Pedido) pe;
                ped.add(pedido);

            }

            request.setAttribute("listaped", Pedido);

            try {
                request.getRequestDispatcher("ConsultarPedido.jsp").forward(request, response);
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    public void Select(HttpServletRequest request, HttpServletResponse response) throws ServletException {

        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Query q = sesion.createQuery("FROM Usuario");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Usuario> Arrayusuario = new ArrayList<Usuario>();

        for (Object Obj : listaObjetos) {
            Usuario usu = (Usuario) Obj;
            Arrayusuario.add(usu);
        }
        request.setAttribute("Arrayusuario", Arrayusuario);

        try {
            request.getRequestDispatcher("_registrar.jsp").forward(request, response);
        } catch (IOException ex) {
            Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void actualizar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query q = sesion.createQuery("FROM Usuario");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Usuario> Arrayusuario = new ArrayList<Usuario>();

        for (Object Obj : listaObjetos) {
            Usuario usu = (Usuario) Obj;
            Arrayusuario.add(usu);
        }
        request.setAttribute("Arrayusuario", Arrayusuario);

        Pedido pedido = (Pedido) sesion.get(Pedido.class, Integer.parseInt(request.getParameter("id")));
        if (request.getMethod().equalsIgnoreCase("GET")) {
            try {
                request.setAttribute("pedido", pedido);

                request.getRequestDispatcher("Actupedido.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {

            Date fecha = new Date();
            pedido.setFecha(fecha);
            pedido.setClientes(request.getParameter("clientes"));

            sesion.beginTransaction();
            sesion.saveOrUpdate(pedido);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("Cpedido?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Pedido pedido = (Pedido) sesion.get(Pedido.class, Integer.parseInt(request.getParameter("id")));

        sesion.beginTransaction();
        sesion.delete(pedido);
        sesion.getTransaction().commit();
        sesion.close();

        try {
            response.sendRedirect("Cpedido?action=admin");
        } catch (IOException ex) {

        }

    }

    private void ver(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        String id = request.getParameter("id");
        System.out.println(id);

        Query q = sesion.createQuery("FROM Usuario");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Usuario> Arrayusuario = new ArrayList<Usuario>();

        for (Object Obj : listaObjetos) {
            Usuario usu = (Usuario) Obj;
            Arrayusuario.add(usu);
        }
        request.setAttribute("Arrayusuario", Arrayusuario);

        Pedido pedido = (Pedido) sesion.get(ControllerPedido.class, Integer.parseInt(request.getParameter("id")));

        if (request.getMethod().equalsIgnoreCase("GET")) {
            request.setAttribute("pedido", pedido);

            try {
                request.getRequestDispatcher("VerPedido.jsp").forward(request, response);
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    /*

/*
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

    private void produccion(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        System.out.println(id);
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();
        String cargo = em.getCargo();
        System.out.println(empleado);

        if (cargo.equals("Administrador")) {

            Query q = sesion.createQuery("FROM Producto WHERE estado = 'Produccion' group by pedido");
            ArrayList listaObjetos = (ArrayList) q.list();
            ArrayList<Producto> Arrayusuario = new ArrayList<Producto>();

            for (Object Obj : listaObjetos) {
                Producto usu = (Producto) Obj;
                Arrayusuario.add(usu);
            }
            request.setAttribute("Arrayusuario", Arrayusuario);

            try {
                request.getRequestDispatcher("PedidosProduccion.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {

            Query k = sesion.createQuery("FROM Producto pro WHERE pro.estado = 'Produccion' AND pro.pedido.usuario = " + empleado + "  group by pedido ");
            ArrayList listaObjetoss = (ArrayList) k.list();
            ArrayList<Producto> Arrayusuarioss = new ArrayList<Producto>();

            for (Object Obj : listaObjetoss) {
                Producto usu = (Producto) Obj;
                Arrayusuarioss.add(usu);
            }
            request.setAttribute("Arrayusuario", Arrayusuarioss);

            try {
                request.getRequestDispatcher("PedidosProduccion.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    private void prodpedi(HttpServletRequest request, HttpServletResponse response) {
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
            Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();

    }

    private void finalizar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Pedido cotizacion = (Pedido) sesion.get(Pedido.class, Integer.parseInt(request.getParameter("id")));
        int conti = cotizacion.getIdPedido();
        String estadoP = "Finalizado";

        Query q = sesion.createQuery("FROM Producto where pedido = '" + conti + "'  group by pedido");
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

        Query k = sesion.createQuery("FROM Producto  where pedido.estado = 'Finalizado'  ");
        ArrayList Productoss = (ArrayList) q.list();
        ArrayList<Producto> Arrayusuario = new ArrayList<Producto>();
        for (Object Obj : Productos) {
            Producto usu = (Producto) Obj;
            Arrayusuario.add(usu);
        }
        request.setAttribute("Arrayusuario", Arrayusuario);

        try {
            request.getRequestDispatcher("PedidosFinalizados.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();
    }

    private void finalizaado(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        HttpSession se = request.getSession(true);
        Usuario em = (Usuario) se.getAttribute("Usuario");
        int empleado = em.getIdUsuario();
        String cargo = em.getCargo();
        System.out.println(empleado);

        if (cargo.equals("Administrador")) {
            Query k = sesion.createQuery("FROM Producto where pedido.estado = 'Finalizado' and estado = 'Finalizado'");
            ArrayList Productoss = (ArrayList) k.list();
            ArrayList<Producto> Arrayusuario = new ArrayList<Producto>();
            for (Object Obj : Productoss) {
                Producto usu = (Producto) Obj;
                Arrayusuario.add(usu);
            }
            request.setAttribute("Arrayusuario", Arrayusuario);

            try {
                request.getRequestDispatcher("PedidosFinalizados.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }

        }else{
        
           Query k = sesion.createQuery("FROM Producto where pedido.estado = 'Finalizado' and estado = 'Finalizado' and pedido.usuario = '"+empleado+"'");
            ArrayList Productoss = (ArrayList) k.list();
            ArrayList<Producto> Arrayusuario = new ArrayList<Producto>();
            for (Object Obj : Productoss) {
                Producto usu = (Producto) Obj;
                Arrayusuario.add(usu);
            }
            request.setAttribute("Arrayusuario", Arrayusuario);

            try {
                request.getRequestDispatcher("PedidosFinalizados.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        }

    }

    private void final2(HttpServletRequest request, HttpServletResponse response) {
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

        Query k = sesion.createQuery("FROM Salida where pedido = '" + conti + "'");
        ArrayList Productoss = (ArrayList) k.list();

        ArrayList<Salida> sal = new ArrayList<Salida>();

        for (Object pes : Productoss) {

            Salida pedido = (Salida) pes;

            sal.add(pedido);

        }
        request.setAttribute("ArraySalida", sal);

        try {
            request.getRequestDispatcher("InformeMaterialF.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();

    }

    private void estado(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Pedido cotizacion = (Pedido) sesion.get(Pedido.class, Integer.parseInt(request.getParameter("id")));
        int id = cotizacion.getIdPedido();

        ArrayList cor = new ArrayList();
        Query c = sesion.createQuery("FROM Salida WHERE pedido = '" + id + "' ");
        cor = (ArrayList) c.list();
        if (cor.size() != 0) {
            try {
                request.getRequestDispatcher("Cpedido?action=admin&rta=No").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            cotizacion.setEstado("Cancelar");
            sesion.beginTransaction();
            sesion.saveOrUpdate(cotizacion);
            sesion.getTransaction().commit();

            try {
                request.getRequestDispatcher("Cpedido?action=admin").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(ControllerPedido.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }
}
