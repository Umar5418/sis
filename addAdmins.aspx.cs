using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class Student_studentRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //DropDown Code for State DDL  City DDL and District DDl
            stateDropDownList.DataSource = GetData("storedProcedureGetStates", null);
            stateDropDownList.DataBind();
            ListItem listItemStates = new ListItem("Select State", "-1");
            stateDropDownList.Items.Insert(0, listItemStates);
            ListItem listItemCities = new ListItem("Select City", "-1");
            cityDropDownList.Items.Insert(0, listItemCities);
            ListItem listItemDistricts = new ListItem("Select District", "-1");
            districtDropDownList.Items.Insert(0, listItemDistricts);
            cityDropDownList.Enabled = false;
            districtDropDownList.Enabled = false;


            //DropDown Code for Gender DDL
            genderDropDownList.DataSource = GetData("storedProcedureGetGenders", null);
            genderDropDownList.DataBind();
            ListItem listItemGender = new ListItem("Select Gender", "-1");
            genderDropDownList.Items.Insert(0, listItemGender);

        }
    }
    protected void RegisterLinkButton_Click(object sender, EventArgs e)
    {
        string EncrytedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(passwordTextBox.Text, "SHA1");

        string connectionString = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
        using (SqlConnection sqlConnection = new SqlConnection(connectionString))
        {
            SqlCommand sqlCommand = new SqlCommand("storedProcedureRegisterAdmin", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@UserName", UsernameTextBox.Text);
            sqlCommand.Parameters.AddWithValue("@Name", NameTextBox.Text);
            sqlCommand.Parameters.AddWithValue("@Email", emailTextBox.Text);
            sqlCommand.Parameters.AddWithValue("@Password", EncrytedPassword);
            sqlCommand.Parameters.AddWithValue("@PhoneNo", phoneNoTextBox.Text);
            sqlCommand.Parameters.AddWithValue("@AadhaarNo", AadhaarNoTextBox.Text);
            sqlCommand.Parameters.AddWithValue("@Gender", genderDropDownList.SelectedItem.Text);
            sqlCommand.Parameters.AddWithValue("@Dob", dobTextBox.Text);
            sqlCommand.Parameters.AddWithValue("@State", stateDropDownList.SelectedItem.Text);
            sqlCommand.Parameters.AddWithValue("@City", cityDropDownList.SelectedItem.Text);
            sqlCommand.Parameters.AddWithValue("@District", districtDropDownList.SelectedItem.Text);
            sqlCommand.Parameters.AddWithValue("@Pincode", pinCodeTextBox.Text);
            sqlCommand.Parameters.AddWithValue("@YearOfJoining", YearOfJoiningTextBox.Text);

            //Opening the Connection
            sqlConnection.Open();

            int ReturnCode = (int)sqlCommand.ExecuteNonQuery();
            if (ReturnCode == -1)
            {
                MessageLabel.Visible = true;
                MessageLabel.ForeColor = Color.Red;
                MessageLabel.Text = "Username already taken, Please Choose a different one.";
                UsernameTextBox.Text = String.Empty;
                UsernameTextBox.Focus();
            }
            else
            {
                Session["UserName"] = UsernameTextBox.Text;
                Response.Redirect("~/Admin/SuccessMessage.aspx");
            }
        }
    }

    protected void ClearLinkButton_Click(object sender, EventArgs e)
    {
        UsernameTextBox.Focus();
        //ValidationSummary.Visible = false;
    }
    /*------------------- GetData Function -------------------*/
    private DataSet GetData(string storedProcedureName, SqlParameter storedProcedureParameter)
    {
        string CS = ConfigurationManager.ConnectionStrings["studentCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter(storedProcedureName, con);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (storedProcedureParameter != null)
            {
                dataAdapter.SelectCommand.Parameters.Add(storedProcedureParameter);
            }
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet);

            return dataSet;
        }
    }

    //stateDropDownList SelectedIndexChanged
    protected void stateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (stateDropDownList.SelectedIndex == 0)
        {
            cityDropDownList.SelectedIndex = 0;
            cityDropDownList.Enabled = false;
            districtDropDownList.SelectedIndex = 0;
            districtDropDownList.Enabled = false;
        }
        else
        {
            cityDropDownList.Enabled = true;
            SqlParameter sqlParameter = new SqlParameter("StateId", stateDropDownList.SelectedValue);
            DataSet dataSet = GetData("storedProcedureGetCitiesByStateId", sqlParameter);
            cityDropDownList.DataSource = dataSet;
            cityDropDownList.DataBind();
            ListItem listItemCities = new ListItem("Select City", "-1");
            cityDropDownList.Items.Insert(0, listItemCities);

            districtDropDownList.SelectedIndex = 0;
            districtDropDownList.Enabled = false;
        }
    }

    //CityDropDownList SelectedIndexChanged
    protected void cityDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cityDropDownList.SelectedIndex == 0)
        {
            districtDropDownList.SelectedIndex = 0;
            districtDropDownList.Enabled = false;
        }
        else
        {
            districtDropDownList.Enabled = true;
            SqlParameter sqlParameter = new SqlParameter("CityId", cityDropDownList.SelectedValue);
            DataSet dataSet = GetData("storedProcedureGetDistrictsByCityId", sqlParameter);
            districtDropDownList.DataSource = dataSet;
            districtDropDownList.DataBind();
            ListItem listItemDistricts = new ListItem("Select District", "-1");
            districtDropDownList.Items.Insert(0, listItemDistricts);
        }
    }
}