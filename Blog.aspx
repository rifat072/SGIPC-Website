<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .comment
        {
            border: 2px solid #dedede;
            background-color: #f1f1f1;
            border-radius: 5px;
            padding: 30px;
            margin: 10px 0;
            margin-left: 30px;
            height: auto;
            font-family: arial;
            font-size: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div style="min-height: 800px; margin-top: 100px; margin-bottom: 100px; margin-left: 20px; margin-right: 20px;">
        <div style="width: 60%; margin-bottom: 5%;margin-left:5%;">
            <table>
                <tr>
                    
                    <td style="width:90%;">
                        <asp:TextBox ID="posttext" runat="server" Height="100px" Width="98%" TextMode="MultiLine" BorderColor="#bf1430" BorderWidth="2px"></asp:TextBox>
      
                    </td>
                    <td>
                        <asp:Button CssClass="text_field" ID="Button1" runat="server" Text="Post" OnClick="Button1_Click" />

                    </td>
                </tr>
                <tr> 
                    <td>
                    <asp:Label ID="Label1" runat="server" ForeColor="red" Text="You have to login first" Visible="false"></asp:Label>
               </td>
                         </tr>
            </table>
        </div>
        <div style="margin-right: 5%; margin-left:5%; border: 3px solid #bf1430;">

            <asp:DataList ID="posts" runat="server" OnItemDataBound="posts_ItemDataBound" OnItemCommand="posts_ItemCommand">
                <ItemTemplate>
                    <div style="padding: 20px; margin-left: 5%; margin-right: 5%;margin-top:5%;">
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%#"data:Image/png;base64,"+Convert.ToBase64String((byte[])Eval("imagedata")) %>' Height="8%" Width="8%" />
                        <style>
                            #HyperLink1
                            {
                                text-decoration: none;
                            }
                        </style>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("writter","~/profile.aspx?id={0}") %>' Font-Size="Larger" Font-Underline="False"><%# Eval("writter") %></asp:HyperLink>
                        <div style="background-color: #bf1430; height: 4px; width: 25%;"></div>
                        <br />

                        <asp:Label ID="postLabel" runat="server" Text='<%# Eval("post") %>' Width="100%" />
                        <br />
                        <br />
                        <div>
                            <table style="width:100%;" >
                                <tr>
                                    <td>
                                        <asp:TextBox ID="commenttxt" runat="server" Height="70px" Width="96%" TextMode="MultiLine" BorderColor="#bf1430" BorderWidth="2px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <div style="margin-top: 25px;">
                                            <asp:Button CommandArgument='<%#Eval("id") %>' ID="commentbtn" CssClass="text_field" runat="server" Text="Comment" OnClick="commentbtn_Click" CommandName="blogid" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="margin-left: 10%; margin-top: 5%;">
                            <asp:DataList ID="comments" runat="server">
                                <ItemTemplate>
                                    <div style="float: left; width: 20%; margin-top: 15px;">
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%#"data:Image/png;base64,"+Convert.ToBase64String((byte[])Eval("imagedata")) %>' Height="40%" Width="40%" /><br />
                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#Eval("comment_writter","~/profile.aspx?id={0}") %>' Font-Size="Larger" Font-Underline="False"><%# Eval("comment_writter") %></asp:HyperLink>
                                    </div>
                                    <div style="float: right; width: 80%;">
                                        <asp:TextBox ID="TextBox1" CssClass="comment" Width="80%" runat="server" Text='<%# Eval("description") %>' ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </ItemTemplate>

                            </asp:DataList>
                        </div>

                    </div>
                </ItemTemplate>
                
            </asp:DataList>

        </div>

    </div>



</asp:Content>

