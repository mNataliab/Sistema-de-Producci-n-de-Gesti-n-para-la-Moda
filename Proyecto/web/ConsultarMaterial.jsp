
<jsp:include page="Encabezado.jsp"/>

<%@page import="Modelos.Usuario" %>
<% if(session.getAttribute("idPerfil")==null){
     response.sendRedirect("loginprueba?action=error404");
    session.setAttribute("idPerfil", null);
    session.setAttribute("Usuario", null);
    session.invalidate();
}else if(session.getAttribute("idPerfil").toString().equals("Administrador")||session.getAttribute("idPerfil").toString().equals("Instructor")) {
Usuario us= (Usuario) session.getAttribute("Usuario"); 

%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
Usuario usu= (Usuario) session.getAttribute("Usuario");
String cargo=usu.getCargo();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Consultar Material</title>
    <meta name="description" content="Flintstone is a Dashboard & Admin Site Responsive Template by hencework." />
    <meta name="keywords" content="admin, admin dashboard, admin template, cms, crm, Flintstone Admin, Flintstoneadmin, premium admin templates, responsive admin, sass, panel, software, ui, visualization, web app, application" />
    <meta name="author" content="hencework"/>

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="vendors/bower_components/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
    <link href="dist/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>


    <jsp:include page="Encabezado.jsp"/>    
    <jsp:include page="Menu.jsp"/>
    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <!-- Basic Table -->
                <div class="col-sm-12">
                    <div class="panel panel-default card-view">
                        <div class="panel-heading">
                            <div class="pull-left">
                                <h6 class="panel-title txt-dark">Listar Material</h6>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="panel-wrapper collapse in">
                            <div class="panel-body">
                                <p class="text-muted">Administrar <code>Material</code> </p>
                                <div class="table-wrap mt-40">
                                    <div class="table-responsive">
                                        <table id="datatable-buttons" id="footable_3" class="table" data-filtering="true"  data-show-toggle="false">
                                            <thead>
                                                <tr>

                                                    <th>Nombre</th>
                                                    <th>Cantidad</th>
                                                    <th>Undidad Medida</th>
                                                        <%if(cargo.equals("Administrador")){%>
                                                    <th>Acción</th>
                                                        <%}%>
                                                </tr>
                                            </thead>
                                            <!-- este requestScope.ListaMaterial  array llega basio o no contiene ningun dato-->
                                            <c:forEach var="mate" items="${requestScope.ListaMaterial}">
                                                <tr>
                                                    <td><c:out value="${mate.nombre}"/></td>
                                                    <td><c:out value="${mate.cantidad}"/></td>
                                                    <td><c:out value="${mate.unidadMedida}"/></td>

                                                    <%if(cargo.equals("Administrador")){%>
                                                    <td>
                                                        <button class="btn btn-default btn-icon-anim btn-square" title="Editar" onclick="location.href = 'ControllerMateriales?action=actualizar&id=${mate.idMaterial}'"><i class="fa fa-pencil"></i></button>

                                                    </td>
                                                    <%}%>
                                                </tr>
                                            </c:forEach>

                                        </table>


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
if (request.getParameter("rta").equals("Yes")) {%>
    <script src="vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>

    <script src="dist/js/sweetalert-data.js"></script>
    <script type="text/javascript">





                                                            swal("Exito", "Registro Exitoso", "success");
                                                            ({
                                                                title: "Error",
                                                                text: "Registro exitoso ",
                                                                icon: "success"
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


    <!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:50 GMT -->
    <!-- jQuery -->
    <script src="vendors/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->


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

    <script src="assetss/js/bootstrap.min.js">
    </script> 
    <script src="assetss/js/modernizr.min.js">
    </script> 
    <script src="assetss/js/detect.js">
    </script> 
    <script src="assetss/js/fastclick.js">
    </script>
    <script src="assetss/js/jquery.slimscroll.js">
    </script>
    <script src="assetss/js/jquery.blockUI.js">
    </script> 
    <script src="assetss/js/waves.js">
    </script> 
    <script src="assetss/js/wow.min.js">
    </script> 
    <script src="assetss/js/jquery.nicescroll.js">
    </script>
    <script src="assetss/js/jquery.scrollTo.min.js">
    </script>
    <script src="assetss/plugins/datatables/jquery.dataTables.min.js">
    </script> 
    <script src="assetss/plugins/datatables/dataTables.bootstrap.js">
    </script>
    <script src="assetss/plugins/datatables/dataTables.buttons.min.js">
    </script> 
    <script src="assetss/plugins/datatables/buttons.bootstrap.min.js">
    </script> 
    <script src="assetss/plugins/datatables/jszip.min.js">
    </script> 
    <script src="assetss/plugins/datatables/pdfmake.min.js">
    </script> 
    <script src="assetss/plugins/datatables/vfs_fonts.js">
    </script> 
    <script src="assetss/plugins/datatables/buttons.html5.min.js">
    </script>
    <script src="assetss/plugins/datatables/buttons.print.min.js">
    </script>
    <script src="assetss/plugins/datatables/dataTables.fixedHeader.min.js">
    </script> 
    <script src="assetss/plugins/datatables/dataTables.keyTable.min.js">
    </script> 
    <script src="assetss/plugins/datatables/dataTables.responsive.min.js">
    </script>
    <script src="assetss/plugins/datatables/responsive.bootstrap.min.js">
    </script>
    <script src="assetss/plugins/datatables/dataTables.scroller.min.js">
    </script>
    <script src="assetss/pages/datatables.init.js">
    </script>



</body>


<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/basic-table.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:19:15 GMT -->
</html>
<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>

