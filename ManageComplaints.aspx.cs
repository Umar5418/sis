using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accounts_ViewAllComplaints : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ReplyButton_Click(object sender, EventArgs e)
    {
        LinkButton linkButton = (LinkButton)sender;
        string argument = linkButton.CommandArgument;
        Response.Redirect("~/Admin/ReplyComplaints.aspx?ComplaintId=" + argument);
    }
}