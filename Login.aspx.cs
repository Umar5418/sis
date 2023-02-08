using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;
using System.Data;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        if (AuthenticateUser(userNameTextBox.Text, passwordTextBox.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(userNameTextBox.Text, rememberMeCheckBox.Checked);
            Session["UserName"] = userNameTextBox.Text;
            Response.Redirect("/Student/studentHomePage.aspx");
        }
        else if( AuthenticateAdmin(userNameTextBox.Text, passwordTextBox.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(userNameTextBox.Text, rememberMeCheckBox.Checked);
            Session["UserName"] = userNameTextBox.Text;
            Response.Redirect("/Admin/adminProfile.aspx");
        }
        else
        {
            errorMessageLabel.Visible = true;
            errorMessageLabel.Text = " Warning! : Invalid Credentials . . .";
            errorMessageLabel.CssClass = "alert alert-danger";
        }
    }

    protected void ResetButton_Click(object sender, EventArgs e)
    {
        userNameTextBox.Text = " ";
        passwordTextBox.Text = " ";
        errorMessageLabel.Visible = false;
        userNameTextBox.Focus();
    }

    private bool AuthenticateUser(string username, string password)
    {
        string CS = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("storedProcedureAuthenticateUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //Encrpting Password
             string EncrytedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(passwordTextBox.Text, "SHA1");
            SqlParameter parameterUserName = new SqlParameter("@username", userNameTextBox.Text);
            SqlParameter parameterPassword = new SqlParameter("@password", EncrytedPassword);

            cmd.Parameters.Add(parameterUserName);
            cmd.Parameters.Add(parameterPassword);
            con.Open();

            int ReturnCode = (int)cmd.ExecuteScalar();
            return ReturnCode == 1;

        }
    }

    private bool AuthenticateAdmin(string username, string password)
    {
        string CS = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("storedProcedureAuthenticateAdmin", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //Encrpting Password
            string EncrytedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(passwordTextBox.Text, "SHA1");
            SqlParameter parameterUserName = new SqlParameter("@UserName", userNameTextBox.Text);
            SqlParameter parameterPassword = new SqlParameter("@Password", EncrytedPassword);

            cmd.Parameters.Add(parameterUserName);
            cmd.Parameters.Add(parameterPassword);
            con.Open();

            int ReturnCode = (int)cmd.ExecuteScalar();
            return ReturnCode == 1;

        }
    }

}