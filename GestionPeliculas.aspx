<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionPeliculas.aspx.cs" Inherits="WebParcial.GestionPeliculas"  %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color:darkgrey; padding:10px;">
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Century751 BT" Font-Size="Medium" ForeColor="#00CC99" NavigateUrl="~/Menu.aspx">Ir al Menú</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Century751 BT" ForeColor="#339966" Text="****   PELICULAS   ****" Font-Size="Large"></asp:Label>
            <br />
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Height="27px" Width="202px" style="margin-top: 0px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="27px" Width="202px"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" Height="52px" Width="231px" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataTextField="NombreCompleto" DataValueField="id">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Actualizar" BackColor="#009999" ForeColor="#66FFCC" OnClick="Button1_Click" style="margin-top: 7px" Height="27px" Width="78px" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Mensaje" Font-Italic="True"></asp:Label>
            <br />
            <style>
                .grid-icon img {
                    width: 10px;
                    height: 10px;
                }
            </style>
&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<br />
            <br />
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="IdPelicula" DataSourceID="SqlDataSource3" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" Height="283px">
    <Columns>
        <asp:BoundField DataField="IdPelicula" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="IdPelicula" />
        <asp:BoundField DataField="nombrePelicula" HeaderText="Nombre Película" SortExpression="nombrePelicula" />
        <asp:BoundField DataField="NombreDirector" HeaderText="Nombre Director" SortExpression="nombreDirector" />
        <asp:BoundField DataField="ApellidoDirector" HeaderText="Apellido Director" SortExpression="apellidoDirector" />
        <asp:TemplateField>
            
               <ItemTemplate>
                 <asp:ImageButton ID="DeleteButton" runat="server" ImageUrl="~/Icons/eliminar.png" OnClientClick="return confirmDelete();" CommandName="Delete" />
                 <asp:ImageButton ID="EditButton" runat="server" ImageUrl="~/Icons/editar.png" CommandName="Edit" />
                 <asp:ImageButton ID="SelectButton" runat="server" ImageUrl="~/Icons/select.png" CommandName="Select" />
               </ItemTemplate>
           

        </asp:TemplateField>
        <asp:BoundField DataField="idDirector" HeaderText="ID Director" SortExpression="idDirector" Visible="false" />
    </Columns>
    <FooterStyle BackColor="White" ForeColor="#333333" />
    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>

            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;
            <br />
            <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
            ConnectionString="<%$ ConnectionStrings:Conectando %>"
            DeleteCommand="DELETE FROM [Peliculas] WHERE [id] = @id"
            InsertCommand="INSERT INTO [Peliculas] ([nombrePelicula], [idDirector]) VALUES (@nombrePelicula, @idDirector)"
            SelectCommand="SELECT P.id AS IdPelicula, P.nombrePelicula AS NombrePelicula, D.nombre AS NombreDirector, D.apellido AS ApellidoDirector FROM Peliculas AS P INNER JOIN Directores AS D ON P.idDirector = D.id"
            UpdateCommand="UPDATE [Peliculas] SET [nombrePelicula] = @nombrePelicula, [idDirector] = @idDirector WHERE [id] = @id">

            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>

            <InsertParameters>
                <asp:Parameter Name="nombrePelicula" Type="String" />
                <asp:Parameter Name="idDirector" Type="Int32" />
            </InsertParameters>

            <UpdateParameters>
                <asp:Parameter Name="nombrePelicula" Type="String" />
                <asp:Parameter Name="idDirector" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


            <br />

              <asp:SqlDataSource ID="SqlDataSource2" 
                    runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conectando %>" 
                    SelectCommand="SELECT id, nombre + ' ' + apellido AS NombreCompleto FROM Directores">
             
            </asp:SqlDataSource>

            <br />
            <%-- asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Conectando %>" DeleteCommand="DELETE FROM [Directores] WHERE [id] = @id" InsertCommand="INSERT INTO [Directores] ([apellido], [nombre]) VALUES (@apellido, @nombre)" SelectCommand="SELECT * FROM [Directores] WHERE ([id] = @id)" UpdateCommand="UPDATE [Directores] SET [apellido] = @apellido, [nombre] = @nombre WHERE [id] = @id" --%>

        </div>
        <asp:HiddenField ID="HiddenFieldDelete" runat="server" />

        <script type="text/javascript">
            function confirmDelete() {
                var confirmValue = confirm("¿Estás seguro de que deseas eliminar este registro?");
                document.getElementById('<%= HiddenFieldDelete.ClientID %>').value = confirmValue ? "Yes" : "No";
                return confirmValue;
            }
        </script>

    </form>
</body>
</html>
