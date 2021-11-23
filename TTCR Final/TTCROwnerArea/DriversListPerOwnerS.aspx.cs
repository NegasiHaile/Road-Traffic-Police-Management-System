using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class TTCROwnerArea_DriversListPerOwnerS : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            getAllMyDrivers(); 
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }

    private void getAllMyDrivers()
    {
        string loggeduser = Session["USERNAME"].ToString();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getMyDrivers = new SqlCommand("SELECT * FROM Drivers WHERE Owner_Phone='" + loggeduser + "'", con);
            SqlDataAdapter sda_getMyDrivers = new SqlDataAdapter(cmd_getMyDrivers);
            DataTable dt_getMyDrivers = new DataTable();
            sda_getMyDrivers.Fill(dt_getMyDrivers);

            rptrMyDrivers.DataSource = dt_getMyDrivers;
            rptrMyDrivers.DataBind();
        }
    }
}