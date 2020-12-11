<%@ Page Title="" Language="C#" MasterPageFile="~/contenido.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Vista.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <!-- Estilos datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" />
    <!-- select 2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <title>Inicio | Dashboard</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Heading -->
    <h5 class="text-center"><i class="fas fa-home mr-2"></i>Inicio</h5>

    <div class="row justify-content-center">
        <% if (int.Parse(Session["idRol"].ToString()) == 1)
            { %>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                Cantidad de especialistas
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                <asp:Label ID="lblEspe" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-user-md fa-2x text-blue-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
        <% if (int.Parse(Session["idRol"].ToString()) == 1 || int.Parse(Session["idRol"].ToString()) == 2)
            { %>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                Cantidad de entes de salud
                                <% if (int.Parse(Session["idRol"].ToString()) == 2)
                                    { %>
                                 asignados
                                <%} %>
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                <asp:Label ID="lblEnte" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="far fa-hospital fa-2x text-blue-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
        <% if (int.Parse(Session["idRol"].ToString()) == 1 || int.Parse(Session["idRol"].ToString()) == 3)
            { %>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                <% if (int.Parse(Session["idRol"].ToString()) == 1)
                                    { %>
                                Citas atendidas
                               
                                <%} %>
                                <% if (int.Parse(Session["idRol"].ToString()) == 3)
                                    {%>
                                Citas pendientes por calificar
                                <%} %>
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                        <asp:Label ID="lblCita" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <% if (int.Parse(Session["idRol"].ToString()) == 1)
                                { %>
                            <i class="far fa-calendar-alt fa-2x text-blue-300"></i>
                            <%} %>
                            <% if (int.Parse(Session["idRol"].ToString()) == 3)
                                { %>
                            <i class="far fa-star fa-2x text-blue-300"></i>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <hr>
    <div class="row justify-content-center">
        <% if (int.Parse(Session["idRol"].ToString()) == 1)
            { %>
        <h5>Entes de salud pendientes por asignar usuario de contenido</h5>
        <asp:GridView Width="100%" CellSpacing="0" class="table table-bordered table-hover tabla" ID="gdgGrid" runat="server" AutoGenerateColumns="False" OnRowDataBound="gdgGrid_RowDataBound" OnRowCommand="gdgGrid_RowCommand">
            <Columns>
                <asp:BoundField DataField="id_ente" HeaderText="Id" />
                <asp:BoundField DataField="nit" HeaderText="Nit" />
                <asp:BoundField DataField="razon" HeaderText="Razón social" />
                <asp:BoundField DataField="representante" HeaderText="Representante" />
                <asp:BoundField DataField="ciudad" HeaderText="Ciudad" />
                <asp:BoundField DataField="capacidad" HeaderText="Capacidad de pacientes" />
                <asp:TemplateField HeaderText="Asignar u. de contenido">
                    <ItemTemplate>
                        <asp:DropDownList class="js-example-basic-single form-control" ID="ddlUsuario" runat="server"></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Confirmar">
                    <ItemTemplate>
                        <asp:Button CssClass="btn btn-success" CommandName="Asignar" ID="bntAsignar" runat="server" Text="Asignar" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>No hay datos por mostrar.</EmptyDataTemplate>
        </asp:GridView>
        <%} %>
        <% if (int.Parse(Session["idRol"].ToString()) == 2)
            { %>
        <div class="col-12">
            <h5 class="text-center">Entes de salud asociados.</h5>
        </div>

        <asp:GridView Width="100%" CellSpacing="0" class="table table-bordered table-hover tabla" ID="gdvEnte" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="nit" HeaderText="Nit" />
                <asp:BoundField DataField="razon" HeaderText="Razón social" />
                <asp:BoundField DataField="representante" HeaderText="Representante" />
                <asp:BoundField DataField="correo" HeaderText="Correo" />
                <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                <asp:BoundField DataField="sitio" HeaderText="Sitio web" />
                <asp:BoundField DataField="ciudad" HeaderText="Ciudad" />
                <asp:BoundField DataField="capacidad" HeaderText="Capacidad de pacientes" />
            </Columns>
            <EmptyDataTemplate>No hay datos por mostrar.</EmptyDataTemplate>
        </asp:GridView>
        <%} %>
        <% if (int.Parse(Session["idRol"].ToString()) == 3)
            { %>
        <div class="col-12">
            <h5 class="text-center">Historico de citas.</h5>
        </div>
        <asp:GridView Width="100%" CellSpacing="0" class="table table-bordered table-hover tabla" ID="gdvCita" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="id_cita" HeaderText="Id" />
                <asp:BoundField DataField="fecha_cita" HeaderText="Fecha cita" />
                <asp:BoundField DataField="id_hora" HeaderText="Hora cita" />
                <asp:BoundField DataField="especialista" HeaderText="Especialista" />
                <asp:BoundField DataField="especialidad" HeaderText="Especialidad" />
                <asp:BoundField DataField="calificacion" HeaderText="Calificación" />
                <asp:BoundField DataField="estado" HeaderText="Estado" />
            </Columns>
            <EmptyDataTemplate>No hay datos por mostrar.</EmptyDataTemplate>
        </asp:GridView>
        <%} %>
    </div>
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
