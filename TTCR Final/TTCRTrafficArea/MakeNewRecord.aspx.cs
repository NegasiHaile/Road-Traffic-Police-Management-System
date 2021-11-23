using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class TTCRTrafficArea_MakeNewRecord : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["USERNAME"] != null)
        {
            spnDate.InnerText = DateTime.Now.ToShortDateString().ToString();
            tbInCashDate.Text = DateTime.Now.ToShortDateString().ToString();
            tbInCheckrefDate.Text = DateTime.Now.ToShortDateString().ToString(); 
            tbInSlipRefDate.Text = DateTime.Now.ToShortDateString().ToString();
            tbInTransferRefDate.Text = DateTime.Now.ToShortDateString().ToString();
            rbCash.Checked = true;
            tbpreparedBy.Enabled = false;
            getReceiptVocherNo();
            gettrafficDetail();

            
        }
        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
        
    }

    private void getReceiptVocherNo()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getReceiptVocherNo = new SqlCommand("SELECT id FROM Records", con);
            SqlDataAdapter sda_getReceiptVocherNo = new SqlDataAdapter(cmd_getReceiptVocherNo);
            DataTable dt_getReceiptVocherNo = new DataTable();
            sda_getReceiptVocherNo.Fill(dt_getReceiptVocherNo);

            int bigvocher = 0;
            int valu = 0;
            for(int i = 0; i < dt_getReceiptVocherNo.Rows.Count; i++)
            {
                valu = int.Parse(dt_getReceiptVocherNo.Rows[i][0].ToString());
                if (bigvocher <= valu)
                {
                    bigvocher = valu + 1;
                }
            }

            spnReceiptVocherNo.InnerText = bigvocher.ToString();
        }
        }

    protected string getPaymentType()
    {
        if (rbCash.Checked)
        {
            return  "Cash";
        }

        if (rbCheck.Checked)
        {
            return "Check";
        }

        if (rbSlip.Checked)
        {
            return "Slip";
        }

        if (rbTransfer.Checked)
        {
            return "Transfer";
        }

        if (rbHolding.Checked)
        {
            return "Holding";
        }
        else
        {
            return "Cash";
        }
    }

    protected string CheckTaxiPresence()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_CheckTaxiPresence = new SqlCommand("SELECT Plate FROM Taxis WHERE Plate='" + tbTaxiPlateNumber.Text + "'", con);
            SqlDataAdapter sda_CheckTaxiPresence = new SqlDataAdapter(cmd_CheckTaxiPresence);
            DataTable dt_CheckTaxiPresence = new DataTable();
            sda_CheckTaxiPresence.Fill(dt_CheckTaxiPresence);

            if(dt_CheckTaxiPresence.Rows.Count == 1)
            {
                return "YES";
            }
            else
            {
                return "NO";
            }
        }


        }
    private void gettrafficDetail()
    {
        try
        {
            string loggeduser = Session["USERNAME"] as string;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd_trafficDeatil = new SqlCommand("SELECT FName, MName, Branch FROM Traffics WHERE Phone_No='" + loggeduser + "'", con);
                SqlDataAdapter sda_trafficDeatil = new SqlDataAdapter(cmd_trafficDeatil);
                DataTable dt_trafficDeatil = new DataTable();
                sda_trafficDeatil.Fill(dt_trafficDeatil);

                tbBranchName.Text = dt_trafficDeatil.Rows[0][2].ToString();
                tbpreparedBy.Text = dt_trafficDeatil.Rows[0][0].ToString() + " " + dt_trafficDeatil.Rows[0][1].ToString();
            }
        }

        catch
        {
            Response.Write("<script language=javascript> alert ('Currently there is no valid user in the system, the session is empty!') </script>");

        }


    }
    private string getUserLocation()
    {
        string loggeduser = Session["USERNAME"] as string;

        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getUserLocation = new SqlCommand("SELECT Loct_Name FROM Schedule WHERE Traffic_Phone = '" + loggeduser + "'", con);
            SqlDataAdapter sda_getUserLocation = new SqlDataAdapter(cmd_getUserLocation);
            DataTable dt_getUserLocation = new DataTable();
            sda_getUserLocation.Fill(dt_getUserLocation);

            string Location = dt_getUserLocation.Rows[0][0].ToString();
            con.Close();
            return Location;
        }
    }
    protected void btnSaveRecord_Click(object sender, EventArgs e)
    {

        string loggedUser = Session["USERNAME"] as string;
        string PaymetType = getPaymentType();

        if (CheckTaxiPresence() == "YES")
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd_InsertRecord = new SqlCommand("InsertRecord", con);
                cmd_InsertRecord.CommandType = CommandType.StoredProcedure;

                SqlParameter Traffic_Phone = new SqlParameter()
                {
                    ParameterName = "@Traffi_Phone",
                    Value = loggedUser
                };
                cmd_InsertRecord.Parameters.Add(Traffic_Phone);

                SqlParameter Branch_Name = new SqlParameter()
                {
                    ParameterName = "@Branch_Name",
                    Value = tbBranchName.Text
                };
                cmd_InsertRecord.Parameters.Add(Branch_Name);

                SqlParameter Locat_Name = new SqlParameter()
                {
                    ParameterName = "@Loct_Name",
                    Value = getUserLocation()
                };
                cmd_InsertRecord.Parameters.Add(Locat_Name);

                SqlParameter Plate_No = new SqlParameter()
                {
                    ParameterName = "@Plate_No",
                    Value = tbTaxiPlateNumber.Text
                };
                cmd_InsertRecord.Parameters.Add(Plate_No);

                SqlParameter Dirver_license_No = new SqlParameter()
                {
                    ParameterName = "@Dirver_license_No",
                    Value = tbDriverLicenseNO.Text
                };
                cmd_InsertRecord.Parameters.Add(Dirver_license_No);

                SqlParameter Date = new SqlParameter()
                {
                    ParameterName = "@Date",
                    Value = DateTime.Now
                };
                cmd_InsertRecord.Parameters.Add(Date);

                SqlParameter strpayment_Type = new SqlParameter()
                {
                    ParameterName = "@payment_Type",
                    Value = PaymetType
                };
                cmd_InsertRecord.Parameters.Add(strpayment_Type);

                SqlParameter Ref_No = new SqlParameter()
                {
                    ParameterName = "@Ref_No",
                    Value = "123"
                };
                cmd_InsertRecord.Parameters.Add(Ref_No);

                SqlParameter Ammount_In_figure = new SqlParameter()
                {
                    ParameterName = "@Ammount_In_figure",
                    Value = tbAmountInFigure.Text
                };
                cmd_InsertRecord.Parameters.Add(Ammount_In_figure);

                SqlParameter Amount_In_Words = new SqlParameter()
                {
                    ParameterName = "@Amount_In_Words",
                    Value = tbAmmountInWords.Text
                };
                cmd_InsertRecord.Parameters.Add(Amount_In_Words);

                SqlParameter Purpose = new SqlParameter()
                {
                    ParameterName = "@Purpose",
                    Value = tbPunishmentPurpose.Text
                };
                cmd_InsertRecord.Parameters.Add(Purpose);

                SqlParameter Driver_Agreement = new SqlParameter()
                {
                    ParameterName = "@Driver_Agreement",
                    Value = "PENDDING"
                };
                cmd_InsertRecord.Parameters.Add(Driver_Agreement);

                SqlParameter Payment_Status = new SqlParameter()
                {
                    ParameterName = "@Payment_Status",
                    Value = "UnPaid"
                };
                cmd_InsertRecord.Parameters.Add(Payment_Status);

                SqlParameter Recoed_Id = new SqlParameter()
                {
                    ParameterName = "@Id",
                    Value = -1,
                    Direction = ParameterDirection.Output
                };
                cmd_InsertRecord.Parameters.Add(Recoed_Id);

                con.Open();
                cmd_InsertRecord.ExecuteNonQuery();
                con.Close();

                tbAmmountInWords.Text = "";
                tbAmountInFigure.Text = "";
                tbDriverLicenseNO.Text = "";
                tbTaxiPlateNumber.Text = "";
                tbPunishmentPurpose.Text = "";
                tbKebele.Text = "";
                tbWereda.Text = "";
                tbZone.Text = "";
                
                Response.Write("<script language=javascript> alert ('The record has been saved successfully!') </script>");

            }
        }

        else
        {
            Response.Write("<script language=javascript> alert ('There is no taxi with this plate number place retype it correctly, otherwise this is not a taxi ar not registerd!') </script>");
            tbTaxiPlateNumber.Focus();
        }
    }
}