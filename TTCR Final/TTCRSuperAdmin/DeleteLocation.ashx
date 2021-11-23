<%@ WebHandler Language="C#" Class="DeleteLocation" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public class DeleteLocation : IHttpHandler {
     string cs = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    
    public void ProcessRequest (HttpContext context) {
         using (SqlConnection con =new SqlConnection(cs))
        {
            SqlCommand cmd_DeleteTraffic = new SqlCommand("DELETE FROM Locations WHERE Id ='"+context.Request.QueryString["Id"].ToString()+"'", con);
            // SqlCommand toDelete_Order = new SqlCommand("Delete From ProductOrder WHERE Order_Id='" + OrderID + "'", con);
            //SqlCommand cmd_Traffic_Account = new SqlCommand("DELETE FROM Accounts WHERE Phone_No ='"+context.Request.QueryString["Phone_No"].ToString()+"'", con);

           // SqlCommand cmd_Traffic_Photo = new SqlCommand("DELETE FROM tblImage WHERE ReferenceID ='"+context.Request.QueryString["Phone_No"].ToString()+"'", con);
            con.Open();
            cmd_DeleteTraffic.ExecuteNonQuery();
           // cmd_Traffic_Account.ExecuteNonQuery();
           // cmd_Traffic_Photo.ExecuteNonQuery();
            con.Close();

            context.Response.Redirect("ListOfLocations.aspx");
           // context.Response.Write("<script language=javascript>alert('Location deleted Successfuly!')</script>");
            
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}