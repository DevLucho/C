<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="agregarEspecialista.aspx.cs" Inherits="Vista.agregarEspecialista1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- select 2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <title>Agregar especialista</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="NombreID" runat="server" for="nombre"></asp:Label>
    <asp:TextBox placeholder="Nombre" type="text" runat="server" name="nombre" ID="TextNombre" required autocomplete="off"></asp:TextBox>
    <asp:Label ID="CorreoID" runat="server" for="correo"></asp:Label>
    <asp:TextBox placeholder="Correo" name="correo" runat="server" ID="TextCorreo" type="email" required autocomplete="off"></asp:TextBox>
    <asp:Label runat="server" for="celular"></asp:Label>
    <asp:TextBox runat="server" placeholder="Celular" name="celular" ID="TextCelular" type="number" required autocomplete="off"></asp:TextBox>
    <label for="numLicencia"></label>
    <asp:TextBox placeholder="Num.Licencia" runat="server" name="licencia" ID="TextNumLicencia" type="number" required autocomplete="off"></asp:TextBox>
    <label for="Ciudad"></label>
    <asp:DropDownList class="js-example-basic-single form-control" ID="drpCiudad" runat="server"></asp:DropDownList>
    <label for="Especialidad"></label>
    <asp:DropDownList class="js-example-basic-single form-control" ID="drpEspecialidad" runat="server"></asp:DropDownList>
    <label for="FechaE"></label>
    <asp:TextBox placeholder="Fecha" runat="server" name="fechaE" ID="TextFechaE" type="date" required autocomplete="off"></asp:TextBox>
    <asp:Button runat="server" class="button button-block" name="registro" ID="btnRegistarEspecialista" Text="Registrar" OnClick="btnRegistarEspecialista_Click" /><br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <!-- select2 js -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.js-example-basic-single').select2({
                placeholder: "Filtra",
                language: "es"
            });
        });
    </script>
</asp:Content>

