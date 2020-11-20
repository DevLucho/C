<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="consultaEspecialidades.aspx.cs" Inherits="Vista.consultaEspecialidades" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
            <asp:Label ID="LblCiudad" runat="server" Text="Ciudad"></asp:Label>
            <asp:TextBox ID="TextCiudad" runat="server"></asp:TextBox><br />
             <asp:Label ID="LblEspecialidad" runat="server" Text="Especialidad"></asp:Label>
            <asp:TextBox ID="TextEspecialidad" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" /> 
            <asp:GridView ID="gdgGrid" runat="server"></asp:GridView>

        </div>
</asp:Content>