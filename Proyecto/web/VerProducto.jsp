<%@page import="Modelos.Usuario" %>
<%@page import="Modelos.Producto" %>


<% if(session.getAttribute("idPerfil")==null){
     response.sendRedirect("loginprueba?action=error404");
    session.setAttribute("idPerfil", null);
    session.setAttribute("Usuario", null);
    session.invalidate();
}else if(session.getAttribute("idPerfil").toString().equals("Administrador")||session.getAttribute("idPerfil").toString().equals("Instructor")) {
Usuario usu= (Usuario) session.getAttribute("Usuario"); 

%>

<jsp:include page="Encabezado.jsp"/>
<jsp:include page="Menu.jsp"/>





<div class="page-wrapper">
    <div class="container-fluid">
        <!-- Title -->
        <div class="row heading-bg">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h5 class="txt-dark">Detalles del Producto</h5>
            </div>

        </div>
        <!-- /Title -->

        <!-- Row -->
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-default card-view">
                    <div class="panel-wrapper collapse in">
                        <div class="panel-body" style="padding-left:200px">
                            <div class="row">
                                <% Producto ver = (Producto)request.getAttribute("producto");%>
                                <div class="col-sm-4" >
                                    <div class="form-wrap">
                                        <form data-toggle="validator" role="form" action="" method="post">

                                            <div class="form-group">

                                                <label for="inputName" class="control-label mb-10">Cantidad:</label>
                                                <input type="text" class="form-control" name="cantidad" id="cantidad" readonly="readonly" value="<%=ver.getCantidad()%>">
                                            </div>

                                            <div class="form-group">
                                                <label for="inputName" class="control-label mb-10">Descripción:</label>
                                                <input type="text" class="form-control" name="descripcion" id="decripcion" readonly="readonly" value="<%=ver.getDescripcion()%>">
                                            </div>

                                            <div class="form-group">

                                                <label for="inputName" class="control-label mb-10">Tipo Producto:</label>
                                                <input type="text" class="form-control" name="cantidad" id="cantidad" readonly="readonly" value="<%=ver.getTipoProducto().getNombre()%>">
                                            </div>
                                            
                                            <div class="form-group">

                                                <label for="inputName" class="control-label mb-10">Cliente:</label>
                                                <input type="text" class="form-control" name="cantidad" id="cantidad" readonly="readonly" value="<%=ver.getPedido().getClientes()%>">
                                            </div>



                                            
                                        </form>
                                        <br>


                                    </div>
                                </div>
                            </div>
                        </div>

                        <div style="right:100px;">
                            <button class="btn btn-default" >  <a href="javascript:history.back()"> Volver Atrás</a></button> 


                        </div>
                    </div>
                </div>
            </div>
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
<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>



