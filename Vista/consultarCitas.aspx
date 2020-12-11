<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="consultarCitas.aspx.cs" Inherits="Vista.consultarCitas1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <!-- Estilos datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" />
    <title>Consultar citas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        if (int.Parse(Session["idRol"].ToString()) == 3)
        {
    %>
    <h4 style="margin: 10px 15px 0px 0px"><i class="fas fa-star mr-2" style="color:orange"></i>Calificar citas</h4>

    <%} %><%
        if (int.Parse(Session["idRol"].ToString()) == 1)
        {
    %>
    <h4 style="margin: 10px 15px 0px 0px"><i class="far fa-calendar-alt mr-2"></i>Consultar citas</h4>

    <%} %>
    <hr>
    <asp:Panel ID="PanelGrid" runat="server">
        <asp:GridView Width="100%" CellSpacing="0" class="table table-bordered table-hover tabla" ID="gdgGrid" runat="server" AutoGenerateColumns="False" OnRowCommand="gdgGrid_RowCommand" OnRowDataBound="gdgGrid_RowDataBound" OnSelectedIndexChanged="gdgGrid_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="id_cita" HeaderText="Id cita" />
                <asp:BoundField DataField="fecha_cita" HeaderText="Fecha" />
                <asp:BoundField DataField="id_hora" HeaderText="Hora" />
                <asp:BoundField DataField="especialista" HeaderText="Atendido por:" />
                <asp:BoundField DataField="especialidad" HeaderText="Especialidad" />
                <asp:BoundField DataField="calificacion" HeaderText="Calificación" />
                <asp:BoundField DataField="estado" HeaderText="Estado" />

                <asp:TemplateField HeaderText="Calificación">
                    <ItemTemplate>
                        <asp:DropDownList class="js-example-basic-single form-control" ID="ddlCalificar" runat="server"></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Calificar">
                    <ItemTemplate>
                        <asp:Button CssClass="btn btn-success" CommandName="Calificar" ID="bntCalificar" runat="server" Text="Calificar" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>No hay datos por mostrar.</EmptyDataTemplate>
        </asp:GridView>

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
</asp:Content>
