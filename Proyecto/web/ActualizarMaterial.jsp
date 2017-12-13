<%@page import="Modelos.Material"%>
<%@page import="Modelos.Usuario" %>

<% if(session.getAttribute("idPerfil")==null){
     response.sendRedirect("loginprueba?action=error404");
    session.setAttribute("idPerfil", null);
    session.setAttribute("Usuario", null);
    session.invalidate();
}else if(session.getAttribute("idPerfil").toString().equals("Administrador")) {
Usuario usu= (Usuario) session.getAttribute("Usuario"); 

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:50 GMT -->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <title>Sistema de producción de gestión de la moda</title>
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
        <jsp:include page="Encabezado.jsp"/>
        <jsp:include page="Menu.jsp"/>

        <!--Preloader-->
        <div class="preloader-it">
            <div class="la-anim-1"></div>
        </div>
        <!--/Preloader-->

        <div class="wrapper theme-1-active pimary-color-green">
            <!-- Main Content -->
            <div class="page-wrapper"style="padding-left: 300px">
                <div class="container-fluid">
                    <div class="row heading-bg">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h5 class="txt-dark">Editar Materiales</h5>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="panel panel-default card-view">
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="form-wrap">
                                                    <% Material sActualizar =(Material) request.getAttribute("material"); %>
                                                    <h2> Actualizar Material  </h2>            				
                                                    <form method="post" action="ControllerMateriales?action=actualizar&id=<%=sActualizar.getIdMaterial()%>">


                                                        <div class="form-group">
                                                            <label class="control-label mb-10" for="exampleInputuname_1">Nombre</label>
                                                            <div class="input-group">
                                                                <div class="input-group-addon"><i class="icon-user"></i></div>
                                                                <input type="text" class="form-control"  name="Nombre" id="Nombre" value="<%=sActualizar.getNombre()%>">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="control-label mb-10" for="exampleInputuname_1">Cantidad</label>
                                                            <div class="input-group">
                                                                <div class="input-group-addon"><i class="icon-user"></i></div>
                                                                <input type="text" class="form-control"  name="Cantidad" id="Cantidad" min ="1" value="<%=sActualizar.getCantidad()%>">
                                                            </div>
                                                        </div>    

                                                        <div class="form-group">
                                                            <label class="control-label mb-10" for="exampleInputuname_1">Unidad de Medida</label>
                                                            <div class="input-group">
                                                                <div class="input-group-addon"><i class="icon-user"></i></div>
                                                                <input type="text" class="form-control"  name="Unidad" id="Unidad" value="<%=sActualizar.getUnidadMedida()%>">
                                                            </div>
                                                        </div>        


                                                        <div class="form-actions mt-10">
                                                            <button class="btn btn-default btn-icon-anim btn-square" title="Guardar"><i class="icon-check"></i></button>
                                                            <button class="btn btn-info btn-icon-anim btn-square" title="Cancelar" onclick="javascript:history.go(-1)"><i class="fa fa-close text-danger"></i></button>


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


                </div>

                <jsp:include page="PiePagina.jsp"/>

            </div>
            <div style="right:100px;">
                <button class="btn btn-default" >  <a href="javascript:history.back()"> Volver Atrás</a></button> 


            </div>
        </div>
        <!-- /#wrapper -->

        <!-- JavaScript -->

        <!-- jQuery -->
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
