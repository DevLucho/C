<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Vista.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="img/hospital.png" />
    <title>Inicio de sesión</title>
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
            <form role="form" method="post" runat="server">
                <!--<img class="avatar" src="img/avatar_male.svg" />-->
                <h2>Iniciar sesión</h2>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-user"></i>
                    </div>
                    <div>
                        <h5>Cedula</h5>
                        <asp:TextBox runat="server" class="input" ID="TextCedula" name="user" type="number" required="true" autofocus=""></asp:TextBox>
                    </div>
                </div>

                <div class="input-div two">
                    <div class="i">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div>
                        <h5>Contraseña</h5>
                        <asp:TextBox runat="server" ID="TextPassword" class="input" name="pass" required="true" type="password"></asp:TextBox>
                    </div>
                </div>
                <asp:Button ID="btnLogin" class="btn" type="submit" CommandName="entrar" runat="server" Text="Ingresar" OnClick="btnLogin_Click" />
                <asp:Button ID="Button2" class="btn" runat="server" Text="Registrarme" CausesValidation="False" OnClick="Button2_Click" />
            </form>
        </div>
    </div>
    <script type="text/javascript" src="js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</body>
</html>
