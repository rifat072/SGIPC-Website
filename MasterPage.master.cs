using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using localhost;

public partial class MasterPage : System.Web.UI.MasterPage
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

        HttpCookie cookie = Request.Cookies["UserInfo"];
        if (cookie != null) {
            Session["userid"] = cookie["userid"];
            if (cookie["admin"] == "admin") Session["admin"] = true;
            else Session["admin"] = null;
            notguest.Visible = true;
            guest.Visible = false;
            profile.Text = (String)Session["userid"];
        }
        else
        {
            Session["userid"] = null;
            Session["admin"] = null;
            notguest.Visible = false;
            guest.Visible = true;
        }
    }
    protected void Profile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/profile.aspx?id=" + (String)Session["userid"]);
    }
    
    
    protected void close_Click(object sender, EventArgs e)
    {
        wronglogin.Visible = false;
        wrongregister.Visible = false;
        logindiv.Attributes.Add("style", "display:none");
        registerdiv.Attributes.Add("style", "display:none");        
    }

    protected void login_submit_Click(object sender, EventArgs e)
    {
        string id = user_id_input.Text;
        string pass = user_pass_input.Text;
        WebService wb = new WebService();
        int ok = wb.login(id, pass);
        if (ok>0)
        {
            Session["userid"] = id;
            if (ok == 2) Session["admin"] = true;
            HttpCookie cookie = new HttpCookie("UserInfo");
            cookie["userid"] = id;
            if (ok == 2) cookie["admin"] = "admin";
            else cookie["admin"] = "user";
            cookie.Expires = DateTime.Now.AddMinutes(1);
            Response.Cookies.Add(cookie);
            close_Click(sender, e);
            Response.Redirect(Request.RawUrl);
        }
        
        else
        {
            wronglogin.Visible = true;
        }


    }

    
    protected void Logout_Click(object sender, EventArgs e) {
        Session["admin"] = null;
        Session["userid"] = null;
        HttpCookie cookie = new HttpCookie("UserInfo");
        cookie.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(cookie);
        Response.Redirect("~/home.aspx");
    }

    protected void register_click(object sender, EventArgs e)
    {
        String fpass = f_pass.Text.ToString();
        String lpass = l_pass.Text.ToString();
        if (fpass.Equals(lpass))
        {

            WebService wb = new WebService();
            bool test = wb.insertdb(f_name.Text, l_name.Text, u_id.Text, f_pass.Text, r_email.Text);
            if (test == false)
            {

                wrongregister.Visible = true;
                return;
            }
            close_Click(sender, e);
        }
        else
        {
            wrongregister.Visible = true;
            return;
        }

    }
    protected void hidenuser_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/profile.aspx?id=" + (String)Session["userid"]);
    }
    protected void display_log_Click(object sender, EventArgs e)
    {
        logindiv.Attributes.Add("style", "display:block");
         
    }
    protected void display_reg_Click(object sender, EventArgs e)
    {
        registerdiv.Attributes.Add("style", "display:block");  
    }
}
