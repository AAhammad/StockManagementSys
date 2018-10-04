using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystem.Gateway;
using StockManagementSystem.Models;

namespace StockManagementSystem.BLL
{
    public class LogInManager
    {
        LogInGateway aLogInGateway=new LogInGateway();
        public bool GetUserLogIn(LogIn aLogIn)
        {
            if (aLogInGateway.GetUserLogIn(aLogIn)>0)
            {
                return true;
            }
            return false;
        }
    }
}