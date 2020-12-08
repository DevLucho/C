<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="consultarCitas.aspx.cs" Inherits="Vista.WebForm1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="css/registro.css"/>
     <link rel="stylesheet" href="css/dashPersona.css"/>

     <asp:Panel ID="PanelForm" runat="server">
     <div class="container-login" style="margin-top:129px">
        <div class="form">
            <h1 style="margin:10px 15px 0px 0px">Crear Especialista</h1>
            <div class="tab-content" style="margin-top:100px;">
                <div id="signup">
<asp:Label runat="server" ID="lblBienvenido"></asp:Label>
                    
                    <div class="field-wrap">
                        <asp:Label ID="IDcita" runat="server" for="idcita"></asp:Label>
                        <asp:TextBox placeholder="Cita" type="number" readOnly="true" runat="server" name="cita" ID="TextIDcita" required autocomplete="off"></asp:TextBox> 
                    </div>

                    <div class="field-wrap">
                        <asp:Label ID="fecha" runat="server" for="fecha"></asp:Label>
                        <asp:TextBox placeholder="fecha" type="text" runat="server" name="fecha" ID="TextFecha" readOnly="true" required autocomplete="off"></asp:TextBox> 
                    </div>

                    <div class="field-wrap">
                        <asp:Label ID="hora" runat="server" for="hora"></asp:Label>
                        <asp:TextBox placeholder="hora" type="text" runat="server" name="hora" ID="TextHora" readOnly="true" required autocomplete="off"></asp:TextBox> 
                    </div>

                    <div class="field-wrap">
                        <asp:Label ID="calificarID" runat="server" for="Calificacion"></asp:Label>
                        <asp:TextBox placeholder="Calificacion" type="number" runat="server" name="calificacion" ID="TextCalificacion" required autocomplete="off"></asp:TextBox> 
                    </div>
                    
                    <asp:Button runat="server" class="button button-block" name="calificar" ID="btnCalificar" text="Clificar" OnClick="btnCalificar_Click"/><br/>
                </div>
                <div id="login"></div>
            </div><!-- tab-content -->
        </div> <!-- /form --> 
    </div>
    </asp:Panel>


    <asp:Panel ID="PanelGrid" runat="server" style="margin-top:200px">
        <asp:GridView ID="gdgGrid" runat="server" AutoGenerateColumns="False" OnRowCommand="gdgGrid_RowCommand">
                  <Columns>
                      <asp:BoundField DataField="id_cita" HeaderText="Cita" />
                      <asp:BoundField DataField="fecha_cita" HeaderText="Fecha" />
                      <asp:BoundField DataField="id_hora" HeaderText="Hora" />
                      <asp:BoundField DataField="estado" HeaderText="Estado" />
                      <asp:TemplateField HeaderText="Calificar"><ItemTemplate><asp:ImageButton ID="imgSelec" CommandName="Calificar" ImageUrl="~/img/seleccionar.png" Height="22px" Width="22px" runat="server"/></ItemTemplate></asp:TemplateField>
                      
                  </Columns>
               </asp:GridView>

    </asp:Panel>
</asp:Content>
