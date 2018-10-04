<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanySetupUI.aspx.cs" Inherits="StockManagementSystem.UI.CompanySetupUI1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 242px;
        }
        .auto-style2 {
            text-align: right;
            width: 1136px;
        }
        .auto-style5 {
            text-align: right;
            width: 1136px;
            height: 36px;
        }
        .auto-style6 {
            text-align: right;
            width: 242px;
            height: 36px;
        }
    </style>

    <style>
        Label.error {
            color: red;
            font-style: italic;
        }
        .auto-style7 {
            text-align: left;
            width: 712px;
        }
        .auto-style8 {
            text-align: left;
            width: 712px;
            height: 36px;
        }
    </style>
</head>
<body>
<hr/>
<h2 style="text-align: center">Add Company</h2>
<hr/>
    <form id="companyForm" runat="server">
    <div style="height: 365px; width: 961px; text-align: center;">
        <br />
        <br />
    <table style="width:69%; height: 53px; margin-left: 234px;">
            <tr>
                <td class="auto-style2">
        <asp:Label ID="Label1" for="companyNameTextBox" runat="server" Text="Name"></asp:Label>
                </td>
                <td class="auto-style1">
        <asp:TextBox ID="companyNameTextBox" name="companyNameTextBox" runat="server" Width="161px"></asp:TextBox>
                </td>
              
                <td class="auto-style7">
                    <asp:Label ID="nameErrorMessageLabel" runat="server" ForeColor="#990000" style="text-align: left"></asp:Label>
                </td>
              
            </tr>
           
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">
        <asp:Button ID="companySaveButton" runat="server" Text="Save" Width="66px" OnClick="companySaveButton_Click" />
                </td>
                
                <td class="auto-style8">
                    &nbsp;</td>
                
            </tr>
        </table>
        
        
           <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="messageLabel" runat="server" ForeColor="#990000"></asp:Label>
        <br />
        <br />
        
        
           <br />

      
        <asp:GridView ID="companyInfoGridView" runat="server" AutoGenerateColumns="False" style="margin-left: 484px; text-align: center;" Height="200px" HorizontalAlign="Center" Width="297px">
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
    </form>
     <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function () {

            $("#companyForm").validate({
                rules: {
                    companyNameTextBox: {
                        required: true,
                        maxlength: 49
                    }

                },
                messages: {
                    companyNameTextBox: {
                        required:"Please enter Company Name",
                        maxlength:"please enter no more than 49 characters"
                    } 

                }
            });
        });
    </script>
</body>
</html>
