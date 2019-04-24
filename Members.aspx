<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Members.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .promo
        {
            width: 250px;
            background: #0F1012;
            color: #f9f9f9;
            float: left;
            margin-left: 50px;
            margin-top: 50px;
        }
            .promo:hover
            {
                background:#333333;
                opacity:0.8;
                border-radius:7px;
                box-shadow:0 0 15px 1px rgba(0,0,0,0.4);
            }

        .deal
        {
            padding: 10px 0 0 0;
        }

            .deal span
            {
                display: block;
                text-align: center;
            }

                .deal span:first-of-type
                {
                    font-size: 23px;
                }

                .deal span:last-of-type
                {
                    font-size: 13px;
                }

        .promo .price
        {
            display: block;
            width: 250px;
            background: #292b2e;
            margin: 15px 0 10px 0;
            text-align: center;
            font-size: 23px;
            padding: 17px 0 17px 0;
        }

        ul
        {
            display: block;
            margin: 20px 0 10px 0;
            padding: 0;
            list-style-type: none;
            text-align: center;
            color: #999999;
        }

        li
        {
            display: block;
            margin: 10px 0 0 0;
        }

        .scale
        {
            transform: scale(1.2);
            box-shadow: 0 0 4px 1px rgba(20, 20, 20, 0.8);
        }

            .scale button
            {
                background: #64AAA4;
            }

            .scale .price
            {
                color: #64AAA4;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table id="demo" style="margin-left:14%;margin-bottom:10%;"></table>
        <script>

            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    myFunction(this);
                }
            };
            xmlhttp.open("GET", "membersxml.xml", true);
            xmlhttp.send();

            function myFunction(xml) {
                var i;
                var xmlDoc = xml.responseXML;
                var x = xmlDoc.getElementsByTagName("Members");
                var table = "";
                for (i = 0; i < x.length; i++) {
                    table += "<div class='promo'><div class='deal'><span>" +
                    x[i].getElementsByTagName("Designation")[0].childNodes[0].nodeValue +
                    "</span></div><span class='price'>" +
                    x[i].getElementsByTagName("Name")[0].childNodes[0].nodeValue +
                    "</span><ul class='features'>" +
                    "<li>" + x[i].getElementsByTagName("Department")[0].childNodes[0].nodeValue + "</li>" +
                    "<li>" + x[i].getElementsByTagName("Roll")[0].childNodes[0].nodeValue + "</li>" +
                    "<li>" + x[i].getElementsByTagName("Batch")[0].childNodes[0].nodeValue + "</li>";
                    table += "</ul></div>"
                    if (i % 3 == 0 && i!=0) table += "<br/>";
                }

                document.getElementById("demo").innerHTML = table;
            }
        </script>


</asp:Content>

