<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="crearCita.aspx.cs" Inherits="Vista.crearCita1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                            <li class="list-group-item">Nombre: <%Response.Write(e.nombre);%></li>
                            <li class="list-group-item">Ente: <%Response.Write(e.ente_salud.razon_social); %></li>
                            <li class="list-group-item">Correo electronico: <%Response.Write(e.correo);%></li>
                            <li class="list-group-item">Celular: <%Response.Write(e.celular); %></li>
                            <li class="list-group-item">Ciudad: <%Response.Write(e.ciudad.ciudad1); %></li>
                            <li class="list-group-item">Numero de licencia: <%Response.Write(e.num_licencia); %></li>
                            <li class="list-group-item">Fecha de expedición: <%Response.Write(e.fech_expedicion_licen.ToShortDateString()); %></li>
                        </ul>
                        <%} %>
                    </div>
                </center>
            </div>
            <div class="col-8">
                <center>
                    <div class="field-wrap">
                        <h5>Agendar cita</h5>
                        <asp:Calendar ID="Calendar" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="Calendar_SelectionChanged" Width="200px" OnDayRender="Calendar_DayRender">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
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
