<!DOCTYPE html>

<html lang="en">
    <head>
    </head>
    <body>  
        <jsp:include page="Encabezado.jsp"/> 
        <jsp:include page="Menu.jsp"/>
        <div class="page-wrapper">
            <div class="container-fluid">
                <!-- Title -->
                <div class="row heading-bg">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h5 class="txt-dark">Contraseña Usuario</h5>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default card-view">
                            <div class="panel-heading">
                                <div class="pull-left">
                                    <h6 class="panel-title txt-dark">Registro de contraseña</h6>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-wrapper collapse in">
                                <div class="panel-body">

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-wrap">
                                                <form method="Post" action="ContraControllers?action=update" data-toggle="validator" >


                                                    <div class="form-group">
                                                        <label for="inputPassword" class="control-label mb-10">Contraseña Nueva</label>
                                                        <div class="row">
                                                            <div class="form-group col-sm-12">
                                                                <input type="password" data-minlength="6" class="form-control" id="inputPassword" name="documento" placeholder="Password" required>
                                                                <div class="help-block">Minimo de 6 carácteres/div>
                                                            </div>
                                                            <div class="form-group col-sm-12">
                                                                <input type="password" class="form-control" id="inputPasswordConfirm" data-match="#inputPassword" data-match-error="No coincide la contraseña ingresada" placeholder="Confirm" required>
                                                                <div class="help-block with-errors"></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group mb-0">
                                                        <button type="submit" class="btn btn-success btn-anim"><i class="icon-rocket"></i><span class="btn-text">Actulizar</span></button>
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
        <jsp:include page="PiePagina.jsp"/>


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

