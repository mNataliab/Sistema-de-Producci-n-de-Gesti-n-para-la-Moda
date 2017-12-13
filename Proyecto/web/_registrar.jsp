<%@page import="Modelos.Usuario" %>
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
                <h5 class="txt-dark">Registrar pedido</h5>
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
                                <div class="col-sm-4" >
                                    <div class="form-wrap">
                                        <form data-toggle="validator" role="form" action="Cpedido?action=create" method="post">
                                            <div class="form-group">
                                                <label for="inputName" class="control-label mb-10">Cliente:</label>
                                                <input type="text" class="form-control" name="cliente" id="cliente" placeholder="Nombre" required>
                                            </div>

                                            <div class="form-group mb-0">
                                                <button type="submit" class="btn btn-success btn-anim"><i class="icon-rocket"></i><span class="btn-text">Guardar</span></button>
                                                  <button style="left:200px; bottom: 20px;" type="submit" class="btn btn-success btn-anim" onclick="javascript:history.go(-1)"><i class="icon-rocket"></i><span class="btn-text">Cancelar</span></button>
                                               
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



