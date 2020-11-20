<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vista.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/login.css"/>

</head>
<body>
   
        <div>
             <div class="container-login">
        <div class="wrap-login">
            <form role="form" class="login-form validate-form" method="post" runat="server">
            <span class="login-form-title">LOGIN</span>
                
                            <fieldset>
                                <div  class="wrap-input100" data-validate = "Cedula incorrecta">
                                    <asp:TextBox runat="server" class="input100" ID="TextCedula" placeholder="Cedula" name="user" type="number" autofocus=""></asp:TextBox>
                                      <span class="focus-efecto"></span>
                                </div>

                                <div class="wrap-input100" data-validate="Password incorrecto">
                                    <asp:TextBox runat="server" ID="TextPassword" class="input100" placeholder="Contraseña" name="pass" type="password"></asp:TextBox>
                                      <span class="focus-efecto"></span>
                                </div>
                                <div  class="container-login-form-btn">
                                  <div class="wrap-login-form-btn">
                                    <div class="login-form-bgbtn"></div>
                                      <asp:Button ID="btnLogin" class="login-form-btn" type="submit" CommandName="entrar" runat="server" Text="Ingresar" OnClick="btnLogin_Click" />
                                  </div>
                                  <a style="margin-top: 20px; margin-bottom:-20px; text-decoration:none;  color: inherit;" href="agregarPersona.aspx">¿Deseas Registrate?</a>
                                </div>
                            </fieldset>
                        </form>
        </div>
    </div>     
        
        
     <script src="js/jquery.js"></script>     
     <script src="js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="codigo.js"></script>


        </div>
</body>
</html>
