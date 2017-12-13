<%-- 
    Document   : Actutproducto
    Created on : 28/11/2017, 07:25:44 PM
    Author     : Natalia
--%>

<jsp:include page="Encabezado.jsp"/>    
<jsp:include page="Menu.jsp"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelos.TipoProducto" %>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Editar Tipo Producto</title>
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

    <div class="page-wrapper">
        <div class="container-fluid">
            <!-- Title -->
            <div class="row heading-bg">
                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <h5 class="txt-dark">Actualizar Tipo Producto</h5>
                </div>

            </div>
            <!-- /Title -->

            <!-- Row -->

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default card-view">
                        <div class="panel-wrapper collapse in">
                            <div class="panel-body" style="padding-left:400px">
                                <div class="row">
                                    <div class="col-Sm-4" >
                                        <div class="form-wrap">
                                            <% TipoProducto sActualizar =(TipoProducto) request.getAttribute("Tipoproducto"); %>
                                            <h2> Actualizar Tipo Producto - <%= sActualizar.getIdTipoProducto()%></h2>  
                                            <form data-toggle="validator" role="form" action="CTipoProducto?action=actualizar&id=<%=sActualizar.getIdTipoProducto()%>" method="post">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <label for="inputName" class="control-label mb-10" >Nombre:</label>
                                                    <input type="text" class="form-control" name="nombre" id="nombre"  value="<%=sActualizar.getNombre()%>"required>
                                                </div>
                                                </br>

                                                <div class="form-group mb-0">

                                                    <button  class="btn btn-default btn-icon-anim btn-square" title="Guardar"><i class="icon-share-alt"></i></button>
                                                    <button  class="btn btn-default btn-icon-anim btn-square" title="Cancelar" onclick="javascript:history.go(-1)"><i class="icon-close"></i></button>
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


    </div>
    <!-- /Main Content -->


    <!-- /#wrapper -->

    <!-- JavaScript -->

    <!-- jQuery -->
    <script src="vendors/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="vendors/bower_components/bootstrap-validator/dist/validator.min.js"></script>

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

<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:59 GMT -->
</html>
