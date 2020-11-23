<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="consultaEspecialidades.aspx.cs" Inherits="Vista.consultaEspecialidades" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/registro.css"/>
    <link rel="stylesheet" href="css/dashPersona.css"/>
    <link rel="stylesheet" href="css/conEsp.css"/>
        
    <div class="container-login" style="margin-top:120px">
      <div class="form">  
        <div class="tab-content">
          <div id="signup" class="YAS">        
               <div class="field-wrap">
                  <asp:TextBox ID="TextCiudad" required AutoComplete="off" name="ciudadna" class="ciudadad" placeholder="Ciudad" runat="server"></asp:TextBox>
              </div> 
              <div class="field-wrap">
                <asp:TextBox ID="TextEspecialidad" class="especialistaa" required autocomplete="off" name="especialidad" runat="server" placeholder="Especialista"></asp:TextBox><br />
              </div>
              <asp:Button ID="btnBuscar" runat="server" Text="Buscar" class="button button-block" OnClick="btnBuscar_Click" /> <br/>
              <asp:GridView ID="gdgGrid" runat="server"></asp:GridView>
          </div>
          <div id="login"></div>
        </div><!-- tab-content -->
      </div> <!-- /form --> 
    </div>
</asp:Content>