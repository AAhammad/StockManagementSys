<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/MasterPageUI.Master" CodeBehind="CategorySetupUI.aspx.cs" Inherits="StockManagementSystem.UI.CategorySetupUI" %>


 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title></title>
    <style type="text/css">
        .auto-style3 {
            height: 31px;
            text-align: right;
        }
        .auto-style4 {
            text-align: right;
        }
        .auto-style5 {
            height: 31px;
            width: 140px;
            text-align: right;
        }
        .auto-style6 {
            width: 140px;
            text-align: right;
        }
        .auto-style7 {
            text-align: center;
            width: 1001px;
            height: 442px;
        }
        .auto-style8 {
            text-align: center;
            margin-left: 200px;
        }
    </style>
    
    <style>
        Label.error {
            color: red;
            font-style: italic; 
        }
        .auto-style9 {
            height: 31px;
            width: 255px;
            text-align: left;
        }
        .auto-style10 {
            width: 255px;
            text-align: right;
        }
        .auto-style11 {
            width: 255px;
            text-align: left;
        }
    </style>
 <%--     <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>--%>
    <script>
        $(document).ready(function () {

            $("#form1").validate({
                rules: {
                    <%= categoryNameTextBox.UniqueID %> : {
                        required: true,
                        maxlength: 49
                    }

                },
                messages: {
                    <%= categoryNameTextBox.UniqueID %> : {
                        required: "Please enter your Category Name",
                        maxlength: "please enter no more than 49 characters"
                    }

                }
            });
        });
    </script>
     
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <fieldset >
        <hr/>
       <h2 style="text-align: center">Add and View Category</h2> 
        <hr/>
 
    <div class="auto-style7">
    
        <div class="auto-style8">
    
    
        <br />
        <br />
        <br />
        </div>
        <table style="width: 89%; margin-left: 0px; height: 96px;">
            <tr>
                <td class="auto-style3">
    
        <asp:Label ID="Label1" for="categoryNameTextBox" runat="server" Text="Name"></asp:Label>
                </td>
                <td class="auto-style5">
        <asp:TextBox ID="categoryNameTextBox" name="categoryNameTextBox" runat="server" Height="20px" Width="143px"></asp:TextBox>
    
                </td>
                
                <td class="auto-style9">
                    <asp:Label ID="nameErrorMessageLabel" runat="server" ForeColor="#990000" style="text-align: left"></asp:Label>
    
                </td>
                
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
               
                <td class="auto-style11">&nbsp;</td>
               
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="updateButton" runat="server" OnClick="updateButton_Click1" Text="Update" />
        <asp:Button ID="categorySaveButton" runat="server" style="margin-left: 0" Text="Save" Width="59px" OnClick="categorySaveButton_Click" />
                </td>
               
                <td class="auto-style10">
                    &nbsp;</td>
               
            </tr>
         
        </table>
        <div class="auto-style8">
            <br />
        </div>
        <div class="auto-style7">
    
           
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="categoryMessageLabel" runat="server" style="text-align: center" ForeColor="#CC0000"></asp:Label>
                <br />
            <br />
            <asp:GridView ID="categorySetupGridView" runat="server" AutoGenerateColumns="False" style="margin-left: 451px; text-align: center;">
                <Columns>
                 <asp:TemplateField HeaderText="SL" >
                   <ItemTemplate >
                       <asp:Label ID="Label3" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Name">
                   <ItemTemplate>
                       <asp:Label ID="Label2" runat="server" Text='<%#Eval("CategoryName") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
                       <asp:TemplateField>
                   <ItemTemplate>
                       <asp:LinkButton ID="updateLinkButton" runat="server" CommandArgument='<%#Eval("CategoryId") %>' OnClick="updateLink_OnClick">Update</asp:LinkButton>
                   </ItemTemplate>
               </asp:TemplateField>
                
            </Columns>
                
            </asp:GridView>
    
                <asp:HiddenField ID="categoryIdHiddenField" runat="server" />
    
    </div>         
    </div>
    

       
   </fieldset>
    </asp:Content>