using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Drawing;

public partial class TTCRTrafficArea_TrafficHome : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        string loggedUsername = Session["USERNAME"] as string;
        traffic.InnerText = loggedUsername;
        getIdentifier();
    }

    protected void getIdentifier()
    {
        string loggedUsername = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getbranch = new SqlCommand("SELECT Branch From Traffics WHERE Phone_No ='" + loggedUsername + "'", con);
            SqlDataAdapter sda_getbranch = new SqlDataAdapter(cmd_getbranch);
            DataTable dt_getbranch = new DataTable();
            sda_getbranch.Fill(dt_getbranch);

           branch.InnerText = dt_getbranch.Rows[0][0].ToString();

        }
    }
}