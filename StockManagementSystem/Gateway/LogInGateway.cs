using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Compilation;
using System.Web.Configuration;
using StockManagementSystem.Models;

namespace StockManagementSystem.Gateway
{
    public class LogInGateway
    {
        private string connectionString =
            WebConfigurationManager.ConnectionStrings["StockManagementSystemDBCon"].ConnectionString;
        public int GetUserLogIn(LogIn aLogIn)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string querry = "Select count(*) from LogIn_tbl where UserName=@UserName and Password=@Password";

            SqlCommand cmd = new SqlCommand(querry, connection);
            cmd.Parameters.AddWithValue("UserName", aLogIn.UserName);
            cmd.Parameters.AddWithValue("Password", aLogIn.Password);

            int rowCount = (int)cmd.ExecuteScalar();
            connection.Close();

            return rowCount;
        }
    }
}