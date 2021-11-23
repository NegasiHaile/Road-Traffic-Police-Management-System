using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class TTCRTrafficArea_ListOfLocations : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["USERNAME"] != null)
        {

        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
        getListOLocations();

    }
    private string getUserBranch()
    {
        string loggeduser = Session["USERNAME"] as string;

        try
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd_getUserBranch = new SqlCommand("SELECT Branch FROM Traffics WHERE Phone_No = '" + loggeduser + "'", con);
                SqlDataAdapter sda_getUserBranch = new SqlDataAdapter(cmd_getUserBranch);
                DataTable dt_getUserBranch = new DataTable();
                sda_getUserBranch.Fill(dt_getUserBranch);

                string branch = dt_getUserBranch.Rows[0][0].ToString();
                con.Close();
                return branch;
            }
        }

        catch
        {
            return null;
        }
    }

    private void getListOLocations()
    {

        string branch = getUserBranch();
        spnbranchname.InnerText = branch;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getLocations = new SqlCommand("SELECT * FROM Locations WHERE BranchName ='"+ branch + "'", con);
            SqlDataAdapter sda_getLocations = new SqlDataAdapter(cmd_getLocations);
            DataTable dt_getLocations = new DataTable();
            sda_getLocations.Fill(dt_getLocations);

            rptrAllLocations.DataSource = dt_getLocations;
            rptrAllLocations.DataBind();
        }
    }
}