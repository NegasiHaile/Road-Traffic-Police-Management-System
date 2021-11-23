using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class TTCRDriverArae_DriverArae : System.Web.UI.MasterPage
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            getDeviantInSearch();
            getPunishimentPerDeiver();

        }

        else
        {
            Response.Redirect("~/LoginPage.aspx");
        }
    }
    
    protected void lbtnLout_click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        Response.Redirect("~/LoginPage.aspx");
    }

    private void getDeviantInSearch()
    {
        string loggeduser = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //SqlCommand cmd_getDeviants = new SqlCommand("SELECT * FROM Deviants WHERE Status ='InSearch'", con);
            SqlCommand cmd_DeviatsInSearchPerDriver = new SqlCommand("SELECT * FROM Deviants WHERE  Driver_Phone='" + loggeduser + "' AND Status ='InSearch'", con);
            SqlDataAdapter sda_DeviatsInSearchPerDriver = new SqlDataAdapter(cmd_DeviatsInSearchPerDriver);
            DataTable dt_DeviatsInSearchPerDriver = new DataTable();
            sda_DeviatsInSearchPerDriver.Fill(dt_DeviatsInSearchPerDriver);

            int DeviantsInSearch = dt_DeviatsInSearchPerDriver.Rows.Count;

          //  spnDangersQuantity.InnerText = dt_DeviatsInSearchPerDriver.Rows.Count.ToString();

        }
    }
    protected string get_Licese_No(string loggeduser)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            //SqlCommand cmd_checkDriverStatus = new SqlCommand("SELECT Driver_Phone FROM Taxis WHERE Phone_No='" + loggeduser + "'", con);
            //SqlDataAdapter sda_checkDriverStatus = new SqlDataAdapter(cmd_checkDriverStatus);
            //DataTable dt_checkDriverStatus = new DataTable();
            //sda_checkDriverStatus.Fill(dt_checkDriverStatus);

            SqlCommand cmd_findLicenseNo = new SqlCommand("SELECT license_Id FROM Drivers WHERE Phone_No='" + loggeduser + "'", con);
            SqlDataAdapter sda_findLicenseNo = new SqlDataAdapter(cmd_findLicenseNo);
            DataTable dt_findLicenseNo = new DataTable();
            sda_findLicenseNo.Fill(dt_findLicenseNo);

            return dt_findLicenseNo.Rows[0][0].ToString();
        }
    }
    private void getPunishimentPerDeiver()
    {
        string loggeduser = Session["USERNAME"] as string;

        string License_No = get_Licese_No(loggeduser);

        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getVocharNo = new SqlCommand("SELECT Id FROM Records WHERE Dirver_license_No='" + License_No + "' AND Driver_Agreement ='PENDDING'", con);
            SqlDataAdapter sda_getVocharNo = new SqlDataAdapter(cmd_getVocharNo);
            DataTable dt_getVocharNo = new DataTable();
            sda_getVocharNo.Fill(dt_getVocharNo);
            spnPunishmentPerDriver.InnerText = dt_getVocharNo.Rows.Count.ToString();
        }
        }
}
