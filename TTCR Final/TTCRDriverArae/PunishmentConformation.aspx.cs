using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class TTCRDriverArae_PunishmentConformation : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            hShowEmptyMessage.Visible = false;
            //gettrafficDetail();
            getRecordData();
            makeContentsReadOnly();
           
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }
    private void makeContentsReadOnly()
    {
        tbPunishmentPurpose.ReadOnly = true;
        tbBranchName.ReadOnly = true;
        tbAddressregion.Enabled = false;
        tbAmmountInWords.ReadOnly = true;
        tbAmountInFigure.ReadOnly = true;
        tbDriverLicenseNO.ReadOnly = true;
        tbKebele.Enabled = false;
        tbpreparedBy.ReadOnly = true;
        tbPunishmentPurpose.ReadOnly = true;
        tbTaxiPlateNumber.ReadOnly = true;
        tbWereda.Enabled = false;
        tbZone.Enabled = false;

        rbCheck.Enabled = false;
        rbHolding.Enabled = false;
        rbSlip.Enabled = false;
        rbTransfer.Enabled = false;
        rbCash.Enabled = false;

        tbInCashRefNo.ReadOnly = true;
        tbInCashDate.ReadOnly = true;
        tbInCheckrefNo.ReadOnly = true;
        tbInCheckrefDate.ReadOnly = true;
        tbInSlipRefNo.ReadOnly = true;
        tbInSlipRefDate.ReadOnly = true;
        tbInTransferRefNo.ReadOnly = true;
        tbInTransferRefDate.ReadOnly = true;
    }
    protected string findLicense()
    {
        string loggeduser = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
             SqlCommand cmd_findLicenseNo = new SqlCommand("SELECT license_Id FROM Drivers WHERE Phone_No='" + loggeduser + "'", con);
            SqlDataAdapter sda_findLicenseNo = new SqlDataAdapter(cmd_findLicenseNo);
            DataTable dt_findLicenseNo = new DataTable();
            sda_findLicenseNo.Fill(dt_findLicenseNo);

            return dt_findLicenseNo.Rows[0][0].ToString();
        }
            
    }

    private void gettrafficDetail(int VocherNo)
    {
        
        
        using (SqlConnection con = new SqlConnection(CS))
        {

            SqlCommand cmd_trafficPhone = new SqlCommand("SELECT Traffi_Phone FROM Records WHERE Id='" + VocherNo + "'", con);
            SqlDataAdapter sda_trafficPhone = new SqlDataAdapter(cmd_trafficPhone);
            DataTable dt_trafficPhone = new DataTable();
            sda_trafficPhone.Fill(dt_trafficPhone);

            string Phone_No = dt_trafficPhone.Rows[0][0].ToString();

            SqlCommand cmd_trafficDeatil = new SqlCommand("SELECT FName, MName, Branch FROM Traffics WHERE Phone_No='" + Phone_No + "'", con);
            SqlDataAdapter sda_trafficDeatil = new SqlDataAdapter(cmd_trafficDeatil);
            DataTable dt_trafficDeatil = new DataTable();
            sda_trafficDeatil.Fill(dt_trafficDeatil);

             tbBranchName.Text = dt_trafficDeatil.Rows[0][2].ToString();
             tbpreparedBy.Text = dt_trafficDeatil.Rows[0][0].ToString() + " " + dt_trafficDeatil.Rows[0][1].ToString();
        }
    }
    protected int getVocherNo(string LicenseNO)
    {

        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getVocharNo = new SqlCommand("SELECT Id FROM Records WHERE Dirver_license_No='" + LicenseNO + "' AND Driver_Agreement ='PENDDING'", con);
            SqlDataAdapter sda_getVocharNo = new SqlDataAdapter(cmd_getVocharNo);
            DataTable dt_getVocharNo = new DataTable();
            sda_getVocharNo.Fill(dt_getVocharNo);
            if (dt_getVocharNo.Rows.Count == 1)
            {
                spnReceiptVocherNo.InnerText = dt_getVocharNo.Rows[0][0].ToString();
                return int.Parse(dt_getVocharNo.Rows[0][0].ToString());
            }

            if (dt_getVocharNo.Rows.Count > 1)
            {
                spnReceiptVocherNo.InnerText = dt_getVocharNo.Rows[0][0].ToString();
                return int.Parse(dt_getVocharNo.Rows[0][0].ToString());
            }
            else
            {
                return 0;
            }
           
            // return int.Parse(dt_getVocharNo.Rows[0][0]);
        }
        
    }
    private void getRecordData()
    {
        string LicenseNO = findLicense();
        tbDriverLicenseNO.Text = LicenseNO;
        int VocherNo = getVocherNo(LicenseNO);
        string loggeduser = Session["USERNAME"] as string;

        

        spnReceiptVocherNo.InnerText = VocherNo.ToString();

        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchRecordDetail = new SqlCommand("SELECT * FROM Records WHERE Id='" + VocherNo + "'", con);
            SqlDataAdapter sda_fetchRecordDetail = new SqlDataAdapter(cmd_fetchRecordDetail);
            DataTable dt_fetchRecordDetail = new DataTable();
            sda_fetchRecordDetail.Fill(dt_fetchRecordDetail);

            if (dt_fetchRecordDetail.Rows.Count != 0)
            {
                tbBranchName.Text = dt_fetchRecordDetail.Rows[0][2].ToString();
                tbDriverLicenseNO.Text = dt_fetchRecordDetail.Rows[0][5].ToString();
                tbTaxiPlateNumber.Text = dt_fetchRecordDetail.Rows[0][4].ToString();

                if (dt_fetchRecordDetail.Rows[0][7].ToString() == "Cash")
                {
                    rbCash.Checked = true;
                    tbInCashRefNo.Text = dt_fetchRecordDetail.Rows[0][8].ToString();
                    tbInCashDate.Text = dt_fetchRecordDetail.Rows[0][6].ToString();
                }
                if (dt_fetchRecordDetail.Rows[0][7].ToString() == "Check")
                {
                    rbCheck.Checked = true;
                    tbInCheckrefNo.Text = dt_fetchRecordDetail.Rows[0][8].ToString();
                    tbInCheckrefDate.Text = dt_fetchRecordDetail.Rows[0][6].ToString();
                }
                if (dt_fetchRecordDetail.Rows[0][7].ToString() == "Slip")
                {
                    rbSlip.Checked = true;
                    tbInSlipRefNo.Text = dt_fetchRecordDetail.Rows[0][8].ToString();
                    tbInSlipRefDate.Text = dt_fetchRecordDetail.Rows[0][6].ToString();
                }
                if (dt_fetchRecordDetail.Rows[0][7].ToString() == "Transfer")
                {
                    rbTransfer.Checked = true;
                    tbInTransferRefNo.Text = dt_fetchRecordDetail.Rows[0][8].ToString();
                    tbInTransferRefDate.Text = dt_fetchRecordDetail.Rows[0][6].ToString();
                }
                if (dt_fetchRecordDetail.Rows[0][7].ToString() == "Holding")
                {
                    rbHolding.Checked = true;
                }
                else
                {

                }

                tbAmountInFigure.Text = dt_fetchRecordDetail.Rows[0][9].ToString() + " BIRR";
                tbAmmountInWords.Text = dt_fetchRecordDetail.Rows[0][10].ToString();
                tbPunishmentPurpose.Text = dt_fetchRecordDetail.Rows[0][11].ToString();
                gettrafficDetail(VocherNo);

            }
        
            else
            {
                divrecordDetail.Visible = false;
                hShowEmptyMessage.Visible = true;
            }
        }
    }

    protected void lbtnConfirmPunshiment_Click(object sender, EventArgs e)
    {
        using(SqlConnection con = new SqlConnection(CS))
        {
           int VocherNo = int.Parse(spnReceiptVocherNo.InnerText);
            con.Open();
            SqlCommand cmd_acceptPunishment = new SqlCommand("UPDATE Records SET Driver_Agreement = 'CONFIRMED' WHERE Id='" + VocherNo + "'", con);

            cmd_acceptPunishment.ExecuteNonQuery();
          
            con.Close();
           
            //Response.Redirect("PunishmentConformation.aspx");
            Response.Write("<script language=javascript>alert('Confermation done siccessfully!')</script>");

        }
        }
}