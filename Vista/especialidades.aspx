<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="especialidades.aspx.cs" Inherits="Vista.especialidades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <!-- css bootstrap 4 datatable -->
    <link href=" https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />
    <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <!-- searchPanes -->
    <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/1.0.1/css/searchPanes.dataTables.min.css" />
    <!-- select -->
    <link href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h4 style="margin: 10px 15px 0px 0px"><i class="fas fa-user-md mr-2"></i>Consultar especialistas</h4>
    <hr>
    <div class="col-12 table-responsive-md mt-3 mb-3">
        <asp:GridView Width="100%" CellSpacing="0" class="table table-bordered table-hover tabla" ID="gdgGrid" runat="server" AutoGenerateColumns="False" OnRowCommand="gdgGrid_RowCommand">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Id" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="ente" HeaderText="Ente de salud" />
                <asp:BoundField DataField="correo" HeaderText="Correo" />
                <asp:BoundField DataField="celular" HeaderText="Celular" />
                <asp:BoundField DataField="especialidad" HeaderText="Especialidad" />
                <asp:BoundField DataField="ciudad" HeaderText="Ciudad" />

                <asp:TemplateField HeaderText="Agendar cita">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgSelec" CommandName="Seleccionar" ImageUrl="~/img/calendar.png" Width="25px" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <!-- bootstrap, popper y jquery -->
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <!-- Datatables -->
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>
    <script src="js/dataTables/datatables.min.js"></script>
    <!-- searchPanes -->
    <script src="https://cdn.datatables.net/searchpanes/1.0.1/js/dataTables.searchPanes.min.js"></script>
    <!-- select -->
    <script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>


    <!-- Botones datatable -->
    <script src="js/dataTables/dataTables.buttons.min.js"></script>
    <script src="js/dataTables/jszip.min.js"></script>
    <script src="js/dataTables/pdfmake.min.js"></script>
    <script src="js/dataTables/vfs_fonts.js"></script>
    <script src="js/dataTables/buttons.html5.min.js"></script>
    <script src="js/dataTables/exportar_tablas.js"></script>
</asp:Content>



