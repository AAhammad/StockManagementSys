<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUI.aspx.cs" Inherits="StockManagementSystem.UI.LoginUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            margin-left: 240px;
        }

        .auto-style2 {
            text-align: center;
            width: 433px;
        }

        .auto-style3 {
            text-align: right;
            width: 433px;
        }

        .auto-style4 {
            text-align: left;
        }

        .auto-style5 {
            width: 128px;
        }

        .auto-style6 {
            text-align: right;
            width: 433px;
            height: 26px;
        }

        .auto-style7 {
            width: 128px;
            height: 26px;
        }

        .auto-style8 {
            text-align: left;
            height: 26px;
        }
    </style>
    <style>
        Label.error {
            color: red;
            font-style: italic;
        }
    </style>
</head>
<body>
    <form id="loginForm" runat="server">
        <div>

            <br />
            <br />

            <table style="width: 100%; margin-left: 93px;">
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="userNameTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="userNameErrorMessageLabel" runat="server" ForeColor="#990000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="passwordErrorMessageLabel" runat="server" ForeColor="#990000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button ID="logInButton" runat="server" OnClick="logInButton_Click" Text="LogIn" />
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
            </table>

            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="messageLabel" runat="server" Style="text-align: center" ForeColor="#990000"></asp:Label>

        </div>
    </form>

    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script>

        $(document).ready(function () {
            $("#loginForm").validate({
                rules: {

                    userNameTextBox: {
                        required: true,
                        maxlength: 49
                    },
                    passwordTextBox: {
                        required: true,
                        maxlength: 49
                    }

                },
                messages: {

                }
            });
        });
    </script>
</body>
</html>
