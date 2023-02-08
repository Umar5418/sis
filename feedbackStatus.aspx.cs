using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class feedbackStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FeedbackErrorMessageLabel.Visible = false;
            FeedbackIdMessageLabel.Visible = false;
            FeedbackStatusMessageLabel.Visible = false;
            FeedbackPanelMessageLabel.Visible = false;
            Panel.Visible = false;
        }
    }

    protected void CheckStatusLinkButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (FeedbackIdTextBox.Text != " ")
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
                using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
                {
                    string SelectSqlData = "SELECT *FROM FeedbackDetails WHERE FeedbackId = @FeedbackId";
                    SqlCommand sqlCommand = new SqlCommand(SelectSqlData, sqlConnection);
                    sqlCommand.Parameters.AddWithValue("@FeedbackId", FeedbackIdTextBox.Text);

                    //Opening the Connection
                    sqlConnection.Open();

                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);

                    if (dataSet.Tables[0].Rows.Count > 0)
                    {

                        FeedbackErrorMessageLabel.Visible = false;
                        FeedbackIdMessageLabel.Visible = true;
                        FeedbackIdMessageLabel.Text = " " + "Your Feedback ID is " + dataSet.Tables[0].Rows[0]["FeedbackId"].ToString();
                        FeedbackStatusMessageLabel.Visible = true;
                        FeedbackStatusMessageLabel.Text = " " + "Status :   " + dataSet.Tables[0].Rows[0]["FeedbackStatus"].ToString();

                        if (dataSet.Tables[0].Rows[0]["FeedbackStatus"].ToString() == "Under Process")
                        {
                            Panel.Visible = false;
                            FeedbackStatusMessageLabel.ForeColor = Color.DarkOrange;
                            FeedbackStatusMessageLabel.CssClass = "alert alert-primary";
                        }
                        else
                        {
                            Panel.Visible = true;
                            FeedbackPanelMessageLabel.Visible = true;
                            FeedbackPanelMessageLabel.Text = " " + "Admin Reply : " + dataSet.Tables[0].Rows[0]["FeedbackReply"].ToString();
                            FeedbackPanelMessageLabel.ForeColor = Color.Green;
                            FeedbackPanelMessageLabel.CssClass = "alert alert-primary";
                            FeedbackStatusMessageLabel.ForeColor = Color.DarkSlateBlue;
                            FeedbackStatusMessageLabel.CssClass = "alert alert-warning";
                        }
                    }
                    else
                    {

                        FeedbackErrorMessageLabel.Visible = true;
                        FeedbackIdMessageLabel.Visible = false;
                        FeedbackStatusMessageLabel.Visible = false;
                        FeedbackPanelMessageLabel.Visible = false;
                        FeedbackErrorMessageLabel.Text = "Sorry , This Feedback  ID does not exist";
                        FeedbackErrorMessageLabel.ForeColor = Color.Red;
                        FeedbackErrorMessageLabel.CssClass = "alert alert-danger";
                        FeedbackIdTextBox.Focus();
                    }
                }
            }
        }

        else

        {
            FeedbackErrorMessageLabel.Visible = true;
            FeedbackErrorMessageLabel.CssClass = "alert alert-danger";
            FeedbackErrorMessageLabel.ForeColor = Color.IndianRed;
            FeedbackErrorMessageLabel.Text = " " + " Validation Failed..";
        }
    }

    protected void ClearLinkButton_Click(object sender, EventArgs e)
    {

        FeedbackIdTextBox.Text = "";
        FeedbackIdTextBox.Focus();
        FeedbackErrorMessageLabel.Visible = false;
        FeedbackStatusMessageLabel.Visible = false;
        FeedbackIdMessageLabel.Visible = false;
        FeedbackPanelMessageLabel.Visible = false;
    }
}