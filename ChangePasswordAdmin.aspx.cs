using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UserName"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            MessageLabel.Visible = false;
        }
    }

    protected void ChangePasswordButton_Click(object sender, EventArgs e)
    {
        string EncryptedCurrentPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(CurrentPasswordTextBox.Text, "SHA1");
        string EncryptedNewPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(NewPasswordTextBox.Text, "SHA1");
        string CS = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;

        using (SqlConnection sqlConnection = new SqlConnection(CS))
        {
            using (SqlCommand sqlCommand = new SqlCommand("StoredProcedureChangePasswordForAdmin", sqlConnection))
            {
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                sqlConnection.Open();
                sqlCommand.Parameters.AddWithValue("@UserName", Session["UserName"]);
                sqlCommand.Parameters.AddWithValue("@CurrentPassword", EncryptedCurrentPassword);
                sqlCommand.Parameters.AddWithValue("@NewPassword", EncryptedNewPassword);
                int IsPasswordChanged = (int)sqlCommand.ExecuteScalar();

                if (IsPasswordChanged == 1)
                {
                    if(CurrentPasswordTextBox.Text != NewPasswordTextBox.Text)
                    {
                        MessageLabel.Visible = true;
                        MessageLabel.ForeColor = System.Drawing.Color.Green;
                        MessageLabel.CssClass = "alert alert-success";
                        MessageLabel.Text = "Password Changed Successfully...";
                    }
                    else
                    {
                        MessageLabel.Visible = true;
                        MessageLabel.ForeColor = System.Drawing.Color.Red;
                        MessageLabel.Text = " " + "Current Password and New Password Can't be Same..";
                        MessageLabel.CssClass = "alert alert-danger";
                        CurrentPasswordTextBox.Focus();
                    }
                }
                else
                {
                    MessageLabel.Visible = true;
                    MessageLabel.ForeColor = System.Drawing.Color.Red;
                    MessageLabel.Text = " " + "Invalid Current Password";
                    MessageLabel.CssClass = "alert alert-danger";
                    CurrentPasswordTextBox.Focus();
                }
            }
        }
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Admin/adminProfile.aspx");
    }
}