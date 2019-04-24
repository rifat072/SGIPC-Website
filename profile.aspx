<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 137px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-top: 100px; margin-bottom: 500px;">

        <div style="width: 35%; float: left;">

            <asp:Image ID="Image1" runat="server" ImageUrl="~/style/user.png" Height="233px" Style="margin-left: 189px" Width="241px" />
            <br />
            <br />
            <asp:Button ID="update_button" Visible="false" runat="server" Text="Update Information" CssClass="text_field" Style="margin-left: 189px" Width="241px" OnClick="update_button_Click" />
        </div>
        <div style="width: 55%; float: right;">
            <div id="profile" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style1"><b>Name</b></td>
                        <td>
                            <asp:Label ID="name" runat="server" Text="-"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Score</b></td>
                        <td>
                            <asp:Label ID="score" runat="server" Text="-"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Occupation</b></td>
                        <td>
                            <asp:Label ID="occupation" runat="server" Text="-"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>University</b></td>
                        <td>
                            <asp:Label ID="university" runat="server" Text="-"></asp:Label>

                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1"><b>City</b></td>
                        <td>
                            <asp:Label ID="city" runat="server" Text="-"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Country</b></td>
                        <td>
                            <asp:Label ID="country" runat="server" Text="-"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Blog entries</b></td>
                        <td>
                            <asp:Label ID="blogentries" runat="server" Text="-"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Contact No</b></td>
                        <td>
                            <asp:Label ID="contactno" runat="server" Text="-"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Email</b></td>
                        <td>
                            <asp:Label ID="email" runat="server" Text="-"></asp:Label>

                        </td>
                    </tr>

                </table>
            </div>
            <div id="edit" runat="server" style="margin-bottom: 100px;">

                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style1"><b>First Name</b></td>
                        <td>
                            <asp:TextBox ID="firstnameedit" runat="server" CssClass="text_field" Width="60%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Last Name</b></td>
                        <td>
                            <asp:TextBox ID="lastnameedit" runat="server" CssClass="text_field" Width="60%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Occupation</b></td>
                        <td>

                            <asp:TextBox ID="occupationedit" runat="server" CssClass="text_field" Width="60%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>University</b></td>
                        <td>

                            <asp:TextBox ID="universityedit" runat="server" CssClass="text_field" Width="60%"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1"><b>City</b></td>
                        <td>

                            <asp:TextBox ID="cityedit" runat="server" CssClass="text_field" Width="60%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Country</b></td>
                        <td>

                            <asp:TextBox ID="countryedit" runat="server" CssClass="text_field" Width="60%"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1"><b>Contact No</b></td>
                        <td>
                            <asp:TextBox ID="contactnoedit" runat="server" CssClass="text_field" Width="60%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Email</b></td>
                        <td>
                            <asp:TextBox ID="emailedit" runat="server" CssClass="text_field" Width="60%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Old Password</b></td>
                        <td>
                            <asp:TextBox ID="oldpassword" runat="server" CssClass="text_field" Width="60%" TextMode="Password" placeholder=" Old Password must be provide to update." ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>New Password</b></td>
                        <td>
                            <asp:TextBox ID="passwordedit" runat="server" CssClass="text_field" Width="60%" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b>Update or Upload a picture</b></td>
                        <td>
                            <asp:FileUpload CssClass="text_field" Width="60%" ID="imageupload" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b></b></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Update" CssClass="text_field" OnClick="Button1_Click" Width="60%" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><b></b></td>
                        <td>
                            <asp:Label ID="wrong" runat="server" Text="Invalid Password" Visible="False" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>


                </table>
            </div>


        </div>
        <div>
        </div>

    </div>

</asp:Content>

