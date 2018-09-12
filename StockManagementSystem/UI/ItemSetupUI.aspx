<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Index.Master" CodeBehind="ItemSetupUI.aspx.cs" Inherits="StockManagementSystem.UI.ItemSetupUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   


    <div>
    
        <br />
    
        <table style="width:100%; margin-left: 188px;">
            <tr>
                <td class="auto-style1">
        <asp:Label ID="Label1" runat="server" Text=" Category"></asp:Label>
                </td>
                <td class="auto-style2">
        <asp:DropDownList ID="categoryDropDownList" runat="server" Width="157px">
        </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
            <asp:Label ID="Label2" runat="server" Text="Company"></asp:Label>
                </td>
                <td class="auto-style2">

            
        <asp:DropDownList ID="companyDropDownList" runat="server" Width="157px">
        </asp:DropDownList>

            
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
            <asp:Label ID="Label3" runat="server" Text="Item Name"></asp:Label>
                </td>
                <td class="auto-style2">
            <asp:TextBox ID="itemNameTextBox" runat="server" Width="152px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
            <asp:Label ID="Label4" runat="server" Text="Reorder Label"></asp:Label>
                </td>
                <td class="auto-style2">
            <asp:TextBox ID="reorderTextBox" runat="server" Width="151px">0</asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
        <asp:Button ID="ItemSaveButton" runat="server" Text="Save" Width="55px" OnClick="ItemSaveButton_Click" />
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
            <asp:Label ID="messageLabel" runat="server" style="text-align: center"></asp:Label>
        <br />

        </div>

</asp:Content>