using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class TTCRSuperAdmin_ListOfLocations : System.Web.UI.Page
{

    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        getListOLocations();
    }


    private void getListOLocations()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getLocations = new SqlCommand("SELECT * FROM Locations", con);
            SqlDataAdapter sda_getLocations = new SqlDataAdapter(cmd_getLocations);
            DataTable dt_getLocations = new DataTable();
            sda_getLocations.Fill(dt_getLocations);

            rptrAllLocations.DataSource = dt_getLocations;
            rptrAllLocations.DataBind();
        }
    }
}