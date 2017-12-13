<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>Informe Material</title>
    <meta name="description" content="Flintstone is a Dashboard & Admin Site Responsive Template by hencework." />
    <meta name="keywords" content="admin, admin dashboard, admin template, cms, crm, Flintstone Admin, Flintstoneadmin, premium admin templates, responsive admin, sass, panel, software, ui, visualization, web app, application" />
    <meta name="author" content="hencework"/>

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="icon" href="favicon.ico" type="image/x-icon">

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
                                <h6 class="panel-title txt-dark">Materiales Requeridos</h6>
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

                                                        <th>Material</th>
                                                        <th>Cantidad Total</th>
                                                        <th>Producto</th>
                                                        <th>Cliente Material</th>


                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:forEach var="productos" items="${requestScope.Arraytipoproducto}">


                                                        <c:forEach var="pmate" items="${productos.tipoProducto.tipoProductoYMaterials}">
                                                            <tr>
                                                                <c:set var = "salary" value = "${productos.clienteMaterial}"/>
                                                                <c:choose>
                                                                    <c:when test="${salary == false}">

                                                                        <td><c:out value="${pmate.material.nombre}"/></td>
                                                                        <td><c:out value="${pmate.cantidad*productos.cantidad}"/></td>
                                                                        <td><c:out value="${pmate.tipoProducto.nombre}"/></td>
                                                                        <td>No</td>
                                                                    </c:when>

                                                                    <c:otherwise>



                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </tr>
                                                        </c:forEach> 

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
                
                  <c:if   test="${salary == true}">
                <div class="col-md-6">
                    <div class="panel panel-default card-view">
                        <div class="panel-heading">
                            <div class="pull-left">
                                <h6 class="panel-title txt-dark">Materiales que deberá trer el usuario</h6>
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

                                                        <th>Material</th>
                                                        <th>Cantidad Total</th>
                                                        <th>Producto</th>
                                                        <th>Cliente Material</th>


                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:forEach var="productos" items="${requestScope.Arraytipoproducto}">


                                                        <c:forEach var="pmate" items="${productos.tipoProducto.tipoProductoYMaterials}">
                                                            <tr>
                                                                <c:set var = "salary" value = "${productos.clienteMaterial}"/>
                                                                <c:choose>
                                                                    <c:when test="${salary == true}">

                                                                         <td><c:out value="${pmate.material.nombre}"/></td>
                                                                        <td><c:out value="${pmate.cantidad*productos.cantidad}"/></td>
                                                                        <td><c:out value="${pmate.tipoProducto.nombre}"/></td>
                                                                        <td>Si</td>
                                                                    </c:when>

                                                                    <c:otherwise>




                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </tr>
                                                        </c:forEach> 

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
                
                </c:if>
                
                
                
                <div class="col-md-6">
                    <div class="panel panel-default card-view">
                        <div class="panel-heading">
                            <div class="pull-left">
                                <h6 class="panel-title txt-dark"> Productos Solicitados</h6>
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
                                                        <th>Tipo Producto</th>
                                                        <th>Cliente Material</th> 
                                                        <td></td>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="productos" items="${requestScope.Arraytipoproducto}">
                                                        <tr> 

                                                            <c:set var = "salary" value = "${productos.clienteMaterial}"/>
                                                            <c:choose>
                                                                <c:when test="${salary == false}">
                                                                    <td><c:out value="${productos.cantidad}"/></td>
                                                                    <td><c:out value="${productos.tipoProducto.nombre}"/></td>
                                                                    <td>No</td>
                                                                    <td> <button class="btn btn-info btn-icon-anim btn-square" title="Ver Detalles" onclick="location.href = 'Productos?action=ver&id=${productos.idProducto}'"><i class="fa - fa-eye"></i></button></td>



                                                                </c:when>


                                                                <c:otherwise>
                                                                    <td><c:out value="${productos.cantidad}"/></td>
                                                                    <td><c:out value="${productos.tipoProducto.nombre}"/></td>
                                                                    <td>Si</td>
                                                                        <td> <button class="btn btn-info btn-icon-anim btn-square" title="Ver Detalles" onclick="location.href = 'Productos?action=ver&id=${productos.idProducto}'"><i class="fa - fa-eye"></i></button></td>


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

        </div>
    </div>
</div>


<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:50 GMT -->
<!-- jQuery -->
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

</body>


<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/basic-table.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:19:15 GMT -->
</html>

<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>

