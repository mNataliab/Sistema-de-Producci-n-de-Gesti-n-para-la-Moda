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
<link href="vendors/bower_components/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css"/>
 <link href="vendors/bower_components/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css">
<div class="page-wrapper">
    <div class="container-fluid">
        <!-- Title -->
        <div class="row heading-bg">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h5 class="txt-dark">Registrar Usuario</h5>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default card-view">
                    <div class="panel-heading">
                        <div class="pull-left">
                            <h6 class="panel-title txt-dark">Registro</h6>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-wrapper collapse in">
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-wrap">
                                        <form method="Post" action="UsuarioController?action=create" data-toggle="validator" >
                                            <div class="form-group">
                                                <label for="inputName" class="control-label mb-10">Nombre</label>
                                                <input type="text" class="form-control" name="nombre" id="inputName" placeholder="nombre" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputName" class="control-label mb-10">Apellido</label>
                                                <input type="text" class="form-control" name="apellido" id="inputApellido" placeholder="apelllio" required>
                                            </div>
                                            <div class="form-group ">
                                                <label for="inputTwitter" class="control-label mb-10">Documento</label>
                                                <input type="number"  class="form-control" name="documento" id="inputDocumento" placeholder="documento" required  >

                                            </div>

                                            <div class="form-group ">
                                                <label for="inputTwitter" class="control-label mb-10">Teléfono</label>
                                                <input type="number"  class="form-control"  name="telefono" id="inputTelefono" onchange="validarSitelefono(this.value);" placeholder="telefono" required  >

                                            </div>

                                            <div class="form-group">
                                                <label for="inputEmail" class="control-label mb-10">Email</label>
                                                <input type="email" class="form-control" name="email" id="inputEmail" placeholder="email" data-error="Por favor, ingrese un correo @misena.edu.co" required>
                                                <div class="help-block with-errors"></div>
                                            </div>
                                            <div class="form-group" hidden="">
                                                <label for="inputPassword" name="contrasena"class="control-label mb-10">Contraseña</label>
                                                <div class="row">
                                                    <div class="form-group col-sm-12">
                                                        <input type="password" data-minlength="6" class="form-control" name="contrasena" id="inputContrasena" placeholder="Contrasena">
                                                        <div class="help-block">Minimo 6 caracteres</div>
                                                    </div>
                                                </div>

                                            </div>
                                            <h7 class="mt-30 mb-15">Cargo</h7>
                                            <div class="form-group">
                                                <div class="radio">
                                                    <input type="radio" value="Administrador" name="underwear" id="box" required>
                                                    <label for="box"> Administrador</label>
                                                </div>
                                                <div class="radio">
                                                    <input type="radio" value="Instructor" name="underwear" id="bri" required>
                                                    <label for="bri"> Instructor </label>
                                                </div>
                                            </div>

                                            <h8 class="mt-30 mb-15">Estado</h8>

                                            <div class="form-group">
                                                <div class="radio">
                                                    <input type="radio" value="Activo" name="derwear" id="box" required>
                                                    <label for="box"> Activo</label>

                                                </div>
                                                <div class="radio">
                                                    <input type="radio" value="Inactivo" name="derwear" id="bri" required>
                                                    <label for="bri"> Inactivo </label>
                                                </div>
                                            </div>


                                            <h9 class="mt-30 mb-15">Genero</h9>


                                            <div class="form-group">
                                                <div class="radio">
                                                    <input type="radio" value="Femenino" name="nderwear" id="box" required>
                                                    <label for="box"> Femenino</label>
                                                </div>
                                                <div class="radio">
                                                    <input type="radio" value="Masculino" name="nderwear" id="bri" required>
                                                    <label for="bri"> Masculino </label>
                                                </div>
                                            </div>

                                            <div class="form-group mb-0">
                                                <button type="submit" class="btn btn-success btn-anim"><i class="icon-rocket"></i><span class="btn-text">Registrase</span></button>
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
                </div>
            </div>
        </div>
        <!-- /Row -->
    </div>
    
    
     <script>
        function validarSitelefono (telefon){
            if(! /^([0-9]) *$/).test(telefon)
            alert("El telefono" + telefon + "que quieres ingresar no existe");
            location.reload(true);
        }
    </script>

    <%
try {
if(request.getParameter("rta").equals("mal")){%>
    <script src="vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>

    <script src="dist/js/sweetalert-data.js"></script>
    <script type="text/javascript">





        swal("Error", "El número de documento ya existe", "error");
        ({
            title: "Error",
            text: "El correo ya existe",
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
    <% }else if(request.getParameter("rta").equals("malr")){%>


    <script src="vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>

    <script src="dist/js/sweetalert-data.js"></script>
    <script type="text/javascript">





        swal("Error", "El correo ya existe", "error");
        ({
            title: "Error",
            text: "El correo ya existe",
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
    <%}} catch (Exception e) { }
    %>

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

</div>

</body>





<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:59 GMT -->
</html>
<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>

