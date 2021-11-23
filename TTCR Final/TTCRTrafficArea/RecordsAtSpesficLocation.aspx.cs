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

public partial class TTCRTrafficArea_RecordsAtSpesficLocation : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            gertTodaysRecordsPerTraffic();
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }
    protected string getLoctName()
    {
        int id = int.Parse(Request.QueryString["Id"].ToString());
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getLoctById = new SqlCommand("SELECT * FROM Locations WHERE Id ='" + id + "'", con);
            SqlDataAdapter sda_getLoctById = new SqlDataAdapter(cmd_getLoctById);
            DataTable dt_getLoctById = new DataTable();
            sda_getLoctById.Fill(dt_getLoctById);

            return dt_getLoctById.Rows[0][2].ToString();
        }
        }
    private void gertTodaysRecordsPerTraffic()
    {
        string loggeduser = Session["USERNAME"] as string;
        string LoctName = getLoctName(); 
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_TodayRecoPerTrfc = new SqlCommand("SELECT * FROM Records WHERE Loct_Name ='" + LoctName +  "' ORDER BY Date ASC", con);
            SqlDataAdapter sda_TodayRecoPerTrfc = new SqlDataAdapter(cmd_TodayRecoPerTrfc);
            DataTable dt_TodayRecoPerTrfc = new DataTable();
            sda_TodayRecoPerTrfc.Fill(dt_TodayRecoPerTrfc);

            int TodayRecoPerTrfc = dt_TodayRecoPerTrfc.Rows.Count;
            spnRecordesOnThisLocation.InnerText = TodayRecoPerTrfc.ToString();

            float TodayRecoTotalIncomePerTraf = 0;
            for (int i = 0; i < TodayRecoPerTrfc; i++)
            {
                //float takevalue = 
                TodayRecoTotalIncomePerTraf = TodayRecoTotalIncomePerTraf + float.Parse(dt_TodayRecoPerTrfc.Rows[i][9].ToString());
            }
            spnTotalIncomePerLoct.InnerText = TodayRecoTotalIncomePerTraf.ToString();


            rptrRecordsPerLoct.DataSource = dt_TodayRecoPerTrfc;
            rptrRecordsPerLoct.DataBind();

        }
    }
}