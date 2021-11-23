using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class TTCRBranchAdmin_TrafficsOfSingleBranch : System.Web.UI.Page
{

    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {

            getAllBranchTraffics();

        }

        else
        {
            Response.Redirect("~/LoginPage.aspx");
        }
    }
    protected string getBranchName()
    {
        string loggedUsername = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getbranch = new SqlCommand("SELECT Branch From Traffics WHERE Phone_No ='" + loggedUsername + "'", con);
            SqlDataAdapter sda_getbranch = new SqlDataAdapter(cmd_getbranch);
            DataTable dt_getbranch = new DataTable();
            sda_getbranch.Fill(dt_getbranch);

            return dt_getbranch.Rows[0][0].ToString();

        }
    }
    private void getAllBranchTraffics()
    {
        string Branch_Name = getBranchName();
       using (SqlConnection con =new SqlConnection(CS))
        {
            SqlCommand cmd_getbranchtraffics = new SqlCommand("SELECT * FROM Traffics WHERE Branch = '"+ Branch_Name + "' AND Responsibility!='Branch Officer'", con);
            SqlDataAdapter sda_getbranchtraffics = new SqlDataAdapter(cmd_getbranchtraffics);
            DataTable dt_getbranchtraffics = new DataTable();
            sda_getbranchtraffics.Fill(dt_getbranchtraffics);

            rptrListOfBranchtraffics.DataSource = dt_getbranchtraffics;
            rptrListOfBranchtraffics.DataBind();
        }
    }
}