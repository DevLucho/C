<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="agregarEnte.aspx.cs" Inherits="Vista.agregarEnte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- select 2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <title>Agregar ente</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="NitId" runat="server" for="nit"></asp:Label>
    <asp:TextBox placeholder="Nit" type="number" runat="server" name="nit" ID="TextNit" required autocomplete="off"></asp:TextBox>
    <asp:Label ID="RazonSocialId" runat="server" for="razonSocial"></asp:Label>
    <asp:TextBox placeholder="Razon Social" name="paterno" runat="server" ID="TextRazonS" type="text" required autocomplete="off"></asp:TextBox>
    <asp:Label runat="server" for="representante"></asp:Label>
    <asp:TextBox runat="server" placeholder="Representante" name="representante" ID="TextRepresentante" type="text" required autocomplete="off"></asp:TextBox>
    <label for="correo"></label>
    <asp:TextBox placeholder="Correo" runat="server" name="correo" ID="TextCorreo" type="email" required autocomplete="off"></asp:TextBox>
    <label for="telefono"></label>
    <asp:TextBox placeholder="telefono" runat="server" name="telefono" ID="TextTelefono" type="number" required autocomplete="off"></asp:TextBox>
    <label for="sitioWeb"></label>
    <asp:TextBox placeholder="Sitio Web" runat="server" name="sitioWeb" ID="textSitioW" type="text" required autocomplete="off"></asp:TextBox>
    <label for="Ciudad"></label>
    <asp:DropDownList class="js-example-basic-single form-control" ID="DropDownList" runat="server">
    </asp:DropDownList>
    <label for="Capacidad"></label>
    <asp:TextBox placeholder="Capacidad" runat="server" name="capacidad" ID="TextCapacidad" type="number" required autocomplete="off"></asp:TextBox>
    <asp:Button runat="server" class="btn btn-success" name="registro" ID="btnRegistrarEnte" Text="Registrarme" OnClick="btnRegistrarEnte_Click" />
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
