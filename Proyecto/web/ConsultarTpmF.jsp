<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ConsultarTpm
    Created on : 28/11/2017, 04:35:48 PM
    Author     : Natalia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>


    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Consultar Producto</title>
    <meta name="description" content="Flintstone is a Dashboard & Admin Site Responsive Template by hencework." />
    <meta name="keywords" content="admin, admin dashboard, admin template, cms, crm, Flintstone Admin, Flintstoneadmin, premium admin templates, responsive admin, sass, panel, software, ui, visualization, web app, application" />
    <meta name="author" content="hencework"/>
    <!-- select2 CSS -->
    <link href="vendors/bower_components/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css"/>
    <!-- Select2 JavaScript -->
    <script src="vendors/bower_components/select2/dist/js/select2.full.min.js"></script>

    <!-- Favicon -->
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

    <style>
        .Boton-BoxShadow1{
            color: #FFF;
            background: #96BDA1;
            padding: 20px;
            margin: 25px auto;
            font-family: 'OpenSansBold', sans-serif;
            font-size: 14px;
            font-weight: bold;
            letter-spacing: 1px;
            text-transform: uppercase;
            display: block;
            text-align: center;
            cursor: pointer;
            width: 300px;
            box-shadow: inset 0 0 0 0 #0BF;
            -webkit-transition: all ease 0.8s;
            -moz-transition: all ease 0.8s;
            transition: all ease 0.8s;
            box-shadow: inset 0 0 10px 2px #9A9390;
        }


    </style>  
    <%@page import="Modelos.Usuario"%>
    <% 
Usuario usu= (Usuario) session.getAttribute("Usuario");
String cargo=usu.getCargo();
    %> 


</head>


<body>  
    <jsp:include page="Encabezado.jsp"/>    
    <jsp:include page="Menu.jsp"/>


    <div class="page-wrapper">
        <div class="container-fluid">



                <div class="col-md-6">
                    <div class="panel panel-default card-view">
                        <div class="panel-heading">
                            <div class="pull-left">
                                <h6 class="panel-title txt-dark">Administar Tipos Y Material</h6>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="panel-wrapper collapse in">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="form-wrap">

                                            <table class="table mb-0">
                                                <thead>
                                                    <tr>

                                                        <th>Cantidad</th>
                                                        <th>Material</th> 
                                                        <th>Tipo Producto</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="productos" items="${requestScope.listatproducto}">
                                                        <tr> 

                                                            <td><c:out value="${productos.cantidad}"/></td>
                                                            <td><c:out value="${productos.material.nombre}"/></td>
                                                            <td><c:out value="${productos.tipoProducto.nombre}"/></td>
                                                            
                                                        </tr>
                                                    </c:forEach>
                                                <tbody>
                                            </table>
                                        </div>
                                    </div>	
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Row -->	

            <div style="right:100px;">
                <button class="btn btn-default" >  <a href="javascript:history.back()"> Volver Atrás</a></button> 
             </div>   

        </div>
    </div>
</div>


<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:50 GMT -->
<!-- jQuery -->


<!-- Piety JavaScript -->


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


</body>


<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/basic-table.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:19:15 GMT -->
</html>

