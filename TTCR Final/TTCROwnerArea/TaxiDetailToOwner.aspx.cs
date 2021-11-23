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

public partial class TTCROwnerArea_TaxiDetailToOwner : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    public string TaxiPlate;
    public string aDriverPhone;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            //getTaxiDetail();
            gertRecordsHistoryPertaxi();
            
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }

        
    }

    //private void getTaxiDetail()
    //{
    //    string Plate = Request.QueryString["Plate"].ToString();
    //    using (SqlConnection con = new SqlConnection(CS))
    //    {

    //        SqlCommand cmd_getTaxiDetail = new SqlCommand("SELECT * FROM Taxis WHERE Plate ='" + Plate + "'", con);
    //        SqlDataAdapter sda_getTaxiDetail = new SqlDataAdapter(cmd_getTaxiDetail);
    //        DataTable dt_getTaxiDetail = new DataTable();
    //        sda_getTaxiDetail.Fill(dt_getTaxiDetail);

    //        aDriverPhone = dt_getTaxiDetail.Rows[0][7].ToString();
    //        Page.DataBind();

    //        spnTaxiId.InnerText = dt_getTaxiDetail.Rows[0][0].ToString();
    //        spntaxidriverPhone.InnerText = dt_getTaxiDetail.Rows[0][7].ToString();

    //    }
    //    }

    private void gertRecordsHistoryPertaxi()
    {
        TaxiPlate = Request.QueryString["Plate"].ToString();
        Page.DataBind();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_TodayRecoPerTrfc = new SqlCommand("SELECT * FROM Records WHERE Plate_No ='" + TaxiPlate + "' ORDER BY Date DESC", con);
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