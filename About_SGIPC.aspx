<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About_SGIPC.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <style>
        .container
        {
            padding: 10px;
            margin-right: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="margin-top: 100px; margin-bottom: 100px; margin-left: 20px; margin-right: 20px;">

        <table style="width: 100%;">
            <tr>
                <td rowspan="2" style="width: 60%;">

                    <div style="margin-right: 100px;">

                        <div style="float: right; margin-right: 20px;">
                            <a style="padding-right: 10px;" href="https://www.facebook.com/groups/sgipc.kuet/" target="blank">
                                <img width="20px" src="style/facebook.png" /></a>
                            <a href="https://www.facebook.com/groups/sgipc.kuet/" target="blank">
                                <img src="style/mail.png" style="height: 18px; width: 20px" /></a>

                        </div>
                        <br />
                        <br />
                        <img height="350px;" style="border: 2px solid #bf1430" src="style/coverphoto.jpg" />
                        <br />
                        <br />
                        <font style="font-size: 25px;">For any information</font>
                        <br />
                        <br />

                        <div style="background-color: #bf1430; height: 4px;"></div>
                        <br />
                        <div style="margin-left: 20px;">
                            Shafiq Newaj Shovo<br />
                            President,SGIPC<br />
                            CSE,1407048,2K14<br />
                            Phone: +8801711111111
                            <br />
                            <br />

                            Tanvir Wahid<br />
                            Vice-president,SGIPC<br />
                            CSE	1407026	2K14<br />
                            Phone: +8801711111111
                        </div>
                        </div>
                </td>
                <td>
                    <font style="font-size: 50px;">Welcome</font>
                    <br />
                    <div style="background-color: #bf1430; height: 4px;"></div>
                    <br />
                    SGIPC(Special Group of Interested in Programming Contest) is a organization of CSE,Khulna University of Engineering & Technology. 
                        This organization hold different types of event that are related to contest programming. 
                        <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <font style="font-size: 25px;">Contact Us</font>
                    <br />
                    <br />
                    <div style="background-color: #bf1430; height: 4px;"></div>
                    <br />
                    <div class="container">
                        <table style="width: 100%; border-spacing: 15px;">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox Width="100%" ID="TextBox1" CssClass="text_field" runat="server" placeholder="Your Name.."></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox Width="100%" ID="TextBox2" CssClass="text_field" runat="server" placeholder="Your Email"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Country" placeholder="Your Email..."></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList Width="100%" CssClass="text_field" ID="DropDownList1" runat="server"
                                        TabIndex="14" onchange="javascript:OnSelectedChanged(this,event);">
                                        <asp:ListItem Value="Australia"></asp:ListItem>
                                        <asp:ListItem Value="Bangladesh"></asp:ListItem>
                                        <asp:ListItem Value="Canada"></asp:ListItem>
                                        <asp:ListItem Value="USA"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <textarea placeholder="Write something..." id="TextArea1" cols="75" rows="6"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button Width="100%" CssClass="text_field" ID="Button1" runat="server" Text="Submit" />
                                </td>
                            </tr>
                        </table>

                    </div>

                </td>
            </tr>
        </table>

    </div>
</asp:Content>

