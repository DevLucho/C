<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="crearCita.aspx.cs" Inherits="Vista.crearCita1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/registro.css" />
    <link rel="stylesheet" href="css/dashPersona.css" />
    <div class="container-login" style="margin-top: 129px">

        <div class="form">


            <h1 style="margin: 10px 15px 0px 0px">Crear Cita</h1>

            <div class="tab-content" style="margin-top: 100px;">
                <div id="signup">


                    <asp:Label runat="server" ID="lblBienvenido"></asp:Label>

                    <div class="top-row">
                        <div class="field-wrap">
                            <label for="Ciudad"></label>
                            
                                <asp:DropDownList class="lista" Style="font-size: 22px; display: block; width: 100%; height: 100%; padding: 5px 10px; background: none; background-image: none; border: 1px solid #a0b3b0; color: #000000; border-radius: 0; -webkit-transition: border-color 0.25s ease, box-shadow 0.25s ease; transition: border-color 0.25s ease, box-shadow 0.25s ease;"
                                    ID="DropDownList" runat="server">
                                </asp:DropDownList>
                        </div>

                        <div class="field-wrap">
                            <label for="Capacidad"></label>
                            <asp:TextBox placeholder="Capacidad" runat="server" name="fecha" ID="TextFecha" type="date" required autocomplete="off"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Button runat="server" class="button button-block" name="registro" ID="btnRegistrarCita" Text="Registrarme" OnClick="btnRegistrarCita_Click" />

                    <br />

                </div>

                <div id="login">
                </div>

            </div>
            <!-- tab-content -->

        </div>
        <!-- /form -->
    </div>
</asp:Content>
