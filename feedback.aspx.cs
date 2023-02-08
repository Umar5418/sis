using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class feedback : System.Web.UI.Page
{
    static int FeedbackId;
    protected void Page_Load(object sender, EventArgs e)
    {

        GetFeedbackId();
        DateLabel.Text = DateTime.Now.ToShortTimeString().ToString() + " " + DateTime.Now.ToLongDateString().ToString();

        if (!IsPostBack)
        {
            MessageLabel.Visible = false;
        }
    }

    protected void PostButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                SqlCommand sqlCommand = new SqlCommand("spProvideFeedback", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@FeedbackId", FeedbackId);
                sqlCommand.Parameters.AddWithValue("@RegisterDateTime", DateLabel.Text);
                sqlCommand.Parameters.AddWithValue("@Name", NameTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@Email", emailTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@FeedbackSubject", FeedbackSubjectTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@FeedbackDescription", FeedbackDescriptionTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@FeedbackStatus", "Under Processing");

                //Opening the Connection
                sqlConnection.Open();

                sqlCommand.ExecuteNonQuery();
                FeedbackSubjectTextBox.Text = "";
                FeedbackDescriptionTextBox.Text = "";
                NameTextBox.Text = "";
                emailTextBox.Text = "";
                MessageLabel.Visible = true;
                MessageLabel.ForeColor = Color.Green;
                MessageLabel.CssClass = "alert alert-warning";
                MessageLabel.Text = "Your Feedback ID is " + FeedbackId + " . You can Check the Status of your Feedback Using Feedback ID";
            }
        }
        else
        {
            MessageLabel.Visible = true;
            MessageLabel.ForeColor = Color.IndianRed;
            MessageLabel.Text = "Validation Failed..";
        }
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {

    }


    protected void ClearButton_Click(object sender, EventArgs e)
    {
        FeedbackSubjectTextBox.Text = "";
        FeedbackDescriptionTextBox.Text = "";
        MessageLabel.Visible = false;
        FeedbackSubjectTextBox.Focus();
    }

    // Get Complaint ID Method
    private void GetFeedbackId()
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
        using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
        {
            String SelectSqlData = "SELECT FeedbackId FROM FeedbackDetails";
            SqlCommand sqlCommand = new SqlCommand(SelectSqlData, sqlConnection);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            sqlConnection.Open();
            sqlDataAdapter.SelectCommand = sqlCommand;
            DataSet dataSet = new DataSet();
            sqlDataAdapter.Fill(dataSet);

            if (dataSet.Tables[0].Rows.Count < 1)
            {
                FeedbackId = 30001;
            }
            else
            {

                String NewSelectSqlData = "SELECT MAX(FeedbackId) FROM FeedbackDetails";
                SqlCommand NewSqlCommand = new SqlCommand(NewSelectSqlData, sqlConnection);
                SqlDataAdapter NewSqlDataAdapter = new SqlDataAdapter();
                NewSqlDataAdapter.SelectCommand = NewSqlCommand;
                DataSet NewDataSet = new DataSet();
                NewSqlDataAdapter.Fill(NewDataSet);
                int DataVariable = Convert.ToInt16(NewDataSet.Tables[0].Rows[0][0].ToString());
                DataVariable += 1;
                FeedbackId = DataVariable;
            }
        }
    }

}