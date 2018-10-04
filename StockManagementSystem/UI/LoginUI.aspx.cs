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
    public partial class LoginUI : System.Web.UI.Page
    {
        LogInManager aLogInManager = new LogInManager();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool Validation()
        {
            bool retn = true;
            if (string.IsNullOrEmpty(userNameTextBox.Text.Trim()))
            {
                retn = false;
                userNameErrorMessageLabel.Text = "Please enter a User Name";
            }
            else if (userNameTextBox.Text.Trim().Length>49)
            {
                retn = false;
                userNameErrorMessageLabel.Text = "Please enter no more than 49 characters";
            }
            else
            {
                userNameErrorMessageLabel.Text = "";


            }
            if (string.IsNullOrEmpty(passwordTextBox.Text.Trim()))
            {
                retn = false;
                passwordErrorMessageLabel.Text = "Please enter a Password";
            }
            else if (passwordTextBox.Text.Trim().Length>49)
            {
                retn = false;
                passwordErrorMessageLabel.Text = "Please enter no more than 49 characters";
            }
            else
            {
                passwordErrorMessageLabel.Text = "";
            }
            return retn;
        }

        protected void logInButton_Click(object sender, EventArgs e)
        {
            if (Validation())
            {
                LogIn aLogIn = new LogIn();

                aLogIn.UserName = userNameTextBox.Text.Trim();
                aLogIn.Password = passwordTextBox.Text.Trim();

                if (aLogInManager.GetUserLogIn(aLogIn))
                {
                    Response.Redirect("HomeUI.aspx");

                }
                else
                {
                    messageLabel.Text = "User Name or Password Invalid";
                }
            
            }
           

        }

    }
}