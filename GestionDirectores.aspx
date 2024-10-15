<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionDirectores.aspx.cs" Inherits="WebParcial.GestionDirectores" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="False" Font-Italic="True" Font-Names="CentSchbkCyrill BT" Font-Size="Medium" ForeColor="#00CC99" Font-Underline="False" NavigateUrl="~/Menu.aspx">Ir al Menu</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Century751 BT" Font-Size="Large" ForeColor="#339966" Text="   ***  DIRECTORES ***"></asp:Label>
            <br />
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="170px" Height="26px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Width="170px" Height="26px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Agregar" BackColor="#009999" ForeColor="#66FFCC" OnClick="Button1_Click" Height="27px" />
        &nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Font-Italic="True" ForeColor="#00CC99" Text="Mensaje"></asp:Label>
        </div>
        <p>
&nbsp;
           <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" GridLines="Horizontal" Width="515px" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" Height="255px">
                <Columns>
                   <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:TemplateField>
                       <ItemTemplate>
                            <asp:ImageButton ID="DeleteButton" runat="server" ImageUrl="~/Icons/eliminar.png" OnClientClick="return confirmDelete();" CommandName="Delete" />
                            <asp:ImageButton ID="EditButton" runat="server" ImageUrl="~/Icons/editar.png" CommandName="Edit" />
                            <asp:ImageButton ID="SelectButton" runat="server" ImageUrl="~/Icons/select.png" CommandName="Select" />
                        </ItemTemplate>
                         <EditItemTemplate>
                            
                            <asp:ImageButton ID="UpdateButton" runat="server" ImageUrl="~/Icons/actualizar.png" CommandName="Update" />
                            <asp:ImageButton ID="CancelButton" runat="server" ImageUrl="~/Icons/cancelar.png" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
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
        </p>
        <p>
            &nbsp;</p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conectando %>" DeleteCommand="DELETE FROM [Directores] WHERE [id] = @id" InsertCommand="INSERT INTO [Directores] ([apellido], [nombre]) VALUES (@apellido, @nombre)" SelectCommand="SELECT * FROM [Directores]" UpdateCommand="UPDATE [Directores] SET [apellido] = @apellido, [nombre] = @nombre WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="apellido" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="apellido" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <asp:HiddenField ID="eliminar" runat="server" />


    </form>
                <script type="text/javascript">
                    function confirmDelete() {
                        var confirmValue = confirm("¿Estás seguro de que deseas eliminar este registro?");
                        document.getElementById('<%= eliminar.ClientID %>').value = confirmValue ? "Yes" : "No";
                        return confirmValue;
                    }
                </script>
</body>
</html>
