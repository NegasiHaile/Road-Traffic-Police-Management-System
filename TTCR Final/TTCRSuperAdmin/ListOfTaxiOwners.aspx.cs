using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class TTCRSuperAdmin_ListOfTaxiOwners : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            getAllOwners();

        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
        
    }

    public void getAllOwners()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getAllOwners = new SqlCommand("SELECT * FROM Owners", con);
            SqlDataAdapter sda_getAllOwners = new SqlDataAdapter(cmd_getAllOwners);
            DataTable dt_getAllOwners = new DataTable();
            sda_getAllOwners.Fill(dt_getAllOwners);

            rptrAllTaxiOwners.DataSource = dt_getAllOwners;
            rptrAllTaxiOwners.DataBind();
        }
    }
}