using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Models;

namespace StockManagementSystem.UI
{
    public partial class SearchAndViewItemsSummaryUI : System.Web.UI.Page
    {
        CompanyManager aCompanyManager=new CompanyManager();
        CategoryManager aCategoryManager=new CategoryManager();
        ItemManager aItemManager=new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                companyDropDownList.DataSource = aCompanyManager.GetAllCompanyInfo();
                companyDropDownList.DataTextField = "CompanyName";
                companyDropDownList.DataValueField = "CompanyId";
                companyDropDownList.DataBind();

                ListItem aListItem=new ListItem("Select Company","");
                companyDropDownList.Items.Insert(0,aListItem);

                categoryDropDownList.DataSource = aCategoryManager.GetAllCategoriesInfo();
                categoryDropDownList.DataTextField = "CategoryName";
                categoryDropDownList.DataValueField = "CategoryId";
                categoryDropDownList.DataBind();

                ListItem listItem=new ListItem("Select Category","");
                categoryDropDownList.Items.Insert(0,listItem);
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (companyDropDownList.SelectedIndex == 0 & categoryDropDownList.SelectedIndex == 0)
            {
                List<ItemSummaryVM> aItemSummaryVms = new List<ItemSummaryVM>();

                aItemSummaryVms = aItemManager.GetAllItemSummary();

                if (aItemSummaryVms.Count == 0)
                {
                    messageLabel.Text = "No item found";
                    itemSummaryGridView.DataSource = aItemSummaryVms;
                    itemSummaryGridView.DataBind();
                }
                else
                {
                    messageLabel.Text = "";
                    itemSummaryGridView.DataSource = aItemSummaryVms;
                    itemSummaryGridView.DataBind();
                }

            }
            else if (companyDropDownList.SelectedIndex > 0 & categoryDropDownList.SelectedIndex == 0)
            {
                List<ItemSummaryVM> aItemSummaryVms = new List<ItemSummaryVM>();

                aItemSummaryVms = aItemManager.GetAllItemSummaryByCompany(Convert.ToInt32(companyDropDownList.SelectedValue));

                if (aItemSummaryVms.Count == 0)
                {
                    messageLabel.Text = "No item found";
                    itemSummaryGridView.DataSource = aItemSummaryVms;
                    itemSummaryGridView.DataBind();
                }
                else
                {
                    messageLabel.Text = "";
                    itemSummaryGridView.DataSource = aItemSummaryVms;
                    itemSummaryGridView.DataBind();
                }
            }

            else if (companyDropDownList.SelectedIndex == 0 & categoryDropDownList.SelectedIndex > 0)
            {
                List<ItemSummaryVM> aItemSummaryVms = new List<ItemSummaryVM>();

                aItemSummaryVms = aItemManager.GetAllItemSummaryByCategory(Convert.ToInt32(categoryDropDownList.SelectedValue));

                if (aItemSummaryVms.Count == 0)
                {
                    messageLabel.Text = "No item found";
                    itemSummaryGridView.DataSource = aItemSummaryVms;
                    itemSummaryGridView.DataBind();
                }
                else
                {
                    messageLabel.Text = "";
                    itemSummaryGridView.DataSource = aItemSummaryVms;
                    itemSummaryGridView.DataBind();
                }


            }

            else
            {
                List<ItemSummaryVM> aItemSummaryVms = new List<ItemSummaryVM>();

                aItemSummaryVms = aItemManager.GetAllItemSummaryByCompanyAndCategory(Convert.ToInt32(companyDropDownList.SelectedValue), Convert.ToInt32(categoryDropDownList.SelectedValue));


                if (aItemSummaryVms.Count == 0)
                {
                    messageLabel.Text = "No item found";
                    itemSummaryGridView.DataSource = aItemSummaryVms;
                    itemSummaryGridView.DataBind();
                }
                else
                {
                    messageLabel.Text = "";
                    itemSummaryGridView.DataSource = aItemSummaryVms;
                    itemSummaryGridView.DataBind();
                }
            }
          

        
        }

        

        
           

       
    }
}