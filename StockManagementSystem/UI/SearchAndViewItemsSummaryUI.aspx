<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchAndViewItemsSummaryUI.aspx.cs" Inherits="StockManagementSystem.UI.SearchAndViewItemsSummaryUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-align: right;
            width: 1018px;
        }
        .auto-style3 {
            text-align: right;
            width: 140px;
        }
    </style>
    <%-- <style>
        Label.error {
            color: red;
            font-style: italic;
        }
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <table style="width:53%; height: 83px;">
            <tr>
                <td class="auto-style2">
            <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="companyDropDownList" name="companyDropDownList" runat="server" Height="23px">
                    </asp:DropDownList>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style2">
            <asp:Label ID="Label2" runat="server" Text="Category"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="categoryDropDownList" name="categoryDropDownList" runat="server" Height="23px" style="margin-left: 0px">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="searchButton" runat="server" OnClick="searchButton_Click" Text="Search" />
                </td>
                
            </tr>
        </table>
    
        <br />
    
    </div>
        <div style="margin-left: 120px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="messageLabel" runat="server" Font-Overline="False" ForeColor="#990000" style="text-align: center"></asp:Label>
            <br />
            </div>
       
        <asp:GridView ID="itemSummaryGridView" runat="server" AutoGenerateColumns="False" Height="142px" style="margin-left: 286px; text-align: center;" Width="647px" CellPadding="4" ForeColor="#333333" GridLines="None">
            
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
    <%--<script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script>

        $(document).ready(function () {
            $("#stockInForm").validate({
                rules: {
                    companyDropDownList: "required",
                    categoryDropDownList: "required"
                    
                },
                messages: {

                }
            });
        });
    </script>--%>
</body>
</html>
