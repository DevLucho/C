<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="agregarPersona.aspx.cs" Inherits="Vista.agregarPersona" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro Persona</title>
    <link rel="stylesheet" href="css/registro.css"/>
</head>
<body>
    <div class="container-login">

  <div class="form">
  
    <ul class="tab-group">
      <li class="tab active"><a href="#">Unete</a></li>
    </ul>
  
    <div class="tab-content">
      <div id="signup">
        <h1>Crear Usuario</h1>
        
        <form runat="server" method="post">
            <div class="field-wrap">
              <asp:Label ID="Nombre" runat="server" for="nombre"></asp:Label>
              <asp:TextBox placeholder="Nombres" type="text" runat="server" name="nombre" ID="TextNombre" required autocomplete="off"></asp:TextBox> 
            </div>
            <!--<asp:Label runat="server" ID="lblBienvenido"></asp:Label>-->
           
              <div class="field-wrap">
              <asp:label ID="Apellido" runat="server" for="apellido"></asp:label>
              <asp:TextBox placeholder="Apellido" name="paterno" runat="server" ID="TextApellido" type="text" required autocomplete="off"></asp:TextBox>
            
          </div> 

           <div class="field-wrap">
            <asp:label runat="server" for="celular"></asp:label>
            <asp:TextBox runat="server" placeholder="celular" name="edad" ID="TextCelular" type="number" required autocomplete="off"></asp:TextBox>
          </div>

          <div class="field-wrap">
            <label for="correo"></label>
            <asp:TextBox placeholder="Correo" runat="server" name="correo" id="TextCorreo" type="email" required autocomplete="off"></asp:TextBox>
          </div>

  
           <div class="top-row">
              <div class="field-wrap">
              <label for="user"></label>
              <asp:TextBox placeholder="Cedula" runat="server" name="user" id="TextCedula" type="number" required autocomplete="off"></asp:TextBox>
            </div> 

            <div class="field-wrap">
              <label for="pass"></label>
              <asp:TextBox placeholder="Password" runat="server" name="pass" id="textPassword" type="password" required autocomplete="off" ></asp:TextBox>
            </div> 
          </div>
           <asp:Button runat="server" class="button button-block" name="registro" ID="btnRegistra" text="Registrarme" OnClick="btnRegistra_Click"/> 
        </form>
        <br/>
        <a class="pepe" href="login.aspx">Volver</a>
  
      </div>

      <div id="login">
  
        
  
      </div>
  
    </div><!-- tab-content -->
  
  </div> <!-- /form --> 
</div>  
</body>
</html>
