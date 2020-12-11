<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="agregarEspecialista.aspx.cs" Inherits="Vista.agregarEspecialista1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <!-- select 2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <title>Agregar especialista</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 style="margin: 10px 15px 0px 0px"><i class="fas fa-user-plus mr-2"></i>Agregar especialista</h4>
    <hr>
    <%
        if (int.Parse(Session["idRol"].ToString()) == 1)
        {%>
    <p class="text-center"><b>Nota:</b> El especialista a crear no estara asociado con un ente de salud. Este ofrecera un servicio en particular.</p>
    <%} %>
    <div class="row justify-content-center">
        <div class="col-6 mb-3">
            <label>Nombre:</label>
            <asp:TextBox CssClass="form-control" placeholder="Nombre" type="text" runat="server" name="nombre" ID="TextNombre" required autocomplete="off"></asp:TextBox>
        </div>
        <div class="col-6 mb-3">
            <label>Correo</label>
            <asp:TextBox CssClass="form-control" placeholder="Correo" name="correo" runat="server" ID="TextCorreo" type="email" required autocomplete="off"></asp:TextBox>
        </div>
        <div class="col-6 mb-3">
            <label>Celular</label>
            <asp:TextBox CssClass="form-control" runat="server" placeholder="Celular" name="celular" ID="TextCelular" type="number" required autocomplete="off"></asp:TextBox>
        </div>
        <div class="col-6 mb-3">
            <label for="Ciudad">Ciudad o municipio:</label>
            <asp:DropDownList class="js-example-basic-single form-control" ID="drpCiudad" runat="server"></asp:DropDownList>
        </div>
        <div class="col-6 mb-3">
            <label>Número de licencia:</label>
            <asp:TextBox CssClass="form-control" placeholder="Num.Licencia" runat="server" name="licencia" ID="TextNumLicencia" type="number" required autocomplete="off"></asp:TextBox>
        </div>
        <div class="col-6 mb-3">
            <label>Fecha de expedición</label>
            <asp:TextBox CssClass="form-control" placeholder="Fecha" runat="server" name="fechaE" ID="TextFechaE" type="date" required autocomplete="off"></asp:TextBox>
        </div>
        <div class="col-6 mb-3">
            <label for="Especialidad">Especialidad:</label>
            <asp:DropDownList class="js-example-basic-single form-control" ID="drpEspecialidad" runat="server"></asp:DropDownList>
        </div>
        <%
            if (int.Parse(Session["idRol"].ToString()) == 2)
            {%>
        <div class="col-6 mb-3">
            <label for="Especialidad">Ente de salud:</label>
            <asp:DropDownList class="js-example-basic-single form-control" ID="ddlEnte" runat="server"></asp:DropDownList>
        </div>
        <%} %>
        <div class="col-12 mt-4 justify-content-center">
            <center>
                <asp:Button runat="server" class="btn btn-success" name="registro" ID="btnRegistarEspecialista" Text="Registrar" OnClick="btnRegistarEspecialista_Click" /><br />
            </center>
        </div>
    </div>
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

