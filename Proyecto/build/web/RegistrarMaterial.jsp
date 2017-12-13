<%@page import="Modelos.Usuario" %>
<% if(session.getAttribute("idPerfil")==null){
     response.sendRedirect("loginprueba?action=error404");
    session.setAttribute("idPerfil", null);
    session.setAttribute("Usuario", null);
    session.invalidate();
}else if(session.getAttribute("idPerfil").toString().equals("Administrador")) {
Usuario usu= (Usuario) session.getAttribute("Usuario"); 

%>

 <link href="vendors/bower_components/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css">
  <link href="vendors/bower_components/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css">

<jsp:include page="Encabezado.jsp"/> 
<jsp:include page="Menu.jsp"/>

<div class="page-wrapper">
    <div class="row heading-bg">
        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
            <h5 class="txt-dark">Registrar Material</h5>
        </div>
    </div>
    <div class="col-md-12">
        <div class="panel panel-default card-view">

            <div class="panel-wrapper collapse in">
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-wrap">
                                <form data-toggle="validator" role="form" action="ControllerMateriales?action=create" method="post">
                                    <div class="form-group" style="width: 420px">
                                        <label for="inputName" class="control-label mb-10">Nombre</label>
                                        <input type="text" class="form-control"name="Nombre" id="inputName" placeholder="nombre" required>
                                    </div>
                                    <div class="form-group" style="width: 120px">
                                        <label for="inputName" class="control-label mb-10">Cantidad</label>
                                        <input type="number" class="form-control"name="Cantidad" id="inputCantidad" placeholder="Cantidad" required min="1">
                                    </div>
                                    <div class="form-group ">
                                        <label for="inputTwitter" class="control-label mb-10">Unidad de Medida</label>
                                        <select name="Unidad"> 
                                            <option value="Metros">Metros</option>
                                        </select>
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
<footer class="footer container-fluid pl-30 pr-30">
    <div class="row">
        <div class="col-sm-12">
            <p>2017 Proyecto</p>
        </div>
    </div>
</footer>

  <%
try {
 if(request.getParameter("rta").equals("mal")){%>
    <script src="vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>

    <script src="dist/js/sweetalert-data.js"></script>
    <script type="text/javascript">





                                                            swal("Error", "El material ya existe", "error");
                                                            ({
                                                                title: "Error",
                                                                text: "El material ya existe",
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


<script src="vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script src="vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="vendors/bower_components/bootstrap-validator/dist/validator.min.js"></script>
<script src="dist/js/jquery.slimscroll.js"></script>
<script src="dist/js/dropdown-bootstrap-extended.js"></script>
<script src="vendors/bower_components/owl.carousel/dist/owl.carousel.min.js"></script>
<script src="vendors/bower_components/switchery/dist/switchery.min.js"></script>
<script src="dist/js/init.js"></script>
</body>
</html>
<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>























