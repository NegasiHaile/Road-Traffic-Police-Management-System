using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class TTCROwnerArea_OwnerArae : System.Web.UI.MasterPage
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
        string loggeduser = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //SqlCommand cmd_getDeviants = new SqlCommand("SELECT * FROM Deviants WHERE Status ='InSearch'", con);
            SqlCommand cmd_DeviatsInSearchPerOwner = new SqlCommand("SELECT * FROM Deviants WHERE  Owner_Phone='" + loggeduser + "' AND Status ='InSearch'  ORDER BY DateTime ASC", con);
            SqlDataAdapter sda_DeviatsInSearchPerOwner = new SqlDataAdapter(cmd_DeviatsInSearchPerOwner);
            DataTable dt_DeviatsInSearchPerOwner = new DataTable();
            sda_DeviatsInSearchPerOwner.Fill(dt_DeviatsInSearchPerOwner);

            int DeviantsInSearch = dt_DeviatsInSearchPerOwner.Rows.Count;

            spnDangersQuantity.InnerText = dt_DeviatsInSearchPerOwner.Rows.Count.ToString();

        }
    }
}
