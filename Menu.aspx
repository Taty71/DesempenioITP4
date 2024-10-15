<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="WebParcial.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left: 120px;width:450px;padding:50px;background-color:#e8dcdc">
            <asp:Label ID="Label1" runat="server" Text="****Menú****" Font-Bold="True" Font-Names="Century751 BT" Font-Size="Large" ForeColor="#009999"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Century751 BT" Font-Size="Large" ForeColor="#00CC99" NavigateUrl="~/GestionPeliculas.aspx">Gestión Películas</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Names="Century751 BT" Font-Size="Large" NavigateUrl="~/GestionDirectores.aspx" ForeColor="#00CC99">Gestion Directores</asp:HyperLink>
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="TP4 Desempeño 1 -  Cristina Maia" Font-Italic="True" ForeColor="#CC0099"></asp:Label>
        </div>
    </form>
</body>
</html>
