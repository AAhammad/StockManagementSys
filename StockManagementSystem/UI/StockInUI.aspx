<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="StockManagementSystem.UI.StockInUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 145px;
        }

        .auto-style2 {
            text-align: right;
            width: 592px;
        }
    </style>
    <style>
        Label.error {
            color: red;
            font-style: italic;
        }

        .auto-style4 {
            text-align: center;
        }

        .auto-style6 {
            width: 497px;
        }
        .auto-style7 {
            text-align: justify;
            width: 133px;
        }
    </style>
</head>
<body>
    <form id="stockInForm" runat="server">
        <p class="auto-style4">
            <br />
            <table style="width: 103%; margin-left: 2px; height: 185px;" align="center">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Company"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="companyDropDownList" name="companyDropDownList" runat="server" Height="26px" Width="142px" AutoPostBack="True" OnTextChanged="companyDropDownList_TextChanged">
                        </asp:DropDownList>
                    </td>

                    <td class="auto-style6">
                        <asp:Label ID="companySelectErrorMessageLabel" runat="server" ForeColor="#990000" Style="text-align: left"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Item"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="itemDropDownList" name="itemDropDownList" runat="server" AutoPostBack="True" Height="23px" OnTextChanged="itemDropDownList_TextChanged" Width="142px">
                        </asp:DropDownList>

                    </td>

                    <td class="auto-style6">
                        <asp:Label ID="itemSelectErrorMessageLabel" runat="server" ForeColor="#990000" Style="text-align: left"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Reorder Level"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="reoderLevelTextBox" name="reoderLevelTextBox" runat="server" Width="135px" ReadOnly="True"></asp:TextBox>
                    </td>

                    <td class="auto-style6">
                        <asp:Label ID="reorderLevelErrorMessageLabel" runat="server" ForeColor="#990000" Style="text-align: left"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Text="Available Quantity"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="avilableQuantityTextBox" name="avilableQuantityTextBox" runat="server" Width="136px" ReadOnly="True"></asp:TextBox>
                    </td>

                    <td class="auto-style6">
                        <asp:Label ID="availableQuantityErrorMessageLabel" runat="server" ForeColor="#990000" Style="text-align: left"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Text="Stock In Quantity"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="stockInQuantityTextBox" name="stockInQuantityTextBox" runat="server" Width="137px"></asp:TextBox>
                    </td>

                    <td class="auto-style6">
                        <asp:Label ID="stockInQuantityErrorMessageLabel" runat="server" ForeColor="#990000" Style="text-align: left"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>

                    <td class="auto-style1">&nbsp;</td>

                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;<asp:Button ID="stockInSaveButton" runat="server" OnClick="stockInSaveButton_Click" Text="Save" Width="60px" style="text-align: right" />
                    </td>

                    <td class="auto-style1">&nbsp;</td>

                </tr>
            </table>
            <asp:HiddenField ID="availableQuantityHiddenField" runat="server" />
            <asp:HiddenField ID="itemIdHiddenField" runat="server" />
            <p class="auto-style4">
                &nbsp;<div class="auto-style4">
                    <asp:Label ID="messageLabel" runat="server" ForeColor="#3333CC"></asp:Label>
                    <br style="text-align: left" />
                </div>
            </p>
    </form>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script>

        $(document).ready(function () {
            $("#stockInForm").validate({
                rules: {
                    companyDropDownList: "required",
                    itemDropDownList: "required",
                    reoderLevelTextBox: "required",
                    avilableQuantityTextBox: "required",
                    stockInQuantityTextBox: {
                        required: true,
                        digits: true,
                        maxlength: 9
                    }
                },
                messages: {
                    stockInQuantityTextBox: {
                        maxlength:"please enter no more than 9 digits"
        }
                }
            });
        });
    </script>
</body>
</html>
