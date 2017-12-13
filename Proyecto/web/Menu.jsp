
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelos.Usuario" %>

<% if(session.getAttribute("idPerfil")==null){
     response.sendRedirect("loginprueba?action=error404");
    session.setAttribute("idPerfil", null);
    session.setAttribute("Usuario", null);
    session.invalidate();
}else if(session.getAttribute("idPerfil").toString().equals("Administrador")||session.getAttribute("idPerfil").toString().equals("Instructor") ) {
Usuario usu= (Usuario) session.getAttribute("Usuario");
String cargo=usu.getCargo();

%>


<!-- Left Sidebar Menu -->
<!------------------------menu administrador---------------------------->
<div class="fixed-sidebar-left">
    <ul class="nav navbar-nav side-nav nicescroll-bar">

        <% if(cargo.equals("Administrador")||cargo.equals("Instructor")) { %>  
        <li class="navigation-header">
            <span>Gestionar Pedidos</span> 
            <i class="zmdi zmdi-more"></i>
        </li>

        <li>
            <a href="Home.jsp"><div class="pull-left"><i class="fa fa-th mr-20"></i><span class="right-nav-text">Inicio</span></div><div class="clearfix"></div></a>
        </li>

        <li>
            <a href="_registrar.jsp"><div class="pull-left"><i class=" fa fa-file-text mr-20"></i><span class="right-nav-text">Registrar</span></div><div class="clearfix"></div></a>
        </li>
        <li>
            <a href="Cpedido?action=admin"><div class="pull-left"><i class=" fa fa-list-alt mr-20"></i><span class="right-nav-text">Administrar</span></div><div class="clearfix"></div></a>
        </li>
        <li>
            <a href="Cpedido?action=redireccionar"><div class="pull-left"><i class=" fa fa-barcode mr-20"></i><span class="right-nav-text">Pedidos Producción</span></div><div class="clearfix"></div></a>
        </li>

        <li>
            <a href="Cpedido?action=finalizado"><div class="pull-left"><i class=" fa fa-barcode mr-20"></i><span class="right-nav-text">Pedidos Finalizados</span></div><div class="clearfix"></div></a>
        </li>
        <li><hr class="light-grey-hr mb-10"/></li>

        <%}%>

        <!---------------------------------------------------------------------------------------------------------------------------------- -->

        <% if(cargo.equals("Instructor")) { %>  


        <li class="navigation-header">
            <span>Gestión Material</span> 
            <i class="zmdi zmdi-more"></i>
        </li>

        <li style="color:black;">
            <a style="color:black;" href="javascript:void(0);" data-toggle="collapse" data-target="#ui_dr"><div class="pull-left"><i class="zmdi zmdi-smartphone-setup mr-20"></i><span class="right-nav-text">Consultar</span></div><div class="pull-right"><i class="zmdi zmdi-caret-down"></i></div><div class="clearfix"></div></a>
            <ul id="ui_dr" class="collapse collapse-level-1 two-col-list">
                <li>
                    <a href="ControllerMateriales?action=admin"><div class="pull-left"><i class=" fa  fa-scissors mr-20"></i><span class="right-nav-text">Material </span></div><div class="clearfix"></div></a>
                </li>
                <li>
                    <a href="ControllerSalida?action=admin"><div class="pull-left"><i class=" fa  fa-upload mr-20"></i><span class="right-nav-text"> Salida </span></div><div class="clearfix"></div></a>
                </li>



            </ul>
        </li>

        <li><hr class="light-grey-hr mb-10"/></li>
        <li class="navigation-header">
            <span>Gestión Producto</span> 
            <i class="zmdi zmdi-more"></i>
        </li>
        <li>
            <a href="CTipoProducto?action=admin"><div class="pull-left"><i class=" fa fa-list-alt mr-20"></i><span class="right-nav-text">Administrar</span></div><div class="clearfix"></div></a>
        </li>


        <%}%>

        <!---------------------------------------------------------------------------------------------------------------------------------- -->
        <% if(cargo.equals("Administrador")) { %>  


        <li class="navigation-header">
            <span>Gestión Material</span> 
            <i class="zmdi zmdi-more"></i>
        </li>

        <li style="color:black;">
            <a style="color:black;" class="active" href="javascript:void(0);" data-toggle="collapse" data-target="#dashboard_dr"><div class="pull-left"><i class="fa fa-file-text  mr-20"></i><span class="right-nav-text" style="color:black;">Registrar</span></div><div class="pull-right"><i class="zmdi zmdi-caret-down"></i></div><div class="clearfix" style="color:black;"></div></a>
            <ul  id="dashboard_dr" class="collapse collapse-level-1">
                <li>
                    <a href="RegistrarMaterial.jsp"><div class="pull-left"><i class=" fa  fa-scissors mr-20"></i><span class="right-nav-text">Material </span></div><div class="clearfix"></div></a>
                </li>
                <li>
                    <a href="ControllerIngreso?action=select"><div class="pull-left"><i class=" fa  fa-download mr-20"></i><span class="right-nav-text">Ingreso </span></div><div class="clearfix"></div></a>

                </li>
                <li>
                    <a href="ControllerSalida?action=select"><div class="pull-left"><i class=" fa  fa-upload mr-20"></i><span class="right-nav-text"> Salida </span></div><div class="clearfix"></div></a>
                </li>

            </ul>
        </li>



        <li>
            <a href="javascript:void(0);" data-toggle="collapse" data-target="#ui_dr"><div class="pull-left"><i class="zmdi zmdi-smartphone-setup mr-20"></i><span class="right-nav-text">Consultar</span></div><div class="pull-right"><i class="zmdi zmdi-caret-down"></i></div><div class="clearfix"></div></a>
            <ul id="ui_dr" class="collapse collapse-level-1 two-col-list">
                <li>
                    <a href="ControllerMateriales?action=admin"><div class="pull-left"><i class=" fa  fa-scissors mr-20"></i><span class="right-nav-text">Material </span></div><div class="clearfix"></div></a>
                </li>


                <li>
                    <a href="ControllerSalida?action=admin"><div class="pull-left"><i class=" fa  fa-upload mr-20"></i><span class="right-nav-text">Control Salida </span></div><div class="clearfix"></div></a>
                </li>
                <li>
                    <a href="ControllerIngreso?action=admin"><div class="pull-left"><i class=" fa  fa-download mr-20"></i><span class="right-nav-text">Control Ingreso </span></div><div class="clearfix"></div></a>
                </li>

            </ul>
        </li>


        <li><hr class="light-grey-hr mb-10"/></li>
        <li class="navigation-header">
            <span>Gestión Producto</span> 
            <i class="zmdi zmdi-more"></i>
        </li>


        <li>
            <a href="_registrarproducto.jsp"><div class="pull-left"><i class=" fa fa-file-text mr-20"></i><span class="right-nav-text">Registrar</span></div><div class="clearfix"></div></a>
        </li>
        <li>
            <a href="CTipoProducto?action=admin"><div class="pull-left"><i class=" fa fa-list-alt mr-20"></i><span class="right-nav-text">Administrar</span></div><div class="clearfix"></div></a>
        </li>

        <li><hr class="light-grey-hr mb-10"/></li>

        <li class="navigation-header">
            <span>Gestión de Usuarios</span> 
            <i class="zmdi zmdi-more"></i>      
        </li>
        <li>
            <a href="RegistrarUsuarios.jsp"><div class="pull-left"><i class=" fa fa-file-text mr-20"></i><span class="right-nav-text">Registrar</span></div><div class="clearfix"></div></a>
        </li>
        <li>
            <a href="UsuarioController?action=admin"><div class="pull-left"><i class=" fa fa-list-alt mr-20"></i><span class="right-nav-text">Administrar </span></div><div class="clearfix"></div></a>
        </li>


    </ul>

    <%}%>
</div>



<!---------------------------------------------------------------------------------------------------------------------------------- -->


<!-- /Top Menu Items -->



<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>

