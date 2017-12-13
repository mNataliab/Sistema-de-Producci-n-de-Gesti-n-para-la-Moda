<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ConsultarProducto
    Created on : 21/11/2017, 10:12:54 PM
    Author     : Karen Baez

--%>
<%@page import="Modelos.Usuario" %>
<% if(session.getAttribute("idPerfil")==null){
   response.sendRedirect("loginprueba?action=error404");
  session.setAttribute("idPerfil", null);
  session.setAttribute("Usuario", null);
  session.invalidate();
}else if(session.getAttribute("idPerfil").toString().equals("Administrador")||session.getAttribute("idPerfil").toString().equals("Instructor")) {
Usuario usu= (Usuario) session.getAttribute("Usuario"); 

%>
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

</head>


<body>  
    <jsp:include page="Encabezado.jsp"/>    
    <jsp:include page="Menu.jsp"/>


    <div class="page-wrapper">
        <div class="container-fluid">



            <!-- Row -->
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default card-view">
                        <div class="panel-heading">
                            <div class="pull-left">
                                <h6 class="panel-title txt-dark">Registrar Productos del Pedido</h6>
                            </div>
                            <div class="clearfix"></div>
                        </div>


                        <div class="panel-wrapper collapse in">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="form-wrap">

                                            <form data-toggle="validator" role="form" action="Productos?action=create" method="post">
                                                <div class="form-group">
                                                    <label for="inputName" class="control-label mb-10">Cantidad:</label>
                                                    <input type="number" class="form-control" name="cantidad" id="cantidad" placeholder="Cantidad" required min="1">
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputName" class="control-label mb-10">Descripción:</label>
                                                    <input type="text" class="form-control" name="descripcion" id="decripcion" placeholder="Descripcion" required>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label mb-10">Tipo Producto</label>
                                                    <select class="form-control select2" name="idtproducto">
                                                        <option value="">Seleccione</option>
                                                        <c:forEach var="t" items="${requestScope.Arraytipoproducto}">
                                                            <option selected="selected" value="${t.idTipoProducto}">${t.nombre}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>	




                                                <div class="form-group mb-30">
                                                    <label class="control-label mb-10 text-left">¿El Cliente trajó material?</label>
                                                    <div class="radio radio-info">
                                                        <input type="radio" name="radio" id="radio1" checked="" value=true >
                                                        <label for="radio1" >
                                                            Sí
                                                        </label>
                                                    </div>
                                                    <div class="radio radio-info">
                                                        <input type="radio" name="radio" id="radio2" checked=""value=false >
                                                        <label for="radio2" >
                                                            No
                                                        </label>
                                                    </div>	
                                                </div>


                                                <div class="form-group mb-0">
                                                    <button type="submit" class="btn btn-success btn-anim"><i class="icon-rocket"></i><span class="btn-text">Guardar</span></button>
                                                    <button type="submit" class="btn btn-success btn-anim" onclick="javascript:history.go(-1)"><i class="icon-rocket"></i><span class="btn-text">Cancelar</span></button> 
                                                    <button type="submit" class="btn btn-success btn-anim" onclick="location.href = 'Productos?action=redireccionar&id=<%= Integer.parseInt(request.getParameter("id"))%>'" ><i class="icon-rocket"></i><span class="btn-text">Finalizar Pedido</span></button>
                                                </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default card-view">
                        <div class="panel-heading">
                            <div class="pull-left">
                                <h6 class="panel-title txt-dark">Listado de Productos del Pedido</h6>
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

                                                        <th>Cantidad</th
                                                        <th>Tipo Producto</th>
                                                        <th>Cliente Material</th>  
                                                        <th>Acción</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="productos" items="${requestScope.listaped}">
                                                        <tr> 
                                                            <c:set var = "salary" value = "${productos.clienteMaterial}"/>
                                                            <c:choose>
                                                                <c:when test="${salary == false}">
                                                                    <td><c:out value="${productos.cantidad}"/></td>
                                                                    <td><c:out value="${productos.tipoProducto.nombre}"/></td>

                                                                    <td>No</td>

                                                                    <td>
                                                                        <div class="form-group mb-0">
                                                                            <button class="btn btn-info btn-icon-anim btn-square" title="Eliminar" onclick="location.href = 'Productos?action=eliminar&id=${productos.idProducto}'"><i class="icon-trash"></i></button>
                                                                        </div>

                                                                    </td>

                                                                </c:when>


                                                                <c:otherwise>
                                                                    <td><c:out value="${productos.cantidad}"/></td>
                                                                    <td><c:out value="${productos.tipoProducto.nombre}"/></td>

                                                                    <td>Si</td>

                                                                    <td>
                                                                        <div class="form-group mb-0">
                                                                            <button class="btn btn-info btn-icon-anim btn-square" title="Eliminar" onclick="location.href = 'Productos?action=eliminar&id=${productos.idProducto}'"><i class="icon-trash"></i></button>
                                                                        </div>

                                                                    </td>
                                                                </c:otherwise>
                                                            </c:choose>
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

<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>

