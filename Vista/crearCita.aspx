<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="crearCita.aspx.cs" Inherits="Vista.crearCita1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <title>Crear cita</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 style="margin: 10px 15px 0px 0px"><i class="far fa-calendar-alt mr-2"></i>Agendar cita</h4>
    <hr>

    <div class="top-row">
        <div class="row">
            <div class="col-4" style="border-right: 1px solid rgba(0,0,0,.1);">
                <center>
                    <h5>Datos del especialista</h5>
                    <div class="card text-black" style="width: 18rem;">
                        <% foreach (var e in infoEspecialista())
                            { %>
                        <div class="card-body">
                            <h5 class="card-title"><% Response.Write(e.especialidad.especialidad1); %></h5>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><b>Nombre:</b><br> <%Response.Write(e.nombre);%></li>
                            <% if (e.id_ente != null)
                                { %>
                            <li class="list-group-item"><b>Ente de salud:</b><br> <%Response.Write(e.ente_salud.razon_social); %></li>
                            <% } %>
                            <li class="list-group-item"><b>Correo electronico:</b><br> <%Response.Write(e.correo);%></li>
                            <li class="list-group-item"><b>Celular:</b><br> <%Response.Write(e.celular); %></li>
                            <li class="list-group-item"><b>Ciudad:</b><br> <%Response.Write(e.ciudad.ciudad1); %></li>
                            <li class="list-group-item"><b>Numero de licencia:</b><br> <%Response.Write(e.num_licencia); %></li>
                            <li class="list-group-item"><b>Fecha de expedición:</b><br> <%Response.Write(e.fech_expedicion_licen.ToShortDateString()); %></li>
                        </ul>
                        <%} %>
                    </div>
                </center>
            </div>
            <div class="col-8">
                <center>
                    <div class="field-wrap">
                        <h5>Agendar cita</h5>
                        <asp:Calendar ID="Calendar" runat="server" Height="288px" OnSelectionChanged="Calendar_SelectionChanged" Width="382px" OnDayRender="Calendar_DayRender" BackColor="white" BorderColor="black" Font-Names="Verdana" Font-Size="10pt" ForeColor="black" BorderWidth="1px" DayNameFormat="Shortest" ShowGridLines="True">
                            <DayHeaderStyle Font-Bold="True" Height="1px" BackColor="white" />
                            <NextPrevStyle Font-Size="10pt" ForeColor="#FFFFCC" />
                            <OtherMonthDayStyle ForeColor="gray" />
                            <SelectedDayStyle BackColor="green" Font-Bold="True" />
                            <SelectorStyle BackColor="white" />
                            <TitleStyle BackColor="black" Font-Bold="True" Font-Size="10pt" ForeColor="white" />
                            <TodayDayStyle BackColor="seagreen" ForeColor="White" />
                        </asp:Calendar>
                        <asp:TextBox ID="txtFecha" CssClass="border-0 text-center" runat="server" ReadOnly="true" Width="250px"></asp:TextBox>
                        <br><br>
                        <asp:Button runat="server" class="btn btn-success" name="filtrar" ID="bntFiltrar" Text="Filtrar" OnClick="bntFiltrar_Click" />
                        
                    </div>
                    <asp:Panel ID="reserva" runat="server">
                    <div class="field-wrap">
                        <hr>
                        <b><label>Hora de la cita:</label></b><br>
                        <div class="col-3">
                            <asp:DropDownList class="form-control" ID="DropDownList" runat="server" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <br>
                    <br>
                    <asp:Button runat="server" class="btn btn-success" name="registro" ID="btnRegistrarCita" Text="Reservar cita" OnClick="btnRegistrarCita_Click" />
                    </asp:Panel>
                </center>
            </div>

        </div>
    </div>
</asp:Content>
