<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="agregarPersona.aspx.cs" Inherits="Vista.agregarPersona" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registro persona</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
</head>
<body>
    <img class="wave" src="img/wave.png" />
    <div class="container">
        <div class="img">
            <img src="img/undraw_in_sync_xwsa.svg" />
        </div>
        <div class="login-container">
            <form runat="server" method="post">
                <!--<img class="avatar" src="img/avatar_male.svg" />-->
                <h2>
                    <a href="login.aspx">
                        <i class="far fa-arrow-alt-circle-left"></i>
                    </a>
                    Registro persona
                </h2>

                <div class="input-div one">
                    <div class="i">
                    </div>
                    <div>
                        <h5>Nombre</h5>
                        <asp:TextBox runat="server" class="input" ID="TextNombre" name="nombre" type="text" required="true" autofocus=""></asp:TextBox>
                    </div>
                </div>

                <div class="input-div one">
                    <div class="i">
                    </div>
                    <div>
                        <h5>Apellido</h5>
                        <asp:TextBox runat="server" class="input" ID="TextApellido" name="paterno" type="text" required="true" autofocus=""></asp:TextBox>
                    </div>
                </div>

                <div class="input-div two">
                    <div class="i">
                    </div>
                    <div>
                        <h5>Celular</h5>
                        <asp:TextBox runat="server" class="input" name="edad" ID="TextCelular" type="number" required="true" autofocus=""></asp:TextBox>
                    </div>
                </div>

                <div class="input-div two">
                    <div class="i">
                    </div>
                    <div>
                        <h5>Correo</h5>
                        <asp:TextBox runat="server" class="input" name="correo" ID="TextCorreo" type="email" required="true" autofocus=""></asp:TextBox>
                    </div>
                </div>
                <div class="input-div two">
                    <div class="i">
                    </div>
                    <div>
                        <h5>Cedula</h5>
                        <asp:TextBox runat="server" class="input" name="user" ID="TextCedula" type="number" required="true" autofocus=""></asp:TextBox>
                    </div>
                </div>
                <div class="input-div two">
                    <div class="i">
                    </div>
                    <div>
                        <h5>Contraseña</h5>
                        <asp:TextBox runat="server" class="input" name="pass" ID="textPassword" type="password" required="true" autofocus="" OnTextChanged="textPassword_TextChanged"></asp:TextBox>
                    </div>
                </div>
                <asp:Button runat="server" class="btn" name="registro" ID="btnRegistra" Text="Registrarme" OnClick="btnRegistra_Click" />
            </form>
        </div>
    </div>
    <script type="text/javascript" src="js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script type="text/javascript">
        function alertSuccess() {
            Swal.fire({
                icon: 'success',
                title: 'Your work has been saved',
                showConfirmButton: false,
                timer: 1500
            })
        }
    </script>

</body>
</html>
