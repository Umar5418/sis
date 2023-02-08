using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_resetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MessageLabel.Visible = false;
        }
    }

    protected void changePasswordButton_Click(object sender, EventArgs e)
    {
        string EncrytedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(ConfirmNewPasswordTextBox.Text, "SHA1");
        DateTime dateTimeDOB = Convert.ToDateTime(DateTime.Now.ToString(dobTextBox.Text.Trim()));
        
        string CS = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
        using (SqlConnection sqlConnection = new SqlConnection(CS))
        {
            using (SqlCommand sqlCommand = new SqlCommand("spUpdatePassword", sqlConnection))
            {
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                sqlConnection.Open();

                sqlCommand.Parameters.AddWithValue("@username", userNameTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@dob", dateTimeDOB.Date);
                sqlCommand.Parameters.AddWithValue("@newpassword", EncrytedPassword);

                if (sqlCommand.ExecuteNonQuery() > 0)
                {
                    MessageLabel.Visible = true;
                    MessageLabel.ForeColor = System.Drawing.Color.Green;
                    MessageLabel.Text = "Password Reseted Successfully...";
                    MessageLabel.CssClass = "alert alert-success";
                }
                else
                {
                    MessageLabel.Visible = true;
                    MessageLabel.ForeColor = System.Drawing.Color.Red;
                    MessageLabel.Text = "Invalid Username or Date of Birth ,Please try again";
                    MessageLabel.CssClass = "alert alert-danger";
                }
            }
        }

    }
    protected void ClearButton_Click(object sender, EventArgs e)
    {
        userNameTextBox.Text = string.Empty;
        dobTextBox.Text = string.Empty;
        MessageLabel.Visible = false;
        userNameTextBox.Focus();
    }

}