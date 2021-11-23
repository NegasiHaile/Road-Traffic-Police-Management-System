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

public partial class TTCRTrafficArea_DeviantsList : System.Web.UI.Page
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
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_DeviatsInSearch = new SqlCommand("SELECT * FROM Deviants WHERE Status ='InSearch' ORDER BY DateTime ASC", con);
            SqlDataAdapter sda_DeviatsInSearch = new SqlDataAdapter(cmd_DeviatsInSearch);
            DataTable dt_DeviatsInSearch = new DataTable();
            sda_DeviatsInSearch.Fill(dt_DeviatsInSearch);

            int TodayRecoPerTrfc = dt_DeviatsInSearch.Rows.Count;
            
            rptrDeviatsInSearch.DataSource = dt_DeviatsInSearch;
            rptrDeviatsInSearch.DataBind();
        }
    }
}