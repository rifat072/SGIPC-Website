<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        #upcoming
        {
            width: 100%;
            border: 1px solid black;
            height: 270px;
            margin: 0 auto;
            position: relative;
            margin-bottom: 10px;
        }

        .sliders
        {
            width: 100%;
            height: 100%;
            position: absolute;
        }

        .btn
        {
            position: absolute;
            width: 40px;
            height: 40px;
            border-radius: 25px;
            border: none;
            top: 120px;
        }

        #btn2
        {
            position: relative;
            float: right;
        }
        .foot
{
       background-color:black;
}
    </style>
    <div style="width: 40%; float: left; margin-left: 50px; margin-top: 100px;">
        <div style="height: auto; margin-bottom: 100px;">
            <h1><font size="6">Recent posts</font></h1>
            <div style="background-color: #bf1430; height: 5px; width: 100%; margin-bottom: 30px; float: left;"></div>
            <style>
                #DataList1
                {
                    margin-left: 20px;
                }
            </style>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT top 2 [blog].[writter],[blog].[post],[blog].[ID],[usertable].[imagedata] FROM [blog] join [usertable] on [blog].writter=[usertable].id order by [blog].id desc"></asp:SqlDataSource>
            <div style="margin-left:20px;">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%#"data:Image/png;base64,"+Convert.ToBase64String((byte[])Eval("imagedata")) %>' Height="57px" Width="69px" />

                    <style>
                            #HyperLink1
                            {
                                text-decoration:none;
                               
                            }
                        </style>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("writter","~/profile.aspx?id={0}") %>' Font-Size="Larger" Font-Underline="False"><%# Eval("writter") %></asp:HyperLink>

                    <div style="background-color: #bf1430; height: 4px; width: 200px;"></div>

                    <br />
                    <asp:Label ID="postLabel" runat="server" Text='<%# Eval("post") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
                </div>
            <div style="float: right;">
                <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="~/Blog.aspx">See all</asp:HyperLink>
            </div>
        </div>
        
    </div>

    <div style="width: 46%; float: right;  height: 584px; margin-top: 200px;">
        <center>
				<div style="padding-top: 15%; width: 86%; height: 515px;">
				    <asp:GridView ID="admin" runat="server" AutoGenerateColumns="False" CellPadding="10" CssClass="notice" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" BorderColor="#BF1430" BorderStyle="Solid" BorderWidth="2px" PageSize="3" ShowFooter="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:TemplateField HeaderText="Date" SortExpression="Date">
                                
                                <ItemTemplate>
                                    <asp:Label ID="datelebel" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Button CssClass="text_field" ID="noticebtn" runat="server" Text="Insert" OnClick="noticebtn_Click"></asp:Button>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notice" SortExpression="Description">
                                <EditItemTemplate>
                                    <asp:TextBox ID="descriptionedit" CssClass="text_field" TextMode="MultiLine" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="noticelebel" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                </ItemTemplate>
                                
                                <FooterTemplate>
                                    <asp:TextBox CssClass="text_field" Width="100%  " ID="noticetxt" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    
                                </FooterTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <FooterStyle BackColor="#bf1430" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#bf1430" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                       
                        <SelectedRowStyle  Font-Bold="True"  />
                        <SortedAscendingCellStyle  />
                        <SortedAscendingHeaderStyle  />
                        <SortedDescendingCellStyle  />
                        <SortedDescendingHeaderStyle />
                    </asp:GridView>
                    <asp:GridView ID="guest" runat="server" AutoGenerateColumns="False" CellPadding="10" CssClass="notice" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" BorderColor="#BF1430" BorderStyle="Solid" BorderWidth="2px" PageSize="3">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField />
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                            <asp:BoundField DataField="Description" HeaderText="Notice" SortExpression="Description" />
                        </Columns>
                        <FooterStyle BackColor="#bf1430" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#bf1430" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                       
                        <SelectedRowStyle  Font-Bold="True"  />
                        <SortedAscendingCellStyle  />
                        <SortedAscendingHeaderStyle  />
                        <SortedDescendingCellStyle  />
                        <SortedDescendingHeaderStyle />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" DeleteCommand="DELETE FROM [Notice] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Notice] ([Date], [Description]) VALUES (@Date, @Description)" ProviderName="<%$ ConnectionStrings:cs.ProviderName %>" SelectCommand="SELECT TOP 5 [Id], [Date], [Description] FROM [Notice] ORDER BY [Id] DESC" UpdateCommand="UPDATE [Notice] SET [Date] = @Date, [Description] = @Description WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter DbType="Date" Name="Date" />
                            <asp:Parameter Name="Description" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter DbType="Date" Name="Date" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
					
                     
				</div>
			</center>
    </div>
    <div style="clear:both;margin-left:250px;margin-right:250px;">
        <h1><font size="6">Upcoming Events</font></h1>
        <div style="background-color: #bf1430; height: 7px; width: 100%; margin-bottom: 5px;"></div>
        <div id="upcoming" style="margin-bottom: 100px;">
            <img class="sliders" src="events/buetcsefest.jpg" />
            <img class="sliders" src="events/pstufest.jpg" />

        </div>
    </div>


    <script type="text/javascript">
        var index = 1;


        autoSlide();
        function autoSlide() {
            var i;
            var x = document.getElementsByClassName("sliders");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            if (index > x.length) index = 1;
            x[index - 1].style.display = "block";
            index++;
            setTimeout(autoSlide, 2000);
        }
    </script>

</asp:Content>

