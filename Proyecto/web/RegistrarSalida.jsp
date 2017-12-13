<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Modelos.Usuario" %>
<% if(session.getAttribute("idPerfil")==null){
     response.sendRedirect("loginprueba?action=error404");
    session.setAttribute("idPerfil", null);
    session.setAttribute("Usuario", null);
    session.invalidate();
}else if(session.getAttribute("idPerfil").toString().equals("Administrador")||session.getAttribute("idPerfil").toString().equals("Instructor") ) {
Usuario usu= (Usuario) session.getAttribute("Usuario"); 

%>
<jsp:include page="Encabezado.jsp"/> 
<jsp:include page="Menu.jsp"/>
<link href="vendors/bower_components/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css"/>
<!-- Select2 JavaScript -->
 <link href="vendors/bower_components/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css">
<script src="vendors/bower_components/select2/dist/js/select2.full.min.js"></script>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="row heading-bg">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h5 class="txt-dark">Registrar Salida</h5>
            </div>
        </div>



        <div class="panel panel-default card-view">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-wrap">
                        <form data-toggle="validator" role="form" action="ControllerSalida?action=create" method="post">

                            <div class="form-group" style="width:200px; ">
                                <label for="inputCantidad" class="control-label mb-10">Material</label>

                                <select class="form-control select2"  name="idMaterial" requiered>
                                    <option value="">Seleccione</option>
                                    <c:forEach  var="clien" items="${requestScope.arrayMaterial}">
                                        <option value="${clien.idMaterial}"><c:out value="${clien.nombre}"/></option>
                                    </c:forEach>
                                </select>

                            </div>
                            <div class="form-group" style="width: 120px">
                                <label for="inputCantidad" class="control-label mb-10">Cantidad</label>
                                <input type="number" name="cantidad" class="form-control" id="inputCantidad" placeholder="Cantidad" required min="1">
                            </div>


                            <div class="form-group mb-0">
                                <button type="submit" class="btn btn-success btn-anim"><i class="icon-rocket"></i><span class="btn-text">Registrar</span></button>
                            </div>
                        </form>
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





        swal("Error", "No se encuentra la cantidad suficiente del Material", "error");
        ({
            title: "Error",
            text: "No se encuentra la cantidad suficiente del Material",
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

</body>
</html> 


<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>

