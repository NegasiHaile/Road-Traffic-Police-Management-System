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

public partial class TTCRSuperAdmin_AllCrimesList : System.Web.UI.Page
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
            getTheWholeRecords();

        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }

    private void getTheWholeRecords()
    {
        //TaxiPlate = Request.QueryString["Plate"].ToString();
        //Page.DataBind();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_TheWholeRecords = new SqlCommand("SELECT * FROM Records ORDER BY Id DESC", con);
            SqlDataAdapter sda_TheWholeRecords = new SqlDataAdapter(cmd_TheWholeRecords);
            DataTable dt_TheWholeRecords = new DataTable();
            sda_TheWholeRecords.Fill(dt_TheWholeRecords);

           // rptrTheWholeRecords.DataSource = dt_TheWholeRecords;

            rptrTheWholeRecords.DataSource = dt_TheWholeRecords;
            rptrTheWholeRecords.DataBind();
            // int TodayRecoPerTrfc = dt_TodayRecoPerTrfc.Rows.Count;
            // spnRecordesOnThisLocation.InnerText = TodayRecoPerTrfc.ToString();

            //float TodayRecoTotalIncomePerTraf = 0;
            //for (int i = 0; i < TodayRecoPerTrfc; i++)
            //{
            //    //float takevalue = 
            //    TodayRecoTotalIncomePerTraf = TodayRecoTotalIncomePerTraf + float.Parse(dt_TodayRecoPerTrfc.Rows[i][9].ToString());
            //}
            //spnTotalIncomePerLoct.InnerText = TodayRecoTotalIncomePerTraf.ToString();

        }
    }
}