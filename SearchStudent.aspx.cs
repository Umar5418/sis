using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accounts_SearchStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MessageLabel.Visible = false;
            GridViewSearch.Visible = false;
            SearchTextBox.Focus();
        }

    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;

        using (SqlConnection sqlConnection = new SqlConnection(CS))
        {
            using (SqlCommand sqlCommand = new SqlCommand("spSearchStudents", sqlConnection))
            {
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;

                if (SearchTextBox.Text.Trim() != String.Empty)
                {
                    sqlCommand.Parameters.AddWithValue("@FirstName", SearchTextBox.Text);
                    sqlCommand.Parameters.AddWithValue("@LastName", SearchTextBox.Text);
                    sqlCommand.Parameters.AddWithValue("@Gender", SearchTextBox.Text);
                    sqlCommand.Parameters.AddWithValue("@District", SearchTextBox.Text);
                    sqlCommand.Parameters.AddWithValue("@Category", SearchTextBox.Text);
                    SearchTextBox.Text = String.Empty;
                }

                //Opening the SQL Connection
                sqlConnection.Open();
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

                if (sqlDataReader.HasRows)
                {
                    GridViewSearch.Visible = true;
                    GridViewSearch.DataSource = sqlDataReader;
                    GridViewSearch.DataBind();
                    MessageLabel.Visible = true;
                    MessageLabel.Text = " Record Found";
                    MessageLabel.CssClass = "alert alert-success";
                    MessageLabel.ForeColor = Color.DarkGreen;
                    SearchPanel.Visible = true;
                }
                else
                {
                    MessageLabel.Visible = true;
                    MessageLabel.ForeColor = System.Drawing.Color.Red;
                    MessageLabel.CssClass = "alert alert-danger";
                    MessageLabel.Text = " No Records Found";
                    GridViewSearch.Visible = false;
                }
            }
        }
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        GridViewSearch.Visible = false;
        MessageLabel.Visible = false;
        SearchPanel.Visible = false;
        SearchTextBox.Text = "";
        SearchTextBox.Focus();
    }
}