<%@page import="Modelos.Usuario" %>
<% if(session.getAttribute("idPerfil")==null){
     response.sendRedirect("loginprueba?action=error404");
    session.setAttribute("idPerfil", null);
    session.setAttribute("Usuario", null);
    session.invalidate();
}else if(session.getAttribute("idPerfil").toString().equals("Administrador")||session.getAttribute("idPerfil").toString().equals("Instructor")) {
Usuario usu= (Usuario) session.getAttribute("Usuario"); 

%>

<jsp:include page="Encabezado.jsp"/>

<html lang="en">

    <!-- Mirrored from hencework.com/theme/flintstone/full-width-light/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:15:56 GMT -->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <title>Sistema de producción de gestión de la moda</title>
        <meta name="description" content="Flintstone is a Dashboard & Admin Site Responsive Template by hencework." />
        <meta name="keywords" content="admin, admin dashboard, admin template, cms, crm, Flintstone Admin, Flintstoneadmin, premium admin templates, responsive admin, sass, panel, software, ui, visualization, web app, application" />
        <meta name="author" content="hencework"/>

         <!--Favicon--> 
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
          <!--Librerias Tablas--> 
        <link href="assetss/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="assetss/splugins/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="assetss/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" /> 
	<link href="assetss/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="assetss/plugins/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="assetss/css/bootstrap.min.css" rel="stylesheet" type="text/css">
                  <!--librerias tablas--> 
	<link href="assetss/css/icons.css" rel="stylesheet" type="text/css">
         <!--Morris Charts CSS--> 
        <link href="vendors/bower_components/morris.js/morris.css" rel="stylesheet" type="text/css"/>

         <!--Data table CSS--> 
        <link href="vendors/bower_components/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>

        <link href="vendors/bower_components/jquery-toast-plugin/dist/jquery.toast.min.css" rel="stylesheet" type="text/css">

         <!--Custom CSS--> 
        <link href="dist/css/style.css" rel="stylesheet" type="text/css">
        
        <link rel="stylesheet" href="css/nivo-slider.css">
	<link rel="stylesheet" href="css/mi-slider.css">

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" type="text/javascript"></script>
	<script src="js/jquery.nivo.slider.js"></script>

	<script type="text/javascript"> 
		$(window).on('load', function() {
		    $('#slider').nivoSlider(); 
		}); 
	</script>
    </head>

    <body>

<jsp:include page="Encabezado.jsp"/>
<jsp:include page="Menu.jsp"/>
<div class="page-wrapper">
	  <div class="container-fluid">

              <img src="img/titulo.gif" alt=""  />  
    
	<div class="slider-wrapper theme-mi-slider">
		<div id="slider" class="nivoSlider">     
		    <img src="img/1.jpg" alt="" title="#htmlcaption1" />    
		    <img src="img/2.jpg" alt="" title="#htmlcaption2" />    
		    <img src="img/3.jpg" alt="" title="#htmlcaption1" /> 
		    <img src="img/4.jpg" alt="" title="#htmlcaption2" /> 
		    <img src="img/5.jpg" alt="" title="#htmlcaption1" /> 
		    <img src="img/6.jpg" alt="" title="#htmlcaption2" /> 
		    <img src="img/7.jpg" alt="" title="#htmlcaption1" />     
		    <img src="img/8.jpg" alt="" title="#htmlcaption2" /> 
		    <img src="img/9.jpg" alt="" title="#htmlcaption1" /> 
		    <img src="img/10.jpg" alt="" title="#htmlcaption2" /> 
		    <img src="img/11.jpg" alt="" title="#htmlcaption1" /> 

		</div> 
	    </div>
		
          </div></div>
     
		  <!--<script src="vendors/bower_components/jquery/dist/jquery.min.js"></script>-->
		
		 <!--Bootstrap Core JavaScript--> 
                <script src="vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
                <script src="vendors/bower_components/bootstrap-validator/dist/validator.min.js"></script>
		
		 <!--Slimscroll JavaScript--> 
                <script src="dist/js/jquery.slimscroll.js"></script>
	
		 <!--Fancy Dropdown JS--> 
                <script src="dist/js/dropdown-bootstrap-extended.js"></script>
		
		 <!--Owl JavaScript--> 
                <script src="vendors/bower_components/owl.carousel/dist/owl.carousel.min.js"></script>
	
		 <!--Switchery JavaScript--> 
                <script src="vendors/bower_components/switchery/dist/switchery.min.js"></script>
	
		 <!--Init JavaScript--> 
                <script src="dist/js/init.js"></script>
    </body></html>	

  <%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>
