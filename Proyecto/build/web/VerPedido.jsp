<%-- 
    Document   : VerPedido
    Created on : 21/11/2017, 09:26:26 AM
    Author     : Karen Baez
--%>
<!DOCTYPE html>

<%@page import="Modelos.Usuario" %>
<% if(session.getAttribute("idPerfil")==null){
     response.sendRedirect("loginprueba?action=error404");
    session.setAttribute("idPerfil", null);
    session.setAttribute("Usuario", null);
    session.invalidate();
}else if(session.getAttribute("idPerfil").toString().equals("Administrador")||session.getAttribute("idPerfil").toString().equals("Instructor")) {
Usuario usu= (Usuario) session.getAttribute("Usuario"); 

%>
<html lang="en">
	
<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:50 GMT -->
<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<title>ver Pedido</title>
		<meta name="description" content="Flintstone is a Dashboard & Admin Site Responsive Template by hencework." />
		<meta name="keywords" content="admin, admin dashboard, admin template, cms, crm, Flintstone Admin, Flintstoneadmin, premium admin templates, responsive admin, sass, panel, software, ui, visualization, web app, application" />
		<meta name="author" content="hencework"/>
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		
		<!-- vector map CSS -->
		<link href="vendors/bower_components/jasny-bootstrap/dist/css/jasny-bootstrap.min.css" rel="stylesheet" type="text/css"/>
		
		<!-- Custom CSS -->
		<link href="dist/css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>

 <div class="row">
    <div class="col-md-12">
	 <div class="panel panel-default card-view">
	    <div class="panel-heading">
		 <div class="pull-left">
		    <h6 class="panel-title txt-dark">Ver Pedido</h6>
		 </div>
		<div class="clearfix"></div>
	    </div>
         <div class="panel-wrapper collapse in">
	     <div class="panel-body">
		<div class="row">
	            <div class="col-md-12">
		        <div class="form-wrap">
                <% Pedido sActualizar =(Pedido ) request.getAttribute("pedido"); %>
		<form class="form-horizontal" role="form"  method="post" action="Cpedido?action=ver&id=<%=sActualizar.getIdPedido()%>">
		  <div class="form-body">
		     <h6 class="txt-dark capitalize-font"><i class="zmdi zmdi-account mr-10"></i>Información Pedido</h6>
			<hr class="light-grey-hr"/>
			    <div class="row">
			<div class="col-md-6">
			     <div class="form-group">
				<label class="control-label col-md-3">Usuario:</label>
				<div class="col-md-9">
				   <select class="form-control" name="idusuario">
                                    <c:forEach var="usuario" items="${requestScope.Arrayusuario}">
                                     <option value="${usuario.idUsuario}"><c:out value="${usuario.nombre}"/></option> 
                                    </c:forEach>
			           </select>
				</div>
			     </div>
			</div>
																<!--/span-->
			<div class="form-group required">
					<label for="firstName" class="col-sm-3 control-label">Estado</label>
					<div class="col-sm-9">
				            <select class="form-control m-bot15">
                                            <option value="<%=sActualizar.getEstado()%>"><%=sActualizar.getEstado()%></option>
                                            <option value="Edicion">Edición</option>
                                            <option value="Finalizada">Finalizada</option>
                                           
                                          </select>
					</div>
					</div>
			</div>
	    <div class="row">
                        <div class="col-md-6">
			     <div class="form-group">
				<label class="control-label col-md-3">Clientes</label>
				<div class="col-md-9">
				  <input type="text" class="form-control-static" id="lastName" name="clientes" placeholder="Last Name" required value="<%=sActualizar.getClientes()%>">
				</div>
			    </div>
			</div>
                <!--/span-->
			<div class="col-md-6">
			     <div class="form-group">
				<label class="control-label col-md-3">Fecha:</label>
				<div class="col-md-9">
				     <input class=" form-control-static" id="fecha" name="fecha" type="text" value="<%=sActualizar.getFecha()%>" />
				</div>
			     </div>
			</div>
	    </div>
                        
	    
															
		</div>
		    <div class="form-actions mt-10">
			<div class="row">
			    <div class="col-md-6">
				<div class="row">
				    <button type="submit" class="btn btn-info btn-icon left-icon  mr-10"> <i class="zmdi zmdi-edit"></i> <span>Edit</span></button>
				    <button type="button" class="btn btn-default">Cancel</button>
				</div>
			    </div>
			</div>
		    <div class="col-md-6"> </div>
															</div>
		</form>								
		    </div>
		</div>
	     </div>
	 </div>
	</div>
    </div>
</div>
 </div>     

     
                <script src="vendors/bower_components/jquery/dist/jquery.min.js"></script>
		
		<!-- Bootstrap Core JavaScript -->
		<script src="vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="vendors/bower_components/jasny-bootstrap/dist/js/jasny-bootstrap.min.js"></script>
		
		<!-- Slimscroll JavaScript -->
		<script src="dist/js/jquery.slimscroll.js"></script>
	
		<!-- Fancy Dropdown JS -->
		<script src="dist/js/dropdown-bootstrap-extended.js"></script>
		
		<!-- Owl JavaScript -->
		<script src="vendors/bower_components/owl.carousel/dist/owl.carousel.min.js"></script>
	
		<!-- Switchery JavaScript -->
		<script src="vendors/bower_components/switchery/dist/switchery.min.js"></script>
	
		<!-- Init JavaScript -->
		<script src="dist/js/init.js"></script>
 </body>

<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:50 GMT -->
</html>
<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>



