<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="agregarEspecialista.aspx.cs" Inherits="Vista.agregarEspecialista1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/registro.css" />
    <link rel="stylesheet" href="css/dashPersona.css" />

    <div class="container-login" style="margin-top: 129px">
        <div class="form">
            <h1 style="margin: 10px 15px 0px 0px">Crear Especialista</h1>
            <div class="tab-content" style="margin-top: 100px;">
                <div id="signup">
                    <div class="field-wrap">
                        <asp:Label ID="NombreID" runat="server" for="nombre"></asp:Label>
                        <asp:TextBox placeholder="Nombre" type="text" runat="server" name="nombre" ID="TextNombre" required autocomplete="off"></asp:TextBox>
                    </div>

                    <asp:Label runat="server" ID="lblBienvenido"></asp:Label>

                    <div class="field-wrap">
                        <asp:Label ID="CorreoID" runat="server" for="correo"></asp:Label>
                        <asp:TextBox placeholder="Correo" name="correo" runat="server" ID="TextCorreo" type="email" required autocomplete="off"></asp:TextBox>
                    </div>

                    <div class="field-wrap">
                        <asp:Label runat="server" for="celular"></asp:Label>
                        <asp:TextBox runat="server" placeholder="Celular" name="celular" ID="TextCelular" type="number" required autocomplete="off"></asp:TextBox>
                    </div>

                    <div class="field-wrap">
                        <label for="numLicencia"></label>
                        <asp:TextBox placeholder="Num.Licencia" runat="server" name="licencia" ID="TextNumLicencia" type="number" required autocomplete="off"></asp:TextBox>
                    </div>

                    <div class="top-row">
                        <div class="field-wrap">
                            <label for="Ciudad"></label>
                            <asp:DropDownList class="lista" Style="font-size: 22px; display: block; width: 100%; height: 100%; padding: 5px 10px; background: none; background-image: none; border: 1px solid #a0b3b0; color: #000000; border-radius: 0; -webkit-transition: border-color 0.25s ease, box-shadow 0.25s ease; transition: border-color 0.25s ease, box-shadow 0.25s ease;" ID="drpCiudad" runat="server"></asp:DropDownList>
                        </div>

                        <div class="field-wrap">
                            <label for="Especialidad"></label>
                            <asp:DropDownList class="lista" Style="font-size: 22px; display: block; width: 100%; height: 100%; padding: 5px 10px; background: none; background-image: none; border: 1px solid #a0b3b0; color: #000000; border-radius: 0; -webkit-transition: border-color 0.25s ease, box-shadow 0.25s ease; transition: border-color 0.25s ease, box-shadow 0.25s ease;" ID="drpEspecialidad" runat="server"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="field-wrap">
                        <label for="FechaE"></label>
                        <asp:TextBox placeholder="Fecha" runat="server" name="fechaE" ID="TextFechaE" type="date" required autocomplete="off"></asp:TextBox>
                    </div>

                    <asp:Button runat="server" class="button button-block" name="registro" ID="btnRegistarEspecialista" Text="Registrar" OnClick="btnRegistarEspecialista_Click" /><br />
                </div>
                <div id="login"></div>
            </div>
            <!-- tab-content -->
        </div>
        <!-- /form -->
    </div>
</asp:Content>
