
<%@page import="Modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    try{
    
    Usuario usua = (Usuario) session.getAttribute("sesion");
    
    
    if (usua.getCargo().equals("Administrador") ) {%>

    <!-- Left Sidebar Menu -->
     <!------------------------menu administrador---------------------------->
		<div class="fixed-sidebar-left">
			<ul class="nav navbar-nav side-nav nicescroll-bar">
				<li class="navigation-header">
					<span>Gestionar Pedidos</span> 
					<i class="zmdi zmdi-more"></i>
				</li>
                                
                                <li>
					<a href="session?action=perfil"><div class="pull-left"><i class="fa fa-th mr-20"></i><span class="right-nav-text">Inicio</span></div><div class="clearfix"></div></a>
				</li>
				
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa fa-file-text mr-20"></i><span class="right-nav-text">Registrar</span></div><div class="clearfix"></div></a>
				</li>
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa fa-list-alt mr-20"></i><span class="right-nav-text">Administrar</span></div><div class="clearfix"></div></a>
				</li>
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa fa-barcode mr-20"></i><span class="right-nav-text">Agregar Materiales</span></div><div class="clearfix"></div></a>
				</li>
				<li><hr class="light-grey-hr mb-10"/></li>
				<li class="navigation-header">
					<span>Gestión Materia Prima</span> 
					<i class="zmdi zmdi-more"></i>
				</li>
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa fa-file-text mr-20"></i><span class="right-nav-text">Ingresar </span></div><div class="clearfix"></div></a>
				</li>
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa fa-list-alt mr-20"></i><span class="right-nav-text">Administrar </span></div><div class="clearfix"></div></a>
				</li>
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa  fa-upload mr-20"></i><span class="right-nav-text">Consultar Salida </span></div><div class="clearfix"></div></a>
				</li>
                               
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa  fa-download mr-20"></i><span class="right-nav-text">Consultar Ingreso </span></div><div class="clearfix"></div></a>
				</li>
                               
				<li><hr class="light-grey-hr mb-10"/></li>
				<li class="navigation-header">
					<span>Gestión de Usuarios</span> 
					<i class="zmdi zmdi-more"></i>      
				</li>
					<li>
					<a href="Usuario?action=rbgzonoKcfI="><div class="pull-left"><i class=" fa fa-file-text mr-20"></i><span class="right-nav-text">Ingresar </span></div><div class="clearfix"></div></a>
				</li>
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa fa-list-alt mr-20"></i><span class="right-nav-text">Administrar </span></div><div class="clearfix"></div></a>
				</li>
		
				
			</ul>
		</div>

<!-- /Top Menu Items -->

<%}else if(usua.getCargo().equals("Instructor")){
%>


 

<!-- Left Sidebar Menu -->
 <!------------------------menu instructor---------------------------->
		<div class="fixed-sidebar-left">
			<ul class="nav navbar-nav side-nav nicescroll-bar">
				<li class="navigation-header">
					<span>Gestionar Pedidos</span> 
					<i class="zmdi zmdi-more"></i>
				</li>
                                
                                <li>
					<a href="session?action=perfil"><div class="pull-left"><i class="fa fa-th mr-20"></i><span class="right-nav-text">Inicio</span></div><div class="clearfix"></div></a>
				</li>
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa fa-file-text mr-20"></i><span class="right-nav-text">Registrar</span></div><div class="clearfix"></div></a>
				</li>
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa fa-list-alt mr-20"></i><span class="right-nav-text">Administrar</span></div><div class="clearfix"></div></a>
				</li>
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa fa-barcode mr-20"></i><span class="right-nav-text">Agregar Materiales</span></div><div class="clearfix"></div></a>
				</li>
				
				
                               
				<li><hr class="light-grey-hr mb-10"/></li>
				<li class="navigation-header">
					<span>Gestión de Usuario</span> 
					<i class="zmdi zmdi-more"></i>      
				</li>
					<li>
					<a href=""><div class="pull-left"><i class=" fa fa-file-text mr-20"></i><span class="right-nav-text">Ingresar </span></div><div class="clearfix"></div></a>
				</li>
				<li>
					<a href="widgets.html"><div class="pull-left"><i class=" fa fa-list-alt mr-20"></i><span class="right-nav-text">Administrar </span></div><div class="clearfix"></div></a>
				</li>
		
				
			</ul>
		</div>
<%
        }
    %>
<!-- /Top Menu Items -->
  <%
        }catch (Exception e) {
       response.sendRedirect("Login.jsp");
    }
    %>


       
    



