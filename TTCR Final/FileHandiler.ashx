<%@ WebHandler Language="C#" Class="FileHandiler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class FileHandiler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        SqlDataReader rdr = null;
        SqlConnection conn = null;
        SqlCommand selcmd = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString);
            selcmd = new SqlCommand("select Image from tblImage where FileType='File' AND ReferenceID=" + context.Request.QueryString["ReferenceID"], conn);
            conn.Open();
            rdr = selcmd.ExecuteReader();
            while (rdr.Read())
            {
                context.Response.ContentType = "image/jpg";
                context.Response.BinaryWrite((byte[])rdr["Image"]);
            }
            rdr.Close();
        }
        finally
        {
            conn.Close();
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}