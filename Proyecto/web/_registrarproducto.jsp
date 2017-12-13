<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Modelos.Usuario" %>
<% if(session.getAttribute("idPerfil")==null){
     response.sendRedirect("loginprueba?action=error404");
    session.setAttribute("idPerfil", null);
    session.setAttribute("Usuario", null);
    session.invalidate();
}else if(session.getAttribute("idPerfil").toString().equals("Administrador")) {
Usuario usu= (Usuario) session.getAttribute("Usuario"); 

%>
<jsp:include page="Encabezado.jsp"/>    
<jsp:include page="Menu.jsp"/>
<link href="vendors/bower_components/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css">


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelos.TipoProducto" %>
<head>
 
</head>
<body>
    <jsp:include page="Encabezado.jsp"/>
    <jsp:include page="Menu.jsp"/>

    <div class="page-wrapper">
        <div class="container-fluid">
            <!-- Title -->
            <div class="row heading-bg">
                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <h5 class="txt-dark">Registrar Tipo De Producto</h5>
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
                                            <form data-toggle="validator" role="form" action="CTipoProducto?action=create" method="post">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <label for="inputName" class="control-label mb-10">Nombre:</label>
                                                    <input type="text" class="form-control" name="nombre" id="nombre" required>
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
      <%
try {
 if(request.getParameter("rta").equals("mal")){%>
    <script src="vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>

    <script src="dist/js/sweetalert-data.js"></script>
    <script type="text/javascript">





                                                            swal("Error", "El Tipo de Producto ya existe", "error");
                                                            ({
                                                                title: "Error",
                                                                text: "El Tipo de Producto ya existe",
                                                                icon: "error"
                                                            })
                                                                    .then((willDelete) => {
                                                                        if (willDelete) {
                                                                            swal("Poof! Your imaginary file has been deleted!", {
                                                                                icon: "success",
                                                                            });
                                                                        } else {
                                                                            swal("Your imaginary file is safe!");
                                                                        }
                                                                    });

    </script>
    <!-- Slimscroll JavaScript -->
    <script src="dist/js/jquery.slimscroll.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="dist/js/dropdown-bootstrap-extended.js"></script>

    <!-- Init JavaScript -->
    <script src="dist/js/init.js"></script>
    <% }

      } catch (Exception e) { }
    %>


 
    
    


<!-- ChartJS JavaScript -->

<!-- Morris Charts JavaScript -->

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


<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:59 GMT -->
</html>
<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>



