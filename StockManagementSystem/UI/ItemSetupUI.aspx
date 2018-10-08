<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/MasterPageUI.Master" CodeBehind="ItemSetupUI.aspx.cs" Inherits="StockManagementSystem.UI.ItemSetupUI" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 420px;
        }

        .auto-style2 {
            text-align: right;
            width: 163px;
        }

        .auto-style3 {
            text-align: center;
        }
    </style>
    <style>
        Label.error {
            color: red;
            font-style: italic;
        }
        .auto-style4 {
            text-align: right;
            width: 420px;
            height: 29px;
        }
        .auto-style5 {
            text-align: right;
            width: 163px;
            height: 29px;
        }
        .auto-style6 {
            height: 29px;
        }
    </style>
     <script>
         $(document).ready(function () {
             $("#form1").validate({
                 rules: {
                     categoryDropDownList: "required",

                     companyDropDownList: "required",

                     itemNameTextBox: {
                         required: true,
                         maxlength: 49
                     },

                     reorderTextBox: {
                         required: true,
                         digits: true,
                         maxlength: 9
                     }

                 },
                 messages: {
                     reorderTextBox: {
                         maxlength: "Please enter no more than 9 digits.	"
                     }
                 }
             });

         });

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">

   
        <div>
            <hr/>
       <h2 style="text-align: center">Item Setup</h2> 
        <hr/>
            <br />

            <table style="width: 100%; margin-left: 36px;" align="center">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" for="categoryDropDownList" runat="server" Text=" Category"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="categoryDropDownList" name="categoryDropDownList" runat="server" Width="157px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="categorySelectErrorMesseageLabel" runat="server" ForeColor="#990000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" for="companyDropDownList" runat="server" Text="Company"></asp:Label>
                    </td>
                    <td class="auto-style2">


                        <asp:DropDownList ID="companyDropDownList" name="companyDropDownList" runat="server" Width="157px">
                        </asp:DropDownList>


                    </td>
                    <td>
                        <asp:Label ID="companySelectErrorMesseage" runat="server" ForeColor="#990000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label3" for="itemNameTextBox" runat="server" Text="Item Name"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="itemNameTextBox" name="itemNameTextBox" runat="server" Width="152px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="itemNameErrorMessageLabel" runat="server" ForeColor="#990000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label4" runat="server" Text="Reorder Level"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="reorderTextBox" name="reorderTextBox" runat="server" Width="151px">0</asp:TextBox>
                    </td>
                    <td class="auto-style6">
                        <asp:Label ID="reorderLevelErrorMessageLabel" runat="server" ForeColor="#990000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="itemSaveButton" runat="server" OnClick="itemSaveButton_Click" Text="Save" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
        <div class="auto-style3">
            <asp:Label ID="messageLabel" runat="server" ForeColor="#990000"></asp:Label>
            <br />

        </div>


   
   
</asp:Content>