<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalesBetweenTwoDateUI.aspx.cs" Inherits="StockManagementSystem.UI.ViewSalesBetweenTwoDateUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-align: right;
            width: 446px;
        }
    </style>
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/demos/style.css">
    <style>
        Label.error {
            color: red;
            font-style: italic;
        }

        .auto-style5 {
            text-align: right;
            width: 175px;
        }

        .auto-style7 {
            text-align: left;
            width: 446px;
        }

        .auto-style8 {
            text-align: right;
            width: 349px;
        }
    </style>
</head>
<body>
     <hr/>
       <h2 style="text-align: center">View Sales between two date</h2> 
        <hr/>
    <form id="viewSalesForm" runat="server">
        <div>

            <br />
            <table style="margin-left: 227px;">
                <tr>
                    <td class="auto-style8">
                        <asp:Label ID="Label1" runat="server" Text="From Date"></asp:Label>
                    </td>
                    <td class="auto-style5">


                        <asp:TextBox ID="fromDateTextBox" name="fromDateTextBox" runat="server" Width="160px"></asp:TextBox>
                        </td>

                         <td class="auto-style7">


                    <asp:Label ID="fromDateErrorMessageLabel" runat="server" ForeColor="#990000"></asp:Label>
                </td>
                </tr>
               

                
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label2" runat="server" Text="To Date"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="toDateTextBox" name="toDateTextBox" runat="server" Width="161px"></asp:TextBox>
                </td>

                <td class="auto-style7">
                    <asp:Label ID="toDateErrorMessageLabel" runat="server" ForeColor="#990000"></asp:Label>
                </td>

            </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button ID="viewSalesSearchButton" runat="server" Text="Search" OnClick="viewSalesSearchButton_Click" />
                    </td>

                    <td class="auto-style2">&nbsp;</td>

                </tr>
            </table>

        </div>
        <div style="margin-left: 440px">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="messageLabel" runat="server" ForeColor="#990000" Style="text-align: center"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;
        </div>

        <asp:GridView ID="salesSummaryGridView" runat="server" AutoGenerateColumns="False" Height="138px" Style="margin-left: 364px; text-align: center;" Width="585px" CellPadding="4" ForeColor="#333333" GridLines="None">

            <AlternatingRowStyle BackColor="White" />

            <Columns>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("ItemName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Sale Quantity">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("StockOutQuantity")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </form>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script>
        //$(function () {


        //});

        $(document).ready(function () {
            $("#fromDateTextBox").datepicker({
                changeMonth: true,
                changeYear: true,
                showAnim: "clip",
                dateFormat: "dd-MM-yy",
                //minDate: new Date(1990, 1, 1),
                //maxDate: new Date(2090,1,1),
                showWeek: true,
                firstDay: 1
            });
            $("#toDateTextBox").datepicker({
                changeMonth: true,
                changeYear: true,
                showAnim: "clip",
                dateFormat: "dd-MM-yy",
                showWeek: true,
                firstDay: 1

            });

            $("#viewSalesForm").validate({
                rules: {
                    fromDateTextBox: "required",

                    toDateTextBox: "required"

                },
                messages: {

                }
            });

        });

    </script>
</body>
</html>
