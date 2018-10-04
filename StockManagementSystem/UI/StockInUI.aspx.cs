using System;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Models;

namespace StockManagementSystem.UI
{
    public partial class StockInUI : System.Web.UI.Page
    { 
        CompanyManager aCompanyManager=new CompanyManager();
        ItemManager aItemManager=new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            messageLabel.Text = string.Empty;
            
         
            
            if (!IsPostBack)
            {
                companyDropDownList.DataSource = aCompanyManager.GetAllCompanyInfo();
                companyDropDownList.DataTextField = "CompanyName";
                companyDropDownList.DataValueField = "CompanyId";
                companyDropDownList.DataBind();
                ListItem seletedItemCom=new ListItem("Select Company","");
                companyDropDownList.Items.Insert(0,seletedItemCom);
             
 
                itemDropDownList.Enabled = false;

            }

            

        }

        private bool Validation()
        {
            bool retn = true;
            if (string.IsNullOrEmpty(itemDropDownList.SelectedValue))
            {
                retn = false;
                itemSelectErrorMessageLabel.Text = "Please select a Item";

            }
            else
            {
                itemSelectErrorMessageLabel.Text = String.Empty;
            }
            if (string.IsNullOrEmpty(companyDropDownList.SelectedValue))
            {
                retn = false;
                companySelectErrorMessageLabel.Text = "Please select a Company";
            }
            else
            {
                companySelectErrorMessageLabel.Text = String.Empty;
            }
            //if (string.IsNullOrEmpty(reoderLevelTextBox.Text))
            //{
            //    retn = false;
            //    reorderLevelErrorMessageLabel.Text = "Reorder Level is Required";
            //}
            //else
            //{
            //    reorderLevelErrorMessageLabel.Text = string.Empty;
            //}
            //if (string.IsNullOrEmpty(avilableQuantityTextBox.Text))
            //{
            //    retn = false;
            //    availableQuantityErrorMessageLabel.Text = "Available Quantity is Required";
            //}
            //else
            //{
            //    availableQuantityErrorMessageLabel.Text = string.Empty;
            //}
            int n;
            if (string.IsNullOrEmpty(stockInQuantityTextBox.Text.Trim()))
            {
                retn = false;
                stockInQuantityErrorMessageLabel.Text = "Please enter a Stock Quantity";
            }
            else if (stockInQuantityTextBox.Text.Trim().Length > 9)
            {
                retn = false;
                stockInQuantityErrorMessageLabel.Text = "Please enter no more than 9 digits";
            }
            else if (!int.TryParse(stockInQuantityTextBox.Text.Trim(), out n))
            {
                retn = false;
                stockInQuantityErrorMessageLabel.Text = "Please enter a integer value";

            }
           
            else
            {
                stockInQuantityErrorMessageLabel.Text = "";
            }
            //else if (!Microsoft.VisualBasic.Information.IsNumeric(reorderTextBox.Text))// internally use double.tryparse()
            //{
            //    retn = false;
            //    reorderLevelErrorMessageLabel.Text = "Please enter a numeric value";

            //}

            return retn;
        }
        protected void stockInSaveButton_Click(object sender, EventArgs e)
        {

            if (Validation())
            {


                int itemId = Convert.ToInt32(itemIdHiddenField.Value);
                int availableQuantity = Convert.ToInt32(availableQuantityHiddenField.Value) +
                                        Convert.ToInt32(stockInQuantityTextBox.Text.Trim());

                if (aItemManager.UpdateAvailabelQuantity(itemId, availableQuantity))
                {
                    messageLabel.Text = "saved";

                    stockInQuantityTextBox.Text = String.Empty;

                    itemIdHiddenField.Value = null;
                    availableQuantityHiddenField.Value = string.Empty;
                    companyDropDownList.SelectedIndex = 0;
                    itemDropDownList.SelectedIndex = 0;
                    itemDropDownList.Enabled = false;
                    reoderLevelTextBox.Text = String.Empty;
                    avilableQuantityTextBox.Text = String.Empty;
                }
                else
                {
                    messageLabel.Text = "not saved";
                }


            }


        }

       

        protected void companyDropDownList_TextChanged(object sender, EventArgs e)
        {
            if (companyDropDownList.SelectedIndex == 0)
            {
               
                itemDropDownList.Enabled = false;
            }
            else
            {
                itemDropDownList.Enabled = true;

                itemDropDownList.DataSource = aItemManager.GetAllItemsInfoUnderCompany(Convert.ToInt32(companyDropDownList.SelectedValue));
                itemDropDownList.DataTextField = "ItemName";
                itemDropDownList.DataValueField = "ItemId";
                itemDropDownList.DataBind();

                ListItem seletedItemItems = new ListItem("Select Item", "");
                itemDropDownList.Items.Insert(0, seletedItemItems);

            }
           

            
        }

        protected void itemDropDownList_TextChanged(object sender, EventArgs e)
        {

            Item aItem = new Item();
            if (itemDropDownList.SelectedIndex == 0)
            {
                reoderLevelTextBox.Text =String.Empty;
                avilableQuantityTextBox.Text =String.Empty;
            }
            else
            {
                aItem = aItemManager.GetItemInfo(Convert.ToInt32(itemDropDownList.SelectedValue));

                reoderLevelTextBox.Text = aItem.ReorderLevel.ToString();
                avilableQuantityTextBox.Text = aItem.AvailableQuantity.ToString();

                itemIdHiddenField.Value = aItem.ItemId.ToString();
                availableQuantityHiddenField.Value = aItem.AvailableQuantity.ToString();
            }
          
        }


       

       

     

       

        
    }
}