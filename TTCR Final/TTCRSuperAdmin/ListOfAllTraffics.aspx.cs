using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text;
using System.Drawing;

public partial class TTCRSuperAdmin_ListOfAllTraffics : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        getAllTraffics();
        EmployeesWithNoWork();
    }

    public void getAllTraffics()
    {

        using (SqlConnection con = new SqlConnection(CS))
        {


            //SqlCommand cmd_GetTraffics = new SqlCommand("Select * From Traffics Order by EplyID DESC", con);

            SqlCommand cmd_GetTraffics = new SqlCommand("Select * From Traffics Order by EplyID ASC", con);
            SqlDataAdapter sda_GetTraffics = new SqlDataAdapter(cmd_GetTraffics);
            DataTable dt_GetTraffics = new DataTable();
            sda_GetTraffics.Fill(dt_GetTraffics);

            NoTotalTrafficsInZone.InnerHtml = dt_GetTraffics.Rows.Count.ToString();
            //NOSubscribers.InnerHtml = dt_GetDstrs.Rows.Count.ToString();

            rptrAllTraffics.DataSource = dt_GetTraffics;
            rptrAllTraffics.DataBind();
            //rptrAllDistributirs.DataSource = dt_GetDstrs;
            //rptrAllDistributirs.DataBind();


            SqlCommand cmd_GetHeadOfficers = new SqlCommand("Select * From Traffics Where Responsibility='Branch Officer'", con);
            SqlDataAdapter sda_GetHeadOfficers = new SqlDataAdapter(cmd_GetHeadOfficers);
            DataTable dt_GetHeadOfficers = new DataTable();
            sda_GetHeadOfficers.Fill(dt_GetHeadOfficers);

            NoHeadOfficers.InnerHtml = dt_GetHeadOfficers.Rows.Count.ToString();

            SqlCommand cmd_GetCrimeIdentfier = new SqlCommand("Select * From Traffics Where Responsibility='Crime Identifier'", con);
            SqlDataAdapter sda_GetCrimeIdentfier = new SqlDataAdapter(cmd_GetCrimeIdentfier);
            DataTable dt_GetCrimeIdentfier = new DataTable();
            sda_GetCrimeIdentfier.Fill(dt_GetCrimeIdentfier);

            NoCrimeIdentfier.InnerHtml = dt_GetCrimeIdentfier.Rows.Count.ToString();

            SqlCommand cmd_GetTechinical = new SqlCommand("Select * From Traffics Where Responsibility='Techinical'", con);
            SqlDataAdapter sda_GetTechinical = new SqlDataAdapter(cmd_GetTechinical);
            DataTable dt_GetTechinical = new DataTable();
            sda_GetTechinical.Fill(dt_GetTechinical);

            NoTechnical.InnerText = dt_GetTechinical.Rows.Count.ToString();

            SqlCommand cmd_GetOutOffice = new SqlCommand("Select * From Traffics Where Responsibility='Out Office'", con);
            SqlDataAdapter sda_GetOutOffice = new SqlDataAdapter(cmd_GetOutOffice);
            DataTable dt_GetOutOffice = new DataTable();
            sda_GetOutOffice.Fill(dt_GetOutOffice);

            NoOutOffice.InnerHtml = dt_GetOutOffice.Rows.Count.ToString();
        }
    }

    private void EmployeesWithNoWork()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_GetBranchUnassined = new SqlCommand("Select * From Traffics Where Branch='//// Not Assigned ////'", con);
            SqlDataAdapter sda_GetBranchUnassined = new SqlDataAdapter(cmd_GetBranchUnassined);
            DataTable dt_GetBranchUnassined = new DataTable();
            sda_GetBranchUnassined.Fill(dt_GetBranchUnassined);

            No_of_BranchUnassineg.InnerText = dt_GetBranchUnassined.Rows.Count.ToString();

            SqlCommand cmd_GetResponsibilityUnassined = new SqlCommand("Select * From Traffics Where Responsibility = '//// No Responsibilty ////'", con);
            SqlDataAdapter sda_GetResponsibilityUnassined = new SqlDataAdapter(cmd_GetResponsibilityUnassined);
            DataTable dt_GetResponsibilityUnassined = new DataTable();
            sda_GetResponsibilityUnassined.Fill(dt_GetResponsibilityUnassined);

            NoResponsibiltyUnassineg.InnerText = dt_GetResponsibilityUnassined.Rows.Count.ToString();

            SqlCommand cmd_GetBothUnassined = new SqlCommand("Select * From Traffics Where Branch='//// Not Assigned ////' AND Responsibility = '//// No Responsibilty ////'", con);
            SqlDataAdapter sda_GetBothUnassined = new SqlDataAdapter(cmd_GetBothUnassined);
            DataTable dt_GetBothUnassined = new DataTable();
            sda_GetBothUnassined.Fill(dt_GetBothUnassined);

            NoBothUnassineg.InnerText = dt_GetBothUnassined.Rows.Count.ToString();

            SqlCommand cmd_GetOFFAccounts = new SqlCommand("Select * From Accounts Where Account_Status='OFF'", con);
            SqlDataAdapter sda_GetOFFAccounts = new SqlDataAdapter(cmd_GetOFFAccounts);
            DataTable dt_GetOFFAccounts = new DataTable();
            sda_GetOFFAccounts.Fill(dt_GetOFFAccounts);

            NoOffAccounts.InnerText = dt_GetOFFAccounts.Rows.Count.ToString();
        }
        }
}