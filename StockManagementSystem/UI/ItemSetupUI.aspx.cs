using System;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Models;
using Microsoft.VisualBasic;
namespace StockManagementSystem.UI
{
    public partial class ItemSetupUI : System.Web.UI.Page
    {
        CategoryManager aCategoryManager=new CategoryManager();
        CompanyManager aCompanyManager = new CompanyManager();
         Item aItem = new Item();
        ItemManager aItemManager=new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                categoryDropDownList.DataSource = aCategoryManager.GetAllCategoriesInfo();
                categoryDropDownList.DataTextField = "CategoryName";
                categoryDropDownList.DataValueField = "CategoryId";
                categoryDropDownList.DataBind();
                ListItem seletedItemCat = new ListItem("Select Category", "");
                categoryDropDownList.Items.Insert(0, seletedItemCat);
             

                companyDropDownList.DataSource = aCompanyManager.GetAllCompanyInfo();
                companyDropDownList.DataTextField = "CompanyName";
                companyDropDownList.DataValueField = "CompanyId";
                companyDropDownList.DataBind();
                ListItem seletedItemCom = new ListItem("Select Company", "");
                companyDropDownList.Items.Insert(0, seletedItemCom);
             
            }
          
            messageLabel.Text=String.Empty;
        }

        private bool Validation()
        {
            bool retn = true;
            if (string.IsNullOrEmpty(categoryDropDownList.SelectedValue))
            {
                retn = false;
                categorySelectErrorMesseageLabel.Text = "Please select a Category";
            }
            else
            {
                categorySelectErrorMesseageLabel.Text = String.Empty;
            }
            if (string.IsNullOrEmpty(companyDropDownList.SelectedValue))
            {
                retn = false;
                companySelectErrorMesseage.Text = "Please select a Company";
            }
            else
            {
                companySelectErrorMesseage.Text = String.Empty;
            }
            if (string.IsNullOrEmpty(itemNameTextBox.Text.Trim()))
            {
                retn = false;
                itemNameErrorMessageLabel.Text = "Please enter a Item Name";
            }
            else if (itemNameTextBox.Text.Trim().Length>49)
            {
                retn = false;
                itemNameErrorMessageLabel.Text = "Please enter no more than 49 digits.";
            }
            else
            {
                itemNameErrorMessageLabel.Text = string.Empty;
            }
            int n;
            if (string.IsNullOrEmpty(reorderTextBox.Text.Trim()))
            {
                retn = false;
                reorderLevelErrorMessageLabel.Text = "Please enter a Reorder Level";
            }
          
            else if (!int.TryParse(reorderTextBox.Text.Trim(),out n))
            {
                retn = false;
                reorderLevelErrorMessageLabel.Text = "Please enter a integer value";

            }
            //else if (!Microsoft.VisualBasic.Information.IsNumeric(reorderTextBox.Text))// internally use double.tryparse()
            //{
            //    retn = false;
            //    reorderLevelErrorMessageLabel.Text = "Please enter a numeric value";

            //}
          else if (reorderTextBox.Text.Trim().Length>9)
          {
              retn = false;
              reorderLevelErrorMessageLabel.Text = "Please enter no more than 9 digits.";
          }
            else
            {
                reorderLevelErrorMessageLabel.Text = "";
            }
            
            return retn;
        }

        protected void itemSaveButton_Click(object sender, EventArgs e)
        {
            if (Validation())
            {


                aItem.CategoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
                aItem.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                aItem.ItemName = itemNameTextBox.Text.Trim();
                aItem.ReorderLevel = Convert.ToInt32(reorderTextBox.Text.Trim());

                if (aItemManager.IsItemAllreadyExist(aItem))
                {
                    messageLabel.Text = aItem.ItemName + " allready exist";
                }
                else
                {
                    messageLabel.Text = aItemManager.SaveItemInfo(aItem);
                }
            }
        }

       

        
    }
}