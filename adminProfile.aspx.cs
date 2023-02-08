using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_adminP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        GridViewStudent.Visible = false;
        //        DetailsViewStudent.Visible = false;

        //    }
        //}

        //protected void Page_PreRender(object sender, EventArgs e)
        //{
        //    if (GridViewStudent.SelectedRow != null)
        //    {
        //        DetailsViewStudent.Visible = true;
        //    }
        //    else
        //    {
        //        DetailsViewStudent.Visible = false;
        //    }
        //    if (GridViewStudent.Visible)
        //    {
        //        DetailsViewStudent.Visible = true;
        //    }
        //    else
        //    {
        //        DetailsViewStudent.Visible = false;
        //    }
        //}

        //protected void ViewStudentsLinkButton_Click(object sender, EventArgs e)
        //{
        //    if (GridViewStudent.Visible)
        //    {
        //        GridViewStudent.Visible = false;
        //        DetailsViewStudent.Visible = false;
        //    }
        //    else
        //    {
        //        GridViewStudent.Visible = true;
        //    }
        //}

        //protected void DetailsViewStudent_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        //{
        //    GridViewStudent.DataBind();
        //}

        //protected void DetailsViewStudent_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        //{
        //    GridViewStudent.DataBind();
        //}

        //protected void DetailsViewStudent_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        //{
        //    GridViewStudent.DataBind();
        //}


        //protected void DetailsViewStudentSqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        e.Cancel = true;
        //    }

    }
