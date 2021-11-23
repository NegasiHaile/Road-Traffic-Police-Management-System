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

public partial class TTCRTrafficArea_TaxiDetail : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    public string TaxiPlate;
    public string OwnerPhone;
    public string OwnerFullName;
    public string aDriverPhone;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            getTaxiDetail();
            getRecordsHistoryPertaxi();

        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }

    private void getTaxiDetail()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_TaxiDetailFromTaxistable = new SqlCommand("SELECT * FROM Taxis WHERE Plate ='" + Request.QueryString["Plate"].ToString() + "'", con);
            SqlDataAdapter sda_TaxiDetailFromTaxistable = new SqlDataAdapter(cmd_TaxiDetailFromTaxistable);
            DataTable dt_TaxiDetailFromTaxistable = new DataTable();
            sda_TaxiDetailFromTaxistable.Fill(dt_TaxiDetailFromTaxistable);

            spnTaxiPlate.InnerText = dt_TaxiDetailFromTaxistable.Rows[0][1].ToString();
            spnTaxiTaype.InnerText = dt_TaxiDetailFromTaxistable.Rows[0][3].ToString();
            spnTaxiLevel.InnerText = dt_TaxiDetailFromTaxistable.Rows[0][4].ToString();
            spnTaxiColor.InnerText = dt_TaxiDetailFromTaxistable.Rows[0][5].ToString();

            OwnerPhone = dt_TaxiDetailFromTaxistable.Rows[0][2].ToString();
            aDriverPhone = dt_TaxiDetailFromTaxistable.Rows[0][7].ToString();

            SqlCommand cmd_TaxiOwnerDetail = new SqlCommand("SELECT * FROM Owners WHERE Phone_No ='" + OwnerPhone + "'", con);
            SqlDataAdapter sda_TaxiOwnerDetail = new SqlDataAdapter(cmd_TaxiOwnerDetail);
            DataTable dt_TaxiOwnerDetail = new DataTable();
            sda_TaxiOwnerDetail.Fill(dt_TaxiOwnerDetail);

            OwnerFullName = dt_TaxiOwnerDetail.Rows[0][2].ToString() + " " + dt_TaxiOwnerDetail.Rows[0][3].ToString();
            spnOwnergender.InnerText = dt_TaxiOwnerDetail.Rows[0][5].ToString();
            spnOwnerPhone.InnerText = dt_TaxiOwnerDetail.Rows[0][1].ToString();
            spnOwnerTellephone.InnerText = dt_TaxiOwnerDetail.Rows[0][6].ToString();

            SqlCommand cmd_TaxiDriverDetail = new SqlCommand("SELECT * FROM Drivers WHERE Phone_No ='" + aDriverPhone + "'", con);
            SqlDataAdapter sda_TaxiDriverDetail = new SqlDataAdapter(cmd_TaxiDriverDetail);
            DataTable dt_TaxiDriverDetail = new DataTable();
            sda_TaxiDriverDetail.Fill(dt_TaxiDriverDetail);

            if (dt_TaxiDriverDetail.Rows.Count != 0)
            {
                spnDriverFullName.InnerText = dt_TaxiDriverDetail.Rows[0][2].ToString() + " " + dt_TaxiDriverDetail.Rows[0][3].ToString();
                spnDriverLicenseNo.InnerText = dt_TaxiDriverDetail.Rows[0][0].ToString();
                spnDriverPhoneNo.InnerText = dt_TaxiDriverDetail.Rows[0][1].ToString();
                SpnDriverStatus.InnerText = dt_TaxiDriverDetail.Rows[0][6].ToString();
            }
        }
    }


    private void getRecordsHistoryPertaxi()
    {
        TaxiPlate = Request.QueryString["Plate"].ToString();
        Page.DataBind();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_TodayRecoPerTrfc = new SqlCommand("SELECT * FROM Records WHERE Plate_No ='" + TaxiPlate + "' ORDER BY Id DESC", con);
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