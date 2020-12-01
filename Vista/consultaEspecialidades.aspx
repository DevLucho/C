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
              <asp:GridView ID="gdgGrid" runat="server" AutoGenerateColumns="False" OnRowCommand="gdgGrid_RowCommand">
                  <Columns>
                      <asp:BoundField DataField="id_especialista" HeaderText="Especialista" />
                      <asp:BoundField DataField="nombre" HeaderText="nombre" />
                      <asp:BoundField DataField="correo" HeaderText="correo" />
                      <asp:BoundField DataField="celular" HeaderText="celular" />
                      <asp:BoundField DataField="num_licencia" HeaderText="num.Licencia" />
                      <asp:BoundField DataField="razon_social" HeaderText="Razon Social" />
                      <asp:TemplateField HeaderText="Seleccionar"><ItemTemplate><asp:ImageButton ID="imgSelec" CommandName="Seleccionar" ImageUrl="~/img/seleccionar.png" Width="22.5px" runat="server"/></ItemTemplate></asp:TemplateField>
                      
                  </Columns>
               </asp:GridView>
          </div>
          <div id="login"></div>
        </div><!-- tab-content -->
      </div> <!-- /form --> 
    </div>
</asp:Content>