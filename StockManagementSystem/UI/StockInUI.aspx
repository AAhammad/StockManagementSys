<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Index.Master" CodeBehind="StockInUI.aspx.cs" Inherits="StockManagementSystem.UI.StockInUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <br />
        <table style="width:30%; margin-left: 326px; height: 185px;" >
            <tr>
                <td class="auto-style2">
            <asp:Label ID="Label2" runat="server" Text="Company"></asp:Label>
                </td>
                <td class="auto-style1">
            <asp:DropDownList ID="companyDropDownList" runat="server" Height="26px" Width="142px" AutoPostBack="True" OnTextChanged="companyDropDownList_TextChanged">
              

            </asp:DropDownList>
                </td>
              
            </tr>
            <tr>
                <td class="auto-style2">
        <asp:Label ID="Label3" runat="server" Text="Item"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="itemDropDownList" runat="server" AutoPostBack="True" Height="23px" OnTextChanged="itemDropDownList_TextChanged" Width="142px">
                    </asp:DropDownList>
    
                </td>
             
            </tr>
            <tr>
                <td class="auto-style2">
        <asp:Label ID="Label4" runat="server" Text="Reorder Lavel"></asp:Label>
                </td>
                <td class="auto-style1">
        <asp:TextBox ID="reoderLevelTextBox" runat="server" Width="135px" ReadOnly="True"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style2">
            <asp:Label ID="Label5" runat="server" Text="Available Quantity"></asp:Label>
                </td>
                <td class="auto-style1">
            <asp:TextBox ID="avilableQuantityTextBox" runat="server" Width="136px" ReadOnly="True"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td class="auto-style2">
            <asp:Label ID="Label6" runat="server" Text="Stock In Quantity"></asp:Label>
                </td>
                <td class="auto-style1">
            <asp:TextBox ID="stockInQuantityTextBox" runat="server" Width="137px"></asp:TextBox>
                </td>
              
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
            <asp:Button ID="stockInSaveButton" runat="server" OnClick="stockInSaveButton_Click" Text="Save" Width="60px" />
                </td>
                
            </tr>
        </table>
        <asp:HiddenField ID="availableQuantityHiddenField" runat="server" />
        <asp:HiddenField ID="itemIdHiddenField" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="messageLabel" runat="server" style="text-align: center"></asp:Label>
        <br />
    </>
       
   
   </asp:Content>