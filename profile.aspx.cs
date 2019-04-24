using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using localhost;
using System.IO;



public partial class _Default : System.Web.UI.Page
{
    String userid=null;
    String pswd = null;
    String fname = null;
    String lname = null;

    Dictionary<String, String> data;

    public Dictionary<String, String> Profileinfo(String userid)
    {

        Dictionary<String, String> ret = new Dictionary<String, String>();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
        con.Open();
        String q = "select * from [usertable] where id='" + userid + "' ";
        SqlCommand cmd = new SqlCommand(q, con);
        SqlDataReader rdr = cmd.ExecuteReader();

        String str = null;

        while (rdr.Read())
        {

            str = rdr["first_name"].ToString();
            if (str != null) ret["first_name"] = str;
            else ret["first_name"] = "";

            str = rdr["last_name"].ToString();
            if (str != null) ret["last_name"] = str;
            else ret["last_ name"] = "";

            str = rdr["email"].ToString();
            if (str != null) ret["email"] = str;
            else ret["email"] = "";

            str = rdr["score"].ToString();
            if (str != null) ret["score"] = str;
            else ret["score"] = "";

            str = rdr["occupation"].ToString();
            if (str != null) ret["occupation"] = str;
            else ret["occupation"] = "";

            str = rdr["university"].ToString();
            if (str != null) ret["university"] = str;
            else ret["university"] = "";

            str = rdr["city"].ToString();
            if (str != null) ret["city"] = str;
            else ret["city"] = str;

            str = rdr["country"].ToString();
            if (str != null) ret["country"] = str;
            else ret["country"] = "";

            str = rdr["contactno"].ToString();
            if (str != null) ret["contactno"] = str;
            else ret["contactno"] = "";

            str = rdr["password"].ToString();
            if (str != null) ret["password"] = str;
            else ret["password"] = "";

        }

        rdr.Close();


        q = "select count(*) from [blog] where writter='" + userid + "'";
        cmd = new SqlCommand(q, con);
        Int32 i = 0;
        i = (Int32)cmd.ExecuteScalar();
        ret["blogentries"] = "" + i;


        cmd = new SqlCommand("getimagedata", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter paramid = new SqlParameter()
        {
            ParameterName = "@id",
            Value = userid
        };
        cmd.Parameters.Add(paramid);
        try
        {
            byte[] bytes = (byte[])cmd.ExecuteScalar();
            string strBase64 = Convert.ToBase64String(bytes);
            ret["image"] = "data:Image/png;base64," + strBase64;
        }
        catch (Exception E)
        {
            ret["image"] = "";
        }
        con.Close();


        return ret;

    }

    protected void Page_Load(object sender, EventArgs e)
    {

        String suid = null;
        suid=(String)Session["userid"];
        userid = Request.QueryString["id"];
        update_button.Visible = false;
        if (userid == null || suid == null)
        {
            update_button.Visible = false;
            profile.Visible = true;
            edit.Visible = false;
            wrong.Visible=false;
        }
        else if (userid .Equals(suid))
        {
            update_button.Visible = true;
            profile.Visible = true;
            edit.Visible = false;
            wrong.Visible=false;

        }
        else
        {
            update_button.Visible = false;
            profile.Visible = true;
            edit.Visible = false;
            wrong.Visible=false;
        }

        //WebService wb = new WebService();
        data = Profileinfo(userid);

        //fname=rdr["first_name"].ToString();
        //lname = rdr["last_name"].ToString();

        name.Text = data["first_name"]+" "+data["last_name"];
        email.Text = data["email"];
        score.Text = data["score"];
        occupation.Text = data["occupation"];
        university.Text = data["university"];
        city.Text = data["city"];
        country.Text = data["country"];
        contactno.Text = data["contactno"];
        pswd = data["password"]; 
        blogentries.Text = data["blogentries"];
        if (data["image"] != "") Image1.ImageUrl = data["image"];

        if(!IsPostBack){
            firstnameedit.Text=data["first_name"];
            lastnameedit.Text=data["last_name"];
            occupationedit.Text=data["occupation"];
            universityedit.Text=data["university"];
            cityedit.Text=data["city"];
            countryedit.Text=data["country"];
            contactnoedit.Text=data["contactno"];
            emailedit.Text=data["email"];
         
        }
            
    }
    protected void update_button_Click(object sender, EventArgs e)
    {
        profile.Visible = false;
        edit.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        profile.Visible = true;
        edit.Visible = false;
        String old = oldpassword.Text.ToString();
        
        if (old.Equals(pswd))
        {

            String fn =firstnameedit.Text.ToString();
            String ln =lastnameedit.Text.ToString();
            String oc = occupationedit.Text.ToString();
            String uv =universityedit.Text.ToString();
            String ct =cityedit.Text.ToString();
            String cn =countryedit.Text.ToString();
            String conno =contactnoedit.Text.ToString();
            String em = emailedit.Text.ToString();

            String ps = (passwordedit.Text.ToString() == null || passwordedit.Text.ToString() == "") ? pswd : passwordedit.Text.ToString();

            WebService wb = new WebService();
            bool test = wb.updatedb(fn, ln, oc, uv, ct, cn, conno, em, ps, userid);
            HttpPostedFile postedFile = imageupload.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = postedFile.ContentLength;
            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" ||
                fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryreader = new BinaryReader(stream);
                byte[] bytes = binaryreader.ReadBytes((int)stream.Length);
                string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("upldimage", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter paramName = new SqlParameter()
                    {
                        ParameterName = "@name",
                        Value = fileName
                    };
                    cmd.Parameters.Add(paramName);
                    SqlParameter paramSize = new SqlParameter()
                    {
                        ParameterName = "@size",
                        Value = fileSize
                    };
                    cmd.Parameters.Add(paramSize);
                    SqlParameter paramImagedata = new SqlParameter()
                    {
                        ParameterName = "@data",
                        Value = bytes
                    };
                    cmd.Parameters.Add(paramImagedata);
                    SqlParameter paramid = new SqlParameter()
                    {
                        ParameterName = "@id",
                        Value = (String)Session["userid"]
                    };
                    cmd.Parameters.Add(paramid);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            Response.Redirect("~/profile.aspx?id=" + (String)Session["userid"]);


        }
        else
        {
            wrong.Visible = true;

        }

    }

    
}