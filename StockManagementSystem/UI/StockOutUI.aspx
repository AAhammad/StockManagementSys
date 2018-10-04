<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystem.UI.StockOutUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        
        .auto-style2 {
            text-align: left;
            width: 2234px;
        }

        .auto-style4 {
            text-align: left;
            height: 26px;
            width: 2234px;
        }

        .auto-style7 {
            width: 680px;
            height: 160px;
        }

        .auto-style10 {
            text-align: justify;
            margin-left: 180px;
            width: 596px;
        }
    </style>
    <style>
        Label.error {
            color: red;
            font-style: italic;
        }
        .auto-style26 {
            text-align: left;
            height: 42px;
            width: 2815px;
        }
        .auto-style27 {
            text-align: right;
            height: 26px;
            width: 277px;
        }
        .auto-style28 {
            text-align: right;
            width: 277px;
        }
        .auto-style29 {
            text-align: right;
            width: 277px;
            height: 42px;
        }
        .auto-style31 {
            text-align: right;
            height: 26px;
            width: 5548px;
        }
        .auto-style32 {
            text-align: right;
            width: 5548px;
        }
        .auto-style33 {
            text-align: right;
            width: 5548px;
            height: 42px;
        }
        .auto-style34 {
            width: 5548px;
        }
        .auto-style35 {
            margin-left: 253px;
        }
        </style>
</head>
<body style="text-align: center">
    <form id="stockOutForm" runat="server">
        <table align="left" class="auto-style7" style="margin-right: 146px; height: 170px; width: 816px; margin-left: 166px;">
            <tr>
                <td class="auto-style31">
                    <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
                </td>
                <td class="auto-style27">
                    <asp:DropDownList ID="companyDropDownList" name="companyDropDownList" runat="server" Height="22px" Width="143px" Style="margin-left: 0px" AutoPostBack="True" OnTextChanged="companyDropDownList_TextChanged">
                    </asp:DropDownList>
                </td>

                <td class="auto-style4">
                        <asp:Label ID="companySelectErrorMessageLabel" runat="server" ForeColor="#990000" style="text-align: left"></asp:Label>
                </td>

            </tr>
            <tr>
                <td class="auto-style32">
                    <asp:Label ID="Label2" runat="server" Text="Item"></asp:Label>
                </td>
                <td class="auto-style28">
                    <asp:DropDownList ID="itemDropDownList" name="itemDropDownList" runat="server" Height="23px" Width="143px" Style="margin-left: 0px" AutoPostBack="True" OnTextChanged="itemDropDownList_TextChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style2">
                        <asp:Label ID="itemSelectErrorMessageLabel" runat="server" ForeColor="#990000" Style="text-align: left"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style31">
                    <asp:Label ID="Label3" runat="server" Text="Reorder Level"></asp:Label>
                </td>
                <td class="auto-style27">
                    <asp:TextBox ID="reorderLevelTextBox" name="availableQuantityTextBox" runat="server" Width="143px" ReadOnly="True" Height="22px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                        <asp:Label ID="reorderLevelErrorMessageLabel" runat="server" ForeColor="#990000" Style="text-align: left"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style33">
                    <asp:Label ID="Label4" runat="server" Text="Available Quantity"></asp:Label>
                </td>
                <td class="auto-style29">
                    <asp:TextBox ID="availableQuantityTextBox" name="availableQuantityTextBox" runat="server" Width="143px" ReadOnly="True" Height="22px"></asp:TextBox>
                </td>
                <td class="auto-style26">
                        <asp:Label ID="availableQuantityErrorMessageLabel" runat="server" ForeColor="#990000" Style="text-align: left"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style32">
                    <asp:Label ID="Label5" runat="server" Text="Stock Out Quantity"></asp:Label>
                </td>
                <td class="auto-style29">
                    &nbsp;<asp:TextBox ID="stockOutQuantityTextBox" name="availableQuantityTextBox" runat="server" Width="143px" Height="22px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                        <asp:Label ID="stockOutQuantityErrorMessageLabel" runat="server" ForeColor="#990000" Style="text-align: left"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style34">&nbsp;</td>
                <td class="auto-style28">
                    <asp:Button ID="addButton" runat="server" Style="text-align: right" Text="Add" Width="60px" Height="26px" OnClick="addButton_Click" />
                </td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
        </table>

        <br />

        <div style="margin-left: 240px; " class="auto-style35">

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <br />

            <asp:GridView ID="stockOutGridView" runat="server" AutoGenerateColumns="False" Height="141px" Style="margin-left: 229px; text-align: center;" Width="391px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                    <asp:TemplateField HeaderText="Company">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("CompanyName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
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

            <div class="auto-style10">

            <br />

           
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

           
            &nbsp;<asp:Button ID="sellButton" runat="server" Text="Sell" OnClick="sellButton_Click" style="margin-left: 0px" Width="70px" />
                &nbsp;&nbsp;
            <asp:Button ID="damageButton" runat="server" Text="Damage" OnClick="damageButton_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="lostButton" runat="server" Text="Lost" Width="68px" OnClick="lostButton_Click" />
            &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="messageLabel" runat="server" style="text-align: justify" ForeColor="#990000"></asp:Label>
            </div>
            <asp:HiddenField ID="availableQuantityHiddenField" runat="server" />
            <asp:HiddenField ID="itemIdHiddenField" runat="server" />
        </div>
    </form>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/jquery.validate.js"></script>
    <%--<script>
        $(document).ready(function() {
            $("#stockOutForm").validate({
                rules: {
                    companyDropDownList: "required",
                    itemDropDownList: "required",
                    reorderLevelTextBox: "required",
                    availableQuantityTextBox: "required",
                    stockOutQuantityTextBox: {
                        required: true,
                        digits: true
        }
                },
                messages: {
                    
                }
            });
        });
    </script>--%>
</body>
</html>
