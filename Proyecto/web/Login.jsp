<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Proyecto</title>

        <script type="text/javascript">
            function nobackbutton() {
                window.location.hash = "no-back-button";
                window.location.hash = "Again-No-back-button" //chrome	
                window.onhashchange = function () {
                    window.location.hash = "no-back-button";
                }

            }
        </script>
        <link rel="stylesheet" href="assets/css/styles.css" />
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

        <link href="vendors/bower_components/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css">


        <style>
            body{
                background: #242427;

            }
            #particles-js{
                width: 200%;
                height: 600px;
            }
        </style>


    </head>

    <!--<body onload="nobackbutton();" >-->
    <body onload="nobackbutton();">

        <div id="particles-js"></div>
        <div id="formContainer">

            <form id="login" method="post" action="loginprueba?action=inicio">
                <a href="#" id="flipToRecover" class="flipLink">Olvidaste la Contraseña?</a>

                <input type="text" name="loginEmail" id="loginEmail" placeholder="Email"  requiered="requiered" onkeyup="es_vacio();" />
                <input type="password" name="loginPass" id="loginPass" placeholder="Contraseña"  requiered="required"/>
                <br><br><br>
                <div class="checkbox" style="position: relative;
                     top: 80px; left: 26px;" >
                    <p >
                        <input type="radio" name="cargo" required="required" value="Administrador" > Administrador <input required="required" type="radio" name="cargo" value="Instructor"> Instructor
                    </p>

                </div>


                <input type="submit" id="boton" onclick="cris();" value="Ingresar" />
                <script>
                    var botonEnviar = document.getElementById("cargo");



                    function cris() {

                        var lol = document.getElementById('login').submit();


                    }
                </script>

            </form>


            <form id="recover" method="post" action="loginprueba?action=update" name="recover">
                <a href="#" id="flipToLogin" class="flipLink">Olvidaste la Contraseña?</a>

                <input type="number" name="loginNumero" id="loginNum" placeholder="Número Documento" style="position: relative;top: 210px; left: 26px;" />              
                <input type="text" name="loginEmail" id="loginEmail"  placeholder="Email" style="position: relative;top: 215px; left: 26px;" />
                <input type="password" name="loginPass1" id="loginPass" placeholder="Contraseña Nueva" style="position: relative;top: 222px; left: 26px;" />

                <br>


                <input type="submit" onclick="enviar_formulario();" value="Enviar" style="position: relative;top: 250px; left: 26px;" />
            </form>

            <script>
                function enviar_formulario() {
                    var lo = document.getElementById('recover').submit();
                }
            </script>
        </div>



        <!-- JavaScript includes -->
        <script src="assets/js/jquery-1.7.1.min.js"></script>
        <script src="assets/js/script.js"></script>

        <div class="count-particles">
            <span class="js-count-particles">--</span> 


        </div>







        <%
 try {
   if (request.getParameter("action").equals("No")) {%>
        <script src="vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>

        <script src="dist/js/sweetalert-data.js"></script>
        <script type="text/javascript">





                swal("Error", "Por favor ingrese los datos correctamente o puede que su usuario no existe", "error");
                ({
                    title: "Error",
                    text: "Por favor ingrese los datos correctamente o puede que su usuario no existe",
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
        <% } if(request.getParameter("action").equals("correcto")){%>

           <script src="vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>

        <script src="dist/js/sweetalert-data.js"></script>
        <script type="text/javascript">





                swal("Correcto", "Contraseña actualizada correctamente","success");
                ({
                    title: "Correcto",
                    text: "Contraseña actualizada correctamente",
                    icon: "succes"
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
     

<%}

                 } catch (Exception e) { }
        %>
        <script src="particles.js"></script>
        <script src="particulas.js"></script>


    </body>
</html>

