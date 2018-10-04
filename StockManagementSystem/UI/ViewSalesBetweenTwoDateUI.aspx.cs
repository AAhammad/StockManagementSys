using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using StockManagementSystem.BLL;
using StockManagementSystem.Models;

namespace StockManagementSystem.UI
{
    public partial class ViewSalesBetweenTwoDateUI : System.Web.UI.Page
    {
        StockOutManager aStockOutManager=new StockOutManager();

      

        protected void Page_Load(object sender, EventArgs e)
        {
            messageLabel.Text = "";
        }

        private bool Validation()
        {
            DateTime n;
            bool retn = true;
            if (string.IsNullOrEmpty(fromDateTextBox.Text.Trim()))
            {
                retn = false;
                fromDateErrorMessageLabel.Text = "Please select a From Date";

            }
            else if (!DateTime.TryParse(fromDateTextBox.Text.Trim(),out n))
            {
                retn = false;
                fromDateErrorMessageLabel.Text = "Please select a valid From Date";
            }
            else
            {
                fromDateErrorMessageLabel.Text = String.Empty;
            }
            if (string.IsNullOrEmpty(toDateTextBox.Text.Trim()))
            {
                retn = false;
                toDateErrorMessageLabel.Text = "Please select a To Date";
            }
            else if (!DateTime.TryParse(toDateTextBox.Text.Trim(),out n))
            {
                retn = false;
                toDateErrorMessageLabel.Text = "Please select a valid To Date";
            }
            else
            {
               toDateErrorMessageLabel.Text = String.Empty;
            }

            return retn;
        }


        protected void viewSalesSearchButton_Click(object sender, EventArgs e)
        {
            if (Validation())
            {



                DateTime from = Convert.ToDateTime(fromDateTextBox.Text.Trim());
                DateTime to = Convert.ToDateTime(toDateTextBox.Text.Trim());

                if (from <= to)
                {
                    List<StockOutVM> aStockOuts = new List<StockOutVM>();
                    aStockOuts = aStockOutManager.GetAllItemBetweenTwoDate(from, to);
                    if (aStockOuts.Count == 0)
                    {
                        messageLabel.Text = "No item found";
                        salesSummaryGridView.DataSource = null;
                        salesSummaryGridView.DataBind();
                    }
                    else
                    {
                        salesSummaryGridView.DataSource = aStockOuts;
                        salesSummaryGridView.DataBind();

                    }


                }


                else
                {
                    salesSummaryGridView.DataSource = null;
                    salesSummaryGridView.DataBind();
                    messageLabel.Text = "From Date must be equal or smaller than To Date";
                }
            }
        }

       
    }
}