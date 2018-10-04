using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Security.Cryptography.X509Certificates;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Models;

namespace StockManagementSystem.UI
{
    public partial class StockOutUI : System.Web.UI.Page
    {
        CompanyManager aCompanyManager = new CompanyManager();
        ItemManager aItemManager = new ItemManager();
        StockOutManager aStockOutManager=new StockOutManager();
        //List<StockOut> stockOuts = new List<StockOut>();
        List<StockOutVM> stockOutsVms = new List<StockOutVM>();

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                companyDropDownList.DataSource = aCompanyManager.GetAllCompanyInfo();
                companyDropDownList.DataTextField = "CompanyName";
                companyDropDownList.DataValueField = "CompanyId";
                companyDropDownList.DataBind();
                ListItem seletedItemCom = new ListItem("Select Company", "");
                companyDropDownList.Items.Insert(0, seletedItemCom);


                itemDropDownList.Enabled = false;

                //sellButton.Enabled = false;
                //damageButton.Enabled = false;
                //lostButton.Enabled = false;

            }

            messageLabel.Text = "";
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
           
            int n;
            if (string.IsNullOrEmpty(stockOutQuantityTextBox.Text.Trim()))
            {
                retn = false;
                stockOutQuantityErrorMessageLabel.Text = "Please enter a Stock Quantity";
            }
            else if (stockOutQuantityTextBox.Text.Trim().Length > 9)
            {
                retn = false;
                stockOutQuantityErrorMessageLabel.Text = "Please enter no more than 9 digits";
            }
            else if (!int.TryParse(stockOutQuantityTextBox.Text.Trim(), out n))
            {
                retn = false;
                stockOutQuantityErrorMessageLabel.Text = "Please enter a integer value";

            }
   
           
            else
            {
                stockOutQuantityErrorMessageLabel.Text = "";
            }

            return retn;
        }

        
        protected void addButton_Click(object sender, EventArgs e)
        {
            if (Validation())
            {


                
                StockOutVM aStockOutVm = new StockOutVM();


                aStockOutVm.CompanyId = Convert.ToInt32(companyDropDownList.SelectedItem.Value);
                aStockOutVm.ItemId = Convert.ToInt32(itemDropDownList.SelectedItem.Value);

                aStockOutVm.CompanyName = companyDropDownList.SelectedItem.Text;
                aStockOutVm.ItemName = itemDropDownList.SelectedItem.Text;
                aStockOutVm.StockOutQuantity = Convert.ToInt32(stockOutQuantityTextBox.Text.Trim());

                Item aItem = new Item();
                aItem = aItemManager.GetItemInfo(aStockOutVm.ItemId);


                if (aItem.AvailableQuantity >= aStockOutVm.StockOutQuantity)
                {
                    if (ViewState["StockOutItems"] != null)
                    {
                        stockOutsVms = (List<StockOutVM>) ViewState["StockOutItems"];
                    }

                    if (stockOutsVms != null)
                    {
                        foreach (var item in stockOutsVms)
                        {
                            if (item.ItemId == aStockOutVm.ItemId)
                            {
                                if (item.StockOutQuantity+aStockOutVm.StockOutQuantity>aItem.AvailableQuantity)
                                {
                                    messageLabel.Text = "Stock Out Quantity is larger than Available Quantity";
                                }
                                else
                                {
                                    item.StockOutQuantity += aStockOutVm.StockOutQuantity;
                                }
                             
                                goto Next;
                            }
                        }

                    }

                    stockOutsVms.Add(aStockOutVm);

                    Next:

                    ViewState["StockOutItems"] = stockOutsVms;


                    stockOutGridView.DataSource = stockOutsVms;
                    stockOutGridView.DataBind();

                    companyDropDownList.SelectedIndex = 0;
                    itemDropDownList.SelectedIndex = 0;
                    itemDropDownList.Enabled = false;
                    stockOutQuantityTextBox.Text = String.Empty;
                    //sellButton.Enabled = true;
                    //damageButton.Enabled = true;
                    //lostButton.Enabled = true;
                    reorderLevelTextBox.Text = String.Empty;
                    availableQuantityTextBox.Text = String.Empty;

                }

                else
                {
                    messageLabel.Text = "Stock Out Quantity is larger than Available Quantity";

                    //companyDropDownList.SelectedIndex = 0;
                    //itemDropDownList.SelectedIndex = 0;
                    //itemDropDownList.Enabled = false;
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
                reorderLevelTextBox.Text = String.Empty;
                availableQuantityTextBox.Text = String.Empty;
            }
            else
            {
                aItem = aItemManager.GetItemInfo(Convert.ToInt32(itemDropDownList.SelectedValue));

                reorderLevelTextBox.Text = aItem.ReorderLevel.ToString();
                availableQuantityTextBox.Text = aItem.AvailableQuantity.ToString();

                itemIdHiddenField.Value = aItem.ItemId.ToString();
                availableQuantityHiddenField.Value = aItem.AvailableQuantity.ToString();
            }


        }

        protected void sellButton_Click(object sender, EventArgs e)
        {
           

            List<StockOutVM> sOutVms=new List<StockOutVM>();        
            sOutVms = (List<StockOutVM>) ViewState["StockOutItems"];


            if (sOutVms != null)
            {
                foreach (var stockItem in sOutVms)
                {
                    StockOut aStockOut = new StockOut();

                    aStockOut.ItemId = stockItem.ItemId;
                    aStockOut.StockOutQuantity = stockItem.StockOutQuantity;
                    aStockOut.Flag = "Sell";
                    aStockOut.StockOutDate =DateTime.Now;
                    if (aStockOutManager.SaveStockOut(aStockOut))
                    {
                        messageLabel.Text = "Saved";

                        Item aItem=new Item();
                        aItem = aItemManager.GetItemInfo(aStockOut.ItemId);
                        int updatedValue = aItem.AvailableQuantity - aStockOut.StockOutQuantity;

                        aItemManager.UpdateAvailabelQuantity(aStockOut.ItemId, updatedValue);

                        stockOutGridView.DataSource = null;
                        stockOutGridView.DataBind();
                        ViewState["StockOutItems"] = null;
                    }
                    else
                    {
                        messageLabel.Text = "Not Saved";
                    }
                }
            }
            else
            {
                messageLabel.Text = "please first select";
            }
           
        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            List<StockOutVM> sOutVms = new List<StockOutVM>();
            sOutVms = (List<StockOutVM>)ViewState["StockOutItems"];

            if (sOutVms!=null)
            {
                foreach (var stockItem in sOutVms)
                {
                    StockOut aStockOut = new StockOut();

                    aStockOut.ItemId = stockItem.ItemId;
                    aStockOut.StockOutQuantity = stockItem.StockOutQuantity;
                    aStockOut.Flag = "Damage";
                    aStockOut.StockOutDate = DateTime.Now;

                    if (aStockOutManager.SaveStockOut(aStockOut))
                    {
                        messageLabel.Text = "saved";

                        Item aItem = new Item();
                        aItem = aItemManager.GetItemInfo(aStockOut.ItemId);
                        int updatedValue = aItem.AvailableQuantity - aStockOut.StockOutQuantity;

                        aItemManager.UpdateAvailabelQuantity(aStockOut.ItemId, updatedValue);

                        stockOutGridView.DataSource = null;
                        stockOutGridView.DataBind();
                        ViewState["StockOutItems"] = null;
                    }
                    else
                    {
                        messageLabel.Text = "not saved";
                    }
                }
            }
            else
            {
                messageLabel.Text = "please first select";
            }

        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            List<StockOutVM> sOutVms = new List<StockOutVM>();
            sOutVms = (List<StockOutVM>)ViewState["StockOutItems"];

            if (sOutVms != null)
            {
                foreach (var stockItem in sOutVms)
                {
                    StockOut aStockOut = new StockOut();

                    aStockOut.ItemId = stockItem.ItemId;
                    aStockOut.StockOutQuantity = stockItem.StockOutQuantity;
                    aStockOut.Flag = "Lost";
                    aStockOut.StockOutDate = DateTime.Now;

                    if (aStockOutManager.SaveStockOut(aStockOut))
                    {
                        messageLabel.Text = "saved";

                        Item aItem = new Item();
                        aItem = aItemManager.GetItemInfo(aStockOut.ItemId);
                        int updatedValue = aItem.AvailableQuantity - aStockOut.StockOutQuantity;

                        aItemManager.UpdateAvailabelQuantity(aStockOut.ItemId, updatedValue);

                        stockOutGridView.DataSource = null;
                        stockOutGridView.DataBind();
                        ViewState["StockOutItems"] = null;
                    }
                    else
                    {
                        messageLabel.Text = "not saved";
                    }
                }
            }

            else
            {
                messageLabel.Text = "please first select";
            }
           

        }

        

      
    }
}