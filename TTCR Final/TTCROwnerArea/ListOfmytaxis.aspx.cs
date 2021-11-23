using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class TTCROwnerArea_ListOfmytaxis : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
       if(Session["USERNAME"] != null)
        {
            getAllTaxis();
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }

    public void getAllTaxis()
    {
        string loggeduser = Session["USERNAME"].ToString();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getMyTaxis = new SqlCommand("SELECT * FROM Taxis WHERE Owner_Phone='"+ loggeduser + "'", con);
            SqlDataAdapter sda_getMyTaxis = new SqlDataAdapter(cmd_getMyTaxis);
            DataTable dt_getMyTaxis = new DataTable();
            sda_getMyTaxis.Fill(dt_getMyTaxis);

            rptrMyTaxis.DataSource = dt_getMyTaxis;
            rptrMyTaxis.DataBind();
        }
    }
    // Response.Write("<script language=javascript> var confimValue = confirm('Are you sure you are ready to do this action?' ); if(confimValue == true){ alert('You are'+confimValue ); } else{alert('You are'+confimValue ); } </script>");
}