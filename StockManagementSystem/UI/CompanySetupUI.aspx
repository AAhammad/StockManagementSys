<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Index.Master" CodeBehind="CompanySetupUI.aspx.cs" Inherits="StockManagementSystem.UI.CompanySetupUI1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 365px; width: 961px; text-align: center;">
    <table style="width:32%; height: 98px; margin-left: 390px;">
            <tr>
                <td class="auto-style2">
        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                </td>
                <td class="auto-style1">
        <asp:TextBox ID="companyNameTextBox" runat="server" Width="187px"></asp:TextBox>
                </td>
              
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4"></td>
             
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">
        <asp:Button ID="companySaveButton" runat="server" Text="Save" Width="66px" OnClick="companySaveButton_Click" />
                </td>
                
            </tr>
        </table>
        
          <asp:Label ID="messageLabel" runat="server" ForeColor="#990000"></asp:Label>
        <br />
        <br />
        
        
           <br />

      
        <asp:GridView ID="companyInfoGridView" runat="server" AutoGenerateColumns="False" style="margin-left: 434px; text-align: center;" Height="200px" HorizontalAlign="Center" Width="297px">
            <Columns>
                 <asp:TemplateField HeaderText="SL" >
                   <ItemTemplate >
                       <asp:Label ID="Label3" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Name">
                   <ItemTemplate>
                       <asp:Label ID="Label2" runat="server" Text='<%#Eval("CompanyName") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
                
            </Columns>
        </asp:GridView>

      
    </div>
  </asp:Content>