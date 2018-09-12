<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Index.Master"  CodeBehind="SearchAndViewItemsSummaryUI.aspx.cs" Inherits="StockManagementSystem.UI.SearchAndViewItemsSummaryUI" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    
        <br />
        <table style="width:53%; height: 83px;">
            <tr>
                <td class="auto-style2">
            <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="companyDropDownList" runat="server" Height="23px">
                    </asp:DropDownList>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style2">
            <asp:Label ID="Label2" runat="server" Text="Category"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="categoryDropDownList" runat="server" Height="23px" style="margin-left: 0px">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
            <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />
                </td>
                
            </tr>
        </table>
    
        <br />
    
    </div>
        <div style="margin-left: 120px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
       
        <asp:GridView ID="itemSummaryGridView" runat="server" AutoGenerateColumns="False" Height="142px" style="margin-left: 226px; text-align: center;" Width="647px">
            
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
                  <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("CategoryName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Available Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("AvailableQuantity")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField HeaderText="Reorder Level">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("ReorderLevel")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
        </asp:GridView>
</asp:Content>