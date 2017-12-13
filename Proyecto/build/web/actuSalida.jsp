<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Modelos.Material"%>
<%@page import="Modelos.Salida"%>
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
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <!-- Bootstrap Colorpicker CSS -->
        <link href="vendors/bower_components/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet" type="text/css"/>

        <!-- select2 CSS -->
        <link href="vendors/bower_components/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css"/>

        <!-- switchery CSS -->
        <link href="vendors/bower_components/switchery/dist/switchery.min.css" rel="stylesheet" type="text/css"/>

        <!-- bootstrap-select CSS -->
        <link href="vendors/bower_components/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>

        <!-- bootstrap-tagsinput CSS -->
        <link href="vendors/bower_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.css" rel="stylesheet" type="text/css"/>

        <!-- bootstrap-touchspin CSS -->
        <link href="vendors/bower_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" rel="stylesheet" type="text/css"/>

        <!-- multi-select CSS -->
        <link href="vendors/bower_components/multiselect/css/multi-select.css" rel="stylesheet" type="text/css"/>

        <!-- Bootstrap Switches CSS -->
        <link href="vendors/bower_components/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>

        <!-- Bootstrap Datetimepicker CSS -->
        <link href="vendors/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>



        <!-- Custom CSS -->
        <link href="dist/css/style.css" rel="stylesheet" type="text/css">

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
                            <h5 class="txt-dark">Editar Salida</h5>
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
                                                    <% Salida sActualizar =(Salida) request.getAttribute("salida"); %>
                                                    <h2> Actualizar Salida  </h2>            				
                                                    <form method="post" action="ControllerSalida?action=actualizar&id=<%=sActualizar.getIdSalida()%>">



                                                        <div class="form-group">
                                                            <label class="control-label mb-10" for="exampleInputuname_1">Cantidad</label>
                                                            <div class="input-group">
                                                                <div class="input-group-addon"><i class="icon-user"></i></div>
                                                                <input type="text" class="form-control"  name="Cantidad" id="Cantidad" value="<%=sActualizar.getCantidad()%>" min="1">
                                                            </div>
                                                        </div>    



                                                        <div class="form-group">
                                                            <label class="control-label mb-10" for="exampleInputuname_1">Material</label>
                                                            <select class="form-control select2" name="idtMaterial">
                                                                <option value="">Seleccione</option>
                                                                <c:forEach var="t" items="${requestScope.ArrayMaterials}">
                                                                    <option selected="selected" value="${t.idMaterial}">${t.nombre}</option>
                                                                </c:forEach>


                                                            </select>
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

                    <div style="right:100px;">
                        <button class="btn btn-default" >  <a href="javascript:history.back()"> Volver Atrás</a></button> 


                    </div>   


                </div>

                <jsp:include page="PiePagina.jsp"/>

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
        <script src="vendors/bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Piety JavaScript -->
        <script src="vendors/bower_components/peity/jquery.peity.min.js"></script>
        <script src="dist/js/peity-data.js"></script>

        <!-- Slimscroll JavaScript -->
        <script src="dist/js/jquery.slimscroll.js"></script>

        <!-- Owl JavaScript -->
        <script src="vendors/bower_components/owl.carousel/dist/owl.carousel.min.js"></script>

        <!-- Switchery JavaScript -->
        <script src="vendors/bower_components/switchery/dist/switchery.min.js"></script>

        <!-- Fancy Dropdown JS -->
        <script src="dist/js/dropdown-bootstrap-extended.js"></script>

        <!-- Init JavaScript -->
        <script src="dist/js/init.js"></script>
        <!-- jQuery -->
        <script src="vendors/bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Moment JavaScript -->
        <script type="text/javascript" src="vendors/bower_components/moment/min/moment-with-locales.min.js"></script>

        <!-- Bootstrap Colorpicker JavaScript -->
        <script src="vendors/bower_components/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>

        <!-- Switchery JavaScript -->
        <script src="vendors/bower_components/switchery/dist/switchery.min.js"></script>

        <!-- Select2 JavaScript -->
        <script src="vendors/bower_components/select2/dist/js/select2.full.min.js"></script>

        <!-- Bootstrap Select JavaScript -->
        <script src="vendors/bower_components/bootstrap-select/dist/js/bootstrap-select.min.js"></script>

        <!-- Bootstrap Tagsinput JavaScript -->
        <script src="vendors/bower_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>

        <!-- Bootstrap Touchspin JavaScript -->
        <script src="vendors/bower_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>

        <!-- Multiselect JavaScript -->
        <script src="vendors/bower_components/multiselect/js/jquery.multi-select.js"></script>


        <!-- Bootstrap Switch JavaScript -->
        <script src="vendors/bower_components/bootstrap-switch/dist/js/bootstrap-switch.min.js"></script>

        <!-- Bootstrap Datetimepicker JavaScript -->
        <script type="text/javascript" src="vendors/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>

        <!-- Form Advance Init JavaScript -->
        <script src="dist/js/form-advance-data.js"></script>

        <!-- Slimscroll JavaScript -->
        <script src="dist/js/jquery.slimscroll.js"></script>

        <!-- Fancy Dropdown JS -->
        <script src="dist/js/dropdown-bootstrap-extended.js"></script>

        <!-- Owl JavaScript -->
        <script src="vendors/bower_components/owl.carousel/dist/owl.carousel.min.js"></script>

        <!-- Init JavaScript -->
        <script src="dist/js/init.js"></script>

        <!-- Init JavaScript -->
        <script src="dist/js/init.js"></script>
    </body>

    <!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:50 GMT -->
</html>
<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>

