using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewFeedbacks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void FeedbackReplyButton_Click(object sender, EventArgs e)
    {
        LinkButton replyLinkButton = (LinkButton)sender;
        string argument = replyLinkButton.CommandArgument;
        Response.Redirect("~/Admin/ReplyFeedback.aspx?FeedbackId=" + argument);
    }
}