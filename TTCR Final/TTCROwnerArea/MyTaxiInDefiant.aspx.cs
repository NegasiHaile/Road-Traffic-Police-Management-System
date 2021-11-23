using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

public partial class TTCROwnerArea_MyTaxiInDefiant : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["USERNAME"] != null)
        {
            getListOfDeviants();
        }
        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }
    private void getListOfDeviants()
    {
        string loggeduser = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_DeviatsInSearchPerOwner = new SqlCommand("SELECT * FROM Deviants WHERE  Owner_Phone='"+ loggeduser + "' AND Status ='InSearch'  ORDER BY DateTime ASC", con);
            SqlDataAdapter sda_DeviatsInSearchPerOwner = new SqlDataAdapter(cmd_DeviatsInSearchPerOwner);
            DataTable dt_DeviatsInSearchPerOwner = new DataTable();
            sda_DeviatsInSearchPerOwner.Fill(dt_DeviatsInSearchPerOwner);

            int TodayRecoPerTrfc = dt_DeviatsInSearchPerOwner.Rows.Count;

            rptrDeviatsInSearch.DataSource = dt_DeviatsInSearchPerOwner;
            rptrDeviatsInSearch.DataBind();
        }
    }
}