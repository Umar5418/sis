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

public partial class Admin_VerifyScholarships : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MessageLabel.Visible = false;

            //Code for Scholarship Approval Status DropDownList 
            ListItem listItemScholarshipApprovalStatus = new ListItem("Select Status", "-1");
            ScholarshipApprovalStatusDropDownList.Items.Insert(0, listItemScholarshipApprovalStatus);
        }

        if (Request.QueryString["ScholarshipId"] != null)
        {
            int ScholarshipId = Convert.ToInt32(Request.QueryString["ScholarshipId"].ToString());
            string ConnectionString = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                String SelectSqlData = "SELECT * FROM ScholarshipDetails where ScholarshipId = @ScholarshipId";
                SqlCommand sqlCommand = new SqlCommand(SelectSqlData, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@ScholarshipId", ScholarshipId);

                //Opening the Connection
                sqlConnection.Open();

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
                sqlDataAdapter.SelectCommand = sqlCommand;
                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);

                if (dataSet.Tables[0].Rows.Count > 0)
                {
                    ScholarshipIdLabel.Text = dataSet.Tables[0].Rows[0]["ScholarshipId"].ToString();
                    UserNameLabel.Text = dataSet.Tables[0].Rows[0]["UserName"].ToString();
                    FirstNameLabel.Text = dataSet.Tables[0].Rows[0]["FirstName"].ToString();
                    LastNameLabel.Text = dataSet.Tables[0].Rows[0]["LastName"].ToString();
                    Genderlabel.Text = dataSet.Tables[0].Rows[0]["Gender"].ToString();
                    CategoryLabel.Text = dataSet.Tables[0].Rows[0]["Category"].ToString();
                    QualificationLabel.Text = dataSet.Tables[0].Rows[0]["Qualification"].ToString();
                    PercentageLabel.Text = dataSet.Tables[0].Rows[0]["Percentage"].ToString();
                    ReligionLabel.Text = dataSet.Tables[0].Rows[0]["Religion"].ToString();
                    MinorityReligionStatusLabel.Text = dataSet.Tables[0].Rows[0]["MinorityReligionStatus"].ToString();
                    TotalIncomeLabel.Text = dataSet.Tables[0].Rows[0]["TotalIncome"].ToString();
                    QualificationCertificateHyperLink.NavigateUrl = "~/images/qualificationImage.aspx?ScholarshipId=" + sqlCommand.Parameters["@ScholarshipId"].Value.ToString();
                    IncomeCertificateHyperLink.NavigateUrl = "~/images/IncomeImage.aspx?ScholarshipId=" + sqlCommand.Parameters["@ScholarshipId"].Value.ToString();
                }
                else
                {
                    Response.Redirect("~/Admin/VerifyScholarships.aspx");
                }


            }

        }
    }


    protected void VerifyScholarshipButton_Click(object sender, EventArgs e)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
        using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
        {
            string UpdateSqlData = "UPDATE ScholarshipDetails SET ScholarshipApprovalStatus = @ScholarshipApprovalStatus , " +
                                                                 "ScholarshipApprovalReply  = @ScholarshipApprovalReply " +
                                       "WHERE " +
                                       "ScholarshipId = @ScholarshipId ";

            SqlCommand sqlCommand = new SqlCommand(UpdateSqlData, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@ScholarshipId", ScholarshipIdLabel.Text);
            sqlCommand.Parameters.AddWithValue("@ScholarshipApprovalStatus", ScholarshipApprovalStatusDropDownList.SelectedItem.Text);
            sqlCommand.Parameters.AddWithValue("@ScholarshipApprovalReply", ScholarshipVerifyTextBox.Text);

            //Opening the Connection
            sqlConnection.Open();

            sqlCommand.ExecuteNonQuery();
            ScholarshipVerifyTextBox.Text = "";
            ScholarshipApprovalStatusDropDownList.SelectedValue = "-1";
            MessageLabel.Visible = true;
            MessageLabel.ForeColor = Color.Green;
            MessageLabel.CssClass = "alert alert-success";
            MessageLabel.Text = " " + " Scholarship Application Verification has been sent to the User";
        }
    }
}