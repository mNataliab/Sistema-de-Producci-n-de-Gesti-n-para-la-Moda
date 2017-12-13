<!DOCTYPE html>
<html lang="en">
    <head>
    </head>
    <body>  
  
      
       <%  Modelos.Usuario usu = (Modelos.Usuario) session.getAttribute("Usuario"); %>
      
        <jsp:include page="Encabezado.jsp"/> 
        <jsp:include page="Menu.jsp"/>
        <div class="page-wrapper">
            <div class="container-fluid">
                <!-- Title -->
                <div class="row heading-bg">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h5 class="txt-dark">Datos Usuario</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default card-view">
                            <div class="panel-heading">
                                <div class="pull-left">
                                    <h6 class="panel-title txt-dark">Datos</h6>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-wrapper collapse in">
                                <div class="panel-body">
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-wrap">
                                                <form method="Post" action="ContraControllers?action=up" data-toggle="validator" >
                                                    <div class="form-group">
                                                        <label for="inputName" class="control-label mb-10">Nombre</label>
                                                        <input type="text" class="form-control" name="nombre" id="inputName" readonly="nombre" value="<%= usu.getNombre() %>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputName" class="control-label mb-10">Apellido</label>
                                                        <input type="text" class="form-control" name="apellido" id="inputApellido" readonly="apelllio" value="<%= usu.getApellido() %>" required>
                                                    </div>
                                                    <div class="form-group ">
                                                        <label for="inputTwitter" class="control-label mb-10">Documento</label>
                                                        <input type="number"  class="form-control" name="documento" id="inputDocumento" readonly="documento"  value="<%= usu.getDocumento() %>" required>

                                                    </div>

                                                    <div class="form-group ">
                                                        <label for="inputTwitter" class="control-label mb-10">Teléfono</label>
                                                        <input type="number"  class="form-control"  name="telefono" id="inputTelefono"  value="<%= usu.getTelefono() %>" required maxlength="11">

                                                    </div>

                                                    <div class="form-group">
                                                        <label for="inputEmail" class="control-label mb-10">Email</label>
                                                        <input type="email" class="form-control" name="email" id="inputEmail"  value="<%= usu.getCorreo() %>" required>
                                                        <div class="help-block with-errors"></div>
                                                    </div>


                                                    <div class="form-group">
                                                        <label for="inputEmail" class="control-label mb-10">Cargo</label>
                                                        <input type="email" class="form-control" name="email" id="inputEmail" readonly="cargo" value="<%= usu.getCargo() %>" required>
                                                        <div class="help-block with-errors"></div>
                                                    </div>



                                                    <div class="form-group">
                                                        <label for="inputEmail" class="control-label mb-10">Estado</label>
                                                        <input type="email" class="form-control" name="email" id="inputEmail" readonly="estado" value="<%= usu.getEstado() %>" required>
                                                        <div class="help-block with-errors"></div>
                                                    </div>



                                                    <div class="form-group">
                                                        <label for="inputEmail" class="control-label mb-10">Género</label>
                                                        <input type="email" class="form-control" name="email" id="inputEmail" readonly="genero" value="<%= usu.getGenero() %>" required>
                                                        <div class="help-block with-errors"></div>
                                                    </div>

                                                    <div class="form-group mb-0">
                                                        <button type="submit" class="btn btn-success btn-anim"><i class="icon-rocket"></i><span class="btn-text">Actulizar</span></button>
                                                    </div>
                                                </form>
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
                <!-- /Row -->
            </div>
            <footer class="footer container-fluid pl-30 pr-30">
                <div class="row">
                    <div class="col-sm-12">
                        <p>2017 &copy; Flintstone. Pampered by Hencework</p>
                    </div>
                </div>
            </footer>
        </div>


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

        <!-- Init JavaScript -->
        <script src="dist/js/init.js"></script>
    </body>

    <!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:59 GMT -->
</html>
