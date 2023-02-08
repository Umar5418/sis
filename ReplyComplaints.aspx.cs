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

public partial class Accounts_ReplyComplaints : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MessageLabel.Visible = false;
            //Code for Feedback Status DropDownList 
            ListItem listItemFeedbackStatus = new ListItem("Select Status", "-1");
            ComplaintStatusDDL.Items.Insert(0, listItemFeedbackStatus);
        }

        if(Request.QueryString["ComplaintId"] != null)
        {
            int ComplaintId = Convert.ToInt16(Request.QueryString["ComplaintId"].ToString());
            string ConnectionString = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                String SlectSqlData = "SELECT * FROM ComplaintDetails where ComplaintId = @ComplaintId";
                SqlCommand sqlCommand = new SqlCommand(SlectSqlData, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@ComplaintId", ComplaintId);

                //Opening the Connection
                sqlConnection.Open();

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
                sqlDataAdapter.SelectCommand = sqlCommand;
                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);

                if (dataSet.Tables[0].Rows.Count > 0)
                {
                    ComplaintIdLabel.Text       = "Data Found";
                    ComplaintIdLabel.Text       = dataSet.Tables[0].Rows[0]["ComplaintId"].ToString();
                    UserNameLabel.Text         = dataSet.Tables[0].Rows[0]["UserName"].ToString();
                    DateLabel.Text             = dataSet.Tables[0].Rows[0]["RegisterDateTime"].ToString();
                    ComplaintSubjectLabel.Text = dataSet.Tables[0].Rows[0]["ComplaintSubject"].ToString();
                    ComplaintDetailLabel.Text  = dataSet.Tables[0].Rows[0]["ComplaintDetail"].ToString();
                    //ComplaintStatusLabel.Text  = dataSet.Tables[0].Rows[0]["ComplaintStatus"].ToString();
                }
                else
                {
                    Response.Redirect("~/Admin/ViewAllComplaints.aspx");
                }


            }
           
        }
    }



    protected void ReplyButton_Click(object sender, EventArgs e)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
        using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
        {
            string UpdateSqlData = "UPDATE ComplaintDetails SET ComplaintStatus = @ComplaintStatus , ComplaintReply = @ComplaintReply " +
                                     "WHERE ComplaintId = @ComplaintId";

            SqlCommand sqlCommand = new SqlCommand(UpdateSqlData, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@ComplaintStatus", ComplaintStatusDDL.SelectedItem.Text);
            sqlCommand.Parameters.AddWithValue("@ComplaintReply", ComplaintReplyTextBox.Text);
            sqlCommand.Parameters.AddWithValue("@ComplaintId", ComplaintIdLabel.Text);

            //Opening the Connection
            sqlConnection.Open();

            sqlCommand.ExecuteNonQuery();
            ComplaintReplyTextBox.Text = "";
            MessageLabel.Visible = true;
            MessageLabel.ForeColor = Color.Green;
            MessageLabel.CssClass = "alert alert-success";
            MessageLabel.Text = " " + " Reply has been sent to the User";

        }
    }



    protected void ClearButton_Click(object sender, EventArgs e)
    {
        ComplaintReplyTextBox.Text = "";
        MessageLabel.Visible = false;
        ComplaintReplyTextBox.Focus();
    }
}