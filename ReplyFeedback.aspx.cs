using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class Admin_ReplyFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MessageLabel.Visible = false;
            //Code for Feedback Status DropDownList 
            ListItem listItemFeedbackStatus = new ListItem("Select Status", "-1");
            FeedbackStatusDDL.Items.Insert(0, listItemFeedbackStatus);
        }

        if (Request.QueryString["FeedbackId"] != null)
        {
            int FeedbackId = Convert.ToInt16(Request.QueryString["FeedbackId"].ToString());
            string ConnectionString = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                String SlectSqlData = "SELECT * FROM FeedbackDetails where FeedbackId = @FeedbackId";
                SqlCommand sqlCommand = new SqlCommand(SlectSqlData, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@FeedbackId", FeedbackId);

                //Opening the Connection
                sqlConnection.Open();

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
                sqlDataAdapter.SelectCommand = sqlCommand;
                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);

                if (dataSet.Tables[0].Rows.Count > 0)
                {
                    FeedbackIdLabel.Text = dataSet.Tables[0].Rows[0]["FeedbackId"].ToString();
                    NameLabel.Text = dataSet.Tables[0].Rows[0]["Name"].ToString();
                    EmailLabel.Text = dataSet.Tables[0].Rows[0]["Email"].ToString();
                    DateLabel.Text = dataSet.Tables[0].Rows[0]["RegisterDateTime"].ToString();
                    FeedbackSubjectLabel.Text = dataSet.Tables[0].Rows[0]["FeedbackSubject"].ToString();
                    FeedbackDescriptionLabel.Text = dataSet.Tables[0].Rows[0]["FeedbackDescription"].ToString();
                }
                else
                {
                    Response.Redirect("~/Admin/ViewFeedbacks.aspx");
                }
            }

        }
    }

    protected void ReplyButton_Click(object sender, EventArgs e)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
        using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
        {
            string UpdateSqlData = "UPDATE FeedbackDetails SET FeedbackStatus = @FeedbackStatus , FeedbackReply = @FeedbackReply " +
                                     "WHERE FeedbackId = @FeedbackId";

            SqlCommand sqlCommand = new SqlCommand(UpdateSqlData, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@FeedbackStatus", FeedbackStatusDDL.SelectedItem.Text);
            sqlCommand.Parameters.AddWithValue("@FeedbackReply", FeedbackReplyTextBox.Text);
            sqlCommand.Parameters.AddWithValue("@FeedbackId", FeedbackIdLabel.Text);

            //Opening the Connection
            sqlConnection.Open();

            sqlCommand.ExecuteNonQuery();
            FeedbackReplyTextBox.Text = "";
            MessageLabel.Visible = true;
            MessageLabel.ForeColor = Color.Green;
            MessageLabel.CssClass = "alert alert-success";
            MessageLabel.Text = " " + " Feedback Reply has been sent . . .";

        }
    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        FeedbackReplyTextBox.Text = "";
        MessageLabel.Visible = false;
        FeedbackReplyTextBox.Focus();
    }
}