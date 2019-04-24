<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="margin-bottom:20px;">
        <tr>
            <td>
                <div style="margin-left:20px;margin-right:20px;">
                <h1><font size="6">Update Blogs</font></h1>
                <div style="background-color: #bf1430; height: 7px; width: 100%; margin-bottom: 5px;"></div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="writter" HeaderText="writter" SortExpression="writter" />
                        <asp:BoundField DataField="post" HeaderText="post" SortExpression="post" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" DeleteCommand="DELETE FROM [blog] WHERE [id] = @id" InsertCommand="INSERT INTO [blog] ([writter], [post]) VALUES (@writter, @post)" ProviderName="<%$ ConnectionStrings:cs.ProviderName %>" SelectCommand="SELECT [id], [writter], [post] FROM [blog]" UpdateCommand="UPDATE [blog] SET [writter] = @writter, [post] = @post WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="writter" Type="String" />
                        <asp:Parameter Name="post" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="writter" Type="String" />
                        <asp:Parameter Name="post" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>
            </td>
            <td>
                <div style="margin-left:20px;margin-right:20px;">
                <h1><font size="6">Update Users</font></h1>
                <div style="background-color: #bf1430; height: 7px; width: 100%; margin-bottom: 5px;"></div>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="score" HeaderText="score" SortExpression="score" />
                        <asp:BoundField DataField="admin" HeaderText="admin" SortExpression="admin" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" DeleteCommand="DELETE FROM [usertable] WHERE [id] = @id" InsertCommand="INSERT INTO [usertable] ([id], [password], [first_name], [email], [last_name], [score], [occupation], [university], [city], [country], [contactno], [imagename], [imagesize], [admin]) VALUES (@id, @password, @first_name, @email, @last_name, @score, @occupation, @university, @city, @country, @contactno, @imagename, @imagesize, @admin)" ProviderName="<%$ ConnectionStrings:cs.ProviderName %>" SelectCommand="SELECT [id], [password], [first_name], [email], [last_name], [score], [occupation], [university], [city], [country], [contactno], [imagename], [imagesize], [imagedata], [admin] FROM [usertable]" UpdateCommand="UPDATE [usertable] SET   [email] = @email,  [score] = @score,  [admin] = @admin WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="first_name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="last_name" Type="String" />
                        <asp:Parameter Name="score" Type="Int32" />
                        <asp:Parameter Name="occupation" Type="String" />
                        <asp:Parameter Name="university" Type="String" />
                        <asp:Parameter Name="city" Type="String" />
                        <asp:Parameter Name="country" Type="String" />
                        <asp:Parameter Name="contactno" Type="String" />
                        <asp:Parameter Name="imagename" Type="String" />
                        <asp:Parameter Name="imagesize" Type="Int32" />
                        <asp:Parameter Name="admin" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="score" Type="Int32" />
                        <asp:Parameter Name="admin" Type="Int32" />
                        <asp:Parameter Name="id" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

