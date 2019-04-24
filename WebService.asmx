<%@ WebService Language="C#" Class="WebService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Web.Script.Serialization;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]

public class WebService  : System.Web.Services.WebService {

    public static byte[] GetPhoto(string filePath)
    {
        FileStream stream = new FileStream(
            filePath, FileMode.Open, FileAccess.Read);
        BinaryReader reader = new BinaryReader(stream);

        byte[] photo = reader.ReadBytes((int)stream.Length);

        reader.Close();
        stream.Close();

        return photo;
    } 
    
    [WebMethod]
    public bool insertdb(string f_name,string l_name,string id,string password,string email) {
        bool t = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
        con.Open();
        string q = "insert into[usertable](id, password, first_Name, email, last_name) values('" + id + "','" + password + "','"+f_name+"','"+email+"','"+l_name+"')";
        SqlCommand cmd = new SqlCommand(q,con);
        try
        {
            int i = cmd.ExecuteNonQuery();
            if (i > 0) t = true;
            con.Close();
            insertimage(id);
            return t;
        }
        catch (Exception e) {
            return false;
        }
    }

    protected void insertimage(string id) {

        
        string fileName = "user.png";
        string fileExtension = ".png";
        int fileSize = 20;
        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" ||
            fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
        {
            byte[] bytes = GetPhoto("D:/Web_project_2/style/user.png");
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
                    Value =id
                };
                cmd.Parameters.Add(paramid);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
    
    [WebMethod]
    public int login(string id,string password)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
        con.Open();
        string q = "select count(*) from [usertable] where id='"+id+"' and password='"+password+"'";
        SqlCommand cmd = new SqlCommand(q, con);
        Int32 verify;
        verify=Convert.ToInt32(cmd.ExecuteScalar());
        
        if (verify > 0) 
        {
            q = "select count(*) from [usertable] where id='" + id + "' and password='" + password + "' and admin='1'";
            verify = 0;
            cmd = new SqlCommand(q, con);
            verify = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (verify > 0) return 2;
            return 1;
        }
        con.Close();
        return 0;
    }
    

    [WebMethod]
    public bool updatedb(string f_name, string l_name,string occupation,string university,string city,string country,string contactno,string email,string password,string id)
    {
        bool t = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
        con.Open();
        string q = "update [usertable] set password='"+password+"', first_name='"+f_name+"', email='"+email+"', last_name='"+l_name+"', occupation='"+occupation+"', university='"+university+"', city='"+city+"', country='"+country+"', contactno='"+contactno+"'  where id='"+id+"'";
        SqlCommand cmd = new SqlCommand(q, con);
        int i = cmd.ExecuteNonQuery();
        if (i > 0) t = true;
        con.Close();
        return t;
    }
    [WebMethod]
    public void UserNameExists(string userName)
    {
        bool usernameinuse = false;
        string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spUserNameExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@UserName",
                Value = userName
            });

            con.Open();
            usernameinuse = Convert.ToBoolean(cmd.ExecuteScalar());
        }
        Registration registration = new Registration();
        registration.UserName = userName;
        registration.UserNameInUse = usernameinuse;
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(registration));
    }
    

    
   
    
    
}