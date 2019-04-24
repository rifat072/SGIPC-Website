using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"]!=null)
        {
            admin.Visible = true;
            guest.Visible = false;
        }
        else
        {
            admin.Visible = false;
            guest.Visible = true;
        }
    }
    protected void noticebtn_Click(object sender, EventArgs e)
    {
        DateTime dt=DateTime.Now;
        SqlDataSource1.InsertParameters["Description"].DefaultValue = ((TextBox)admin.FooterRow.FindControl("noticetxt")).Text;
        SqlDataSource1.InsertParameters["Date"].DefaultValue =  dt.ToShortDateString();
        SqlDataSource1.Insert();
    }
}