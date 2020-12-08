<%@ Page Title="" Language="C#" MasterPageFile="~/Contenido.Master" AutoEventWireup="true" CodeBehind="enciclopedia.aspx.cs" Inherits="Vista.enciclopedia1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/registro.css" />
    <link rel="stylesheet" href="css/dashPersona.css" />

    <asp:Panel ID="PanelForm" runat="server">
        <div class="container-login" style="margin-top: 129px">
            <div class="form">
                <h1 style="margin: 10px 15px 0px 0px">Consultar Enfermedad</h1>
                <div class="tab-content" style="margin-top: 100px;">
                    <div id="signup">
                        <asp:Label runat="server" ID="lblBienvenido"></asp:Label>

                        <div class="field-wrap">
                            <label for="Enfermedad"></label>
                            <asp:DropDownList class="lista" Style="font-size: 22px; display: block; width: 100%; height: 100%; padding: 5px 10px; background: none; background-image: none; border: 1px solid #a0b3b0; color: #000000; border-radius: 0; -webkit-transition: border-color 0.25s ease, box-shadow 0.25s ease; transition: border-color 0.25s ease, box-shadow 0.25s ease;"
                                ID="DropDownEnfermedad" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="field-wrap">
                            <label for="Sintoma"></label>
                            <asp:DropDownList class="lista" Style="font-size: 22px; display: block; width: 100%; height: 100%; padding: 5px 10px; background: none; background-image: none; border: 1px solid #a0b3b0; color: #000000; border-radius: 0; -webkit-transition: border-color 0.25s ease, box-shadow 0.25s ease; transition: border-color 0.25s ease, box-shadow 0.25s ease;"
                                ID="DropDownSintoma" runat="server">
                            </asp:DropDownList>
                        </div>



                        <asp:Button runat="server" class="button button-block" name="sintoma" ID="btnConsultarSintoma" Text="Consultar" OnClick="btnConsultarSintoma_Click" /><br />
                    </div>
                    <div id="login"></div>
                </div>
                <!-- tab-content -->
            </div>
            <!-- /form -->
        </div>


        <asp:GridView ID="gdgGrid" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="recomendacion" HeaderText="Recomendacion" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>
