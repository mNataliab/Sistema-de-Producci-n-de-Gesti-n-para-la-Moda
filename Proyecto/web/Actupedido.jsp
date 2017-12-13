<%@page import="Modelos.Pedido" %>
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



<!--Preloader-->
<div class="preloader-it">
    <div class="la-anim-1"></div>
</div>
<!--/Preloader-->

<div class="wrapper theme-1-active pimary-color-green">
    <!-- Main Content -->
    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="row heading-bg">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h5 class="txt-dark">Editar Pedidos</h5>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default card-view">
                        <div class="panel-wrapper collapse in">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="form-wrap">
                                            <% Pedido sActualizar =(Pedido) request.getAttribute("pedido"); %>
                                            <h2> Actualizar Pedido - <%= sActualizar.getClientes()%></h2>   

                                            <form method="post" action="Cpedido?action=actualizar&id=<%=sActualizar.getIdPedido()%>">

                                                <div class="form-group">
                                                    <label class="control-label mb-10" for="exampleInputuname_1">Fecha</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="icon-user"></i></div>
                                                        <input type="text" id="fecha" name="fecha" class="form-control" value="<%=sActualizar.getFecha()%>">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label mb-10" for="exampleInputuname_1">Cliente</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="icon-user"></i></div>
                                                        <input type="text" class="form-control"  name="clientes" id="clientes" value="<%=sActualizar.getClientes()%>">
                                                    </div>
                                                </div>
                                        <div class="form-group ">
                                          <label for="estado" class="control-label col-lg-2">Estado</label>
                                             <div class="col-lg-4">
                                          <select class="form-control m-bot15" id="estado"  name="estado">
                                         <option value="<%=sActualizar.getEstado()%>"></option>
                                            <option value="Edicion">Edición</option>
                                            <option value="Finalizado">Finalizado</option>
                                            <option value="Cancelar">Cancelar</option>
                                          </select>
                                          </div>
                                        </div>
                                            </br><br>



                                                <div class="form-actions mt-10">
                                                    <button class="btn btn-default btn-icon-anim btn-square" title="Guardar"><i class="icon-check"></i></button>
                                                    <button class="btn btn-info btn-icon-anim btn-square" title="Cancelar" onclick="javascript:history.go(-1)"><i class="fa fa-close text-danger"></i></button>


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

        <jsp:include page="PiePagina.jsp"/>

    </div>
</div>
<!-- /#wrapper -->

<!-- JavaScript -->

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

<!-- Mirrored from hencework.com/theme/flintstone/full-width-light/form-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 02 Nov 2017 05:18:50 GMT -->
</html>
<%}else{
response.sendRedirect("loginprueba?action=error404");
session.invalidate();
}%>

