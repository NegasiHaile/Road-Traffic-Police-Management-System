using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class TTCRTrafficArea_TrafficArea : System.Web.UI.MasterPage
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            getDeviantInSearch();

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
        using(SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getDeviants = new SqlCommand("SELECT * FROM Deviants WHERE Status ='InSearch'", con);
            SqlDataAdapter sda_getDeviants = new SqlDataAdapter(cmd_getDeviants);
            DataTable dt_getDeviants = new DataTable();
            sda_getDeviants.Fill(dt_getDeviants);

            int DeviantsInSearch = dt_getDeviants.Rows.Count;

            spnDangersQuantity.InnerText = dt_getDeviants.Rows.Count.ToString();

        }
    }
}
