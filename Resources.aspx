<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Resources.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 40%;
        }

        .auto-style2
        {
            width: 419px;
        }


        table.vitamins
        {
            margin: 20px 0 0 0;
            border-collapse: collapse;
            border-spacing: 0;
            background: #e6e6e6;
            color: #666666;
            border: 2px solid #bf1430;
        }

            table.vitamins th, table.vitamins td
            {
                text-align: center;
            }


            table.vitamins tbody
            {
                font-size: 1em;
                line-height: 15px;
            }

                table.vitamins tbody tr
                {
                    transition: background 0.6s, color 0.6s;
                }

                    table.vitamins tbody tr:nth-child(even)
                    {
                        background: rgba(255, 255, 255, 0.2);
                    }

                    table.vitamins tbody tr:hover
                    {
                        color: #000;
                        background: rgba(255, 255, 255, 0.7);
                        font-weight: 550;
                    }

                table.vitamins tbody td
                {
                    padding: 12px;
                }

                table.vitamins tbody tr:hover td:first-child
                {
                    background: #82adff;
                }

                table.vitamins tbody td:first-child
                {
                    text-align: left;
                    padding-left: 20px;
                    font-weight: 700;
                    background: rgba(109, 176, 231, 0.35);
                    transition: background 0.6s;
                }

            table.vitamins tfoot
            {
                font-size: 0.8em;
            }

                table.vitamins tfoot tr
                {
                    border-top: 2px solid #2e63e7;
                }

                table.vitamins tfoot td
                {
                    color: rgba(255,255,215,0.6);
                    text-align: left;
                    line-height: 15px;
                    padding: 15px 20px;
                }


        /* Mobile Layout */

        @media screen and (max-width: 400px)
        {
            h1
            {
                font-size: 34px;
                line-height: 36px;
                padding-left: 15px;
            }

            article
            {
                margin: 10px 15px;
            }

            table.vitamins
            {
                font-size: 0.8em;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="margin-left: 100px; margin-top: 100px; margin-bottom: 100px;">
        <table style="width: 90%;" class="vitamins">
            <tr>
                <td>Data Structure
                </td>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 40%;">STL</td>
                            <td>
                                <ul style="list-style: none;">
                                    <li><a href="https://sites.google.com/site/smilitude/stl" target="_blank">Fahim's vai blog</a></li>
                                    <li><a href="https://www.geeksforgeeks.org/cpp-stl-tutorial/" target="_blank">GeeksforGeeks</a></li>
                                </ul>
                            </td>
                        </tr>
                        <tr>

                            <td>Segment Tree</td>
                            <td>
                                <ul style="list-style: none;">
                                    <li><a href="http://www.shafaetsplanet.com/?p=1557" target="_blank">শাফায়েতের ব্লগ(part-1)</a></li>
                                    <li><a href="http://www.shafaetsplanet.com/?p=1591" target="_blank">শাফায়েতের ব্লগ(part-2)</a></li>
                                </ul>

                            </td>
                        </tr>
                        <tr>

                            <td>DSU</td>
                            <td>
                                <ul style="list-style: none;">
                                    <li><a href="http://www.shafaetsplanet.com/?p=763" target="_blank">শাফায়েতের ব্লগ</a></li>
                                    <li><a href="https://www.hackerearth.com/practice/notes/disjoint-set-union-union-find/" target="_blank">hackerearth</a></li>

                                </ul>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>



            <tr>
                <td>Mathematics</td>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 40%;">Number Theory</td>
                            <td>
                                <ul style="list-style: none;">

                                    <li><a href="http://www.progkriya.org/gyan/basic-number-theory.html" target="_blank">progkriya</a></li>
                                    <li><a href="https://forthright48.blogspot.com/p/cpps-101.html" target="_blank">forthright48</a></li>

                                </ul>
                            </td>
                        </tr>
                        <tr>

                            <td>Combinatorics</td>
                            <td>
                                <ul style="list-style: none;">
                                </ul>

                            </td>
                        </tr>
                        <tr>

                            <td>Probablity</td>
                            <td>
                                <ul style="list-style: none;">
                                    <li><a href="http://www.shafaetsplanet.com/?p=3060" target="_blank">শাফায়েতের ব্লগ</a></li>

                                </ul>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>Graph Theory
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td class="auto-style1">Breadth First Search</td>
                            <td class="auto-style2">
                                <ul style="list-style: none;">

                                    <li><a href="http://www.shafaetsplanet.com/?p=604" target="_blank">শাফায়েতের ব্লগ</a></li>

                                </ul>
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style1">Deapth First Search</td>
                            <td class="auto-style2">
                                <ul style="list-style: none;">

                                    <li><a href="http://www.shafaetsplanet.com/?p=973" target="_blank">শাফায়েতের ব্লগ</a></li>

                                </ul>
                            </td>

                        </tr>

                    </table>

                </td>
            </tr>
            <tr>
                <td>Dynamic Programming</td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 40%;">0/1 knapsack</td>
                            <td>
                                <ul style="list-style: none;">

                                    <li><a href="http://www.shafaetsplanet.com/?p=1072" target="_blank">শাফায়েতের ব্লগ</a></li>

                                </ul>
                            </td>

                        </tr>
                        <tr>
                            <td>LIS</td>
                            <td>
                                <ul style="list-style: none;">

                                    <li><a href="http://www.lightoj.com/article_show.php?article=1000" target="_blank">Jane Alam jan</a></li>

                                </ul>
                            </td>

                        </tr>

                    </table>

                </td>
            </tr>


        </table>
    </div>
</asp:Content>

