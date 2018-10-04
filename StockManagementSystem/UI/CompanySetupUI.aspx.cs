using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Models;

namespace StockManagementSystem.UI
{
    public partial class CompanySetupUI1 : System.Web.UI.Page
    {

        CompanyManager aCompanyManager=new CompanyManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            companyInfoGridView.DataSource = aCompanyManager.GetAllCompanyInfo();
            companyInfoGridView.DataBind();
        }

        private bool Validation()
        {
            bool retn = true;
            if (string.IsNullOrEmpty(companyNameTextBox.Text.Trim()))
            {
                retn = false;
                nameErrorMessageLabel.Text = "Please enter a Company Name";
            }
            else if (companyNameTextBox.Text.Trim().Length>49)
            {
                retn = false;
                nameErrorMessageLabel.Text = "Please enter no more than 49 digits";
            }
            else
            {
                nameErrorMessageLabel.Text = string.Empty;
            }
            return retn;
        }
        protected void companySaveButton_Click(object sender, EventArgs e)
        {
            if (Validation())
            {


                Company aCompany = new Company();
                aCompany.CompanyName = companyNameTextBox.Text.Trim();

                if (aCompanyManager.IsCompanyAllReadyExist(aCompany))
                {
                    messageLabel.Text = aCompany.CompanyName + " Allready Exist ";
                }
                else
                {
                    messageLabel.Text = "";
                    messageLabel.Text = aCompanyManager.SaveCompanyInfo(aCompany);
                    companyInfoGridView.DataSource = aCompanyManager.GetAllCompanyInfo();
                    companyInfoGridView.DataBind();

                }
            }

        }

        
    }
}