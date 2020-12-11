<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="enciclopedia.aspx.cs" Inherits="Vista.enciclopedia1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <!-- Estilos datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" />
    <!-- select 2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <title>Enfermedades</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 style="margin: 10px 15px 0px 0px"><i class="fas fa-viruses mr-2"></i>Consultar enfermedades</h4>
    <hr>
    <asp:Panel ID="pnl" runat="server">
        <div class="row justify-content-center">
            <div class="col-12">
                <label for="Enfermedad">Enfermedad</label>
                <asp:DropDownList class="js-example-basic-single form-control" ID="ddlEnfermedad" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-12 mt-4">
                <asp:Button runat="server" class="btn btn-primary" name="sintoma" ID="btnConsultarSintoma" Text="Consultar" OnClick="btnConsultarSintoma_Click" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlDatos" runat="server">
        <div class="row">
            <% foreach (var item in enfermedad)
                {%>
            <div class="col-12 text-center">
                <h3><% Response.Write(item.nombre); %></h3>
                <hr />
            </div>
            <div class="col-12">
                <h3>Descripción</h3>
                <p><% Response.Write(item.descripcion); %></p>
                <hr />
            </div>
            <div class="col-6">
                <h3>Recomendaciones</h3>
                <p><% Response.Write(item.recomendacion.recomendacion1); %></p>
            </div>
            <%} %>
            <div class="col-6">
                <h3>Sintomas</h3>
                <hr />
                <% foreach (var item2 in sintomas)
                    { %>
                <u>
                    <li><% Response.Write(item2.sintoma.sintoma1); %></li>
                </u>
                <%} %>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function () {
            // Cambiar idioma a español
            $('.tabla').DataTable({
                "language": {
                    "url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
                }
            });
        });
    </script>
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
