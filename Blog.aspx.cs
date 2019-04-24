using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            posts.DataSource = GetData("SELECT [blog].[writter],[blog].[post],[blog].[ID],[usertable].[imagedata] FROM [blog] join [usertable] on [blog].writter=[usertable].id order by [blog].id desc");
            posts.DataBind();
        }
    }
    private static DataTable GetData(string query) {
        string constr = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using(SqlConnection con=new SqlConnection(constr)){
            using (SqlCommand cmd= new SqlCommand()){
                cmd.CommandText = query;
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        if ((String)Session["userid"] == null || posttext.Text == "")
        {
            Label1.Visible = true;  
            return;
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
        con.Open();
        String str = posttext.Text.ToString();
        posttext.Text = posttext.Text.Replace("\r\n", "<br />");

        posttext.Text = posttext.Text.Replace(" ", " &nbsp;");

        string q = "insert into[blog] values('" + (String)Session["userid"] + "','" + posttext.Text.ToString() + "')";
        SqlCommand cmd = new SqlCommand(q, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        posttext.Text = "";
        posts.DataSource = GetData("SELECT [blog].[writter],[blog].[post],[blog].[ID],[usertable].[imagedata] FROM [blog] join [usertable] on [blog].writter=[usertable].id order by [blog].id desc");
        posts.DataBind();
        return;

    }

    protected void posts_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
            DataRowView datarowview = e.Item.DataItem as DataRowView;
            string blogid = datarowview["id"].ToString();
            DataList commentsdatalist = e.Item.FindControl("comments") as DataList;
            commentsdatalist.DataSource = GetData("SELECT [comments].[id],[comments].[comment_writter],[comments].[description],[comments].[blog_id],[usertable].[imagedata] FROM [comments] join [usertable] on [comments].[comment_writter]=[usertable].[id] WHERE [blog_id]='"+blogid+"' ORDER BY [ID] DESC");
            commentsdatalist.DataBind();
        }
    }
    protected void commentbtn_Click(object sender, EventArgs e)
    {
        string bid = ((Button)sender).CommandArgument;
        if ((String)Session["userid"] == null || posttext.Text == "") return;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
        con.Open();
        

    }
    protected void posts_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if(e.CommandName=="blogid"){
            String bid = e.CommandArgument.ToString();
            TextBox cmnt = (TextBox)e.Item.FindControl("commenttxt");
            String cmnttxt = cmnt.Text.ToString();
            cmnt.Text = "";
            if ((String)Session["userid"] == null || cmnttxt == "") return;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
            con.Open();

            string q = "insert into[comments] values('" + (String)Session["userid"] + "','" + cmnttxt + "','"+bid+"')";
            SqlCommand cmd = new SqlCommand(q, con);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            posts.DataSource = GetData("SELECT [blog].[writter],[blog].[post],[blog].[ID],[usertable].[imagedata] as imagedata FROM [blog] join [usertable] on [blog].writter=[usertable].id order by [blog].id desc");
            posts.DataBind();
            return;

        }
    }
}