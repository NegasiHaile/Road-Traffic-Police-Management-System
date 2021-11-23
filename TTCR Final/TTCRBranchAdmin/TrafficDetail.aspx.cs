using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text;
using System.Drawing;

public partial class TTCRBranchAdmin_TrafficDetail : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    public string TrafficPhoneNo;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["USERNAME"] != null)
        {

            TrafficPhoneNo = Request.QueryString["Phone_No"].ToString();
            getBranchs();
            getTrafficDetail();
            ListOfSingleTrafficWorkHistory();
            CheckAccount();

            if (Session["USERNAME"].ToString() == TrafficPhoneNo)
            {
                lbDeactivateAccount.Visible = false;
                lbAcctivateAccount.Visible = false;
                smlStatus_Of_Account.Visible = false;
               
            }
        }
        else
        {
            Response.Redirect("~/LoginPage.aspx");
        }
    }



    private void getBranchs()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmdgetBranchs = new SqlCommand("SELECT BrancName FROM Branchs ORDER BY BrancName ASC", con);
            SqlDataReader dr;
            dr = cmdgetBranchs.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlTrafficsBranch.Items.Add(dr[0].ToString());
                }
            }

            con.Close();
        }
    }
    private void getTrafficDetail()
    {


        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_GetTrafficDetail = new SqlCommand("Select * From Traffics WHERE Phone_No='" + Request.QueryString["Phone_No"] + "'", con);
            SqlDataAdapter sdaGetTrafficDetail = new SqlDataAdapter(cmd_GetTrafficDetail);
            DataTable dt_GetTrafficDetail = new DataTable();
            sdaGetTrafficDetail.Fill(dt_GetTrafficDetail);

            Repeater1.DataSource = dt_GetTrafficDetail;
            Repeater1.DataBind();

            tbTrafficFName.Text = dt_GetTrafficDetail.Rows[0][2].ToString();
            tbTrafficMName.Text = dt_GetTrafficDetail.Rows[0][3].ToString();
            tbTrafficLName.Text = dt_GetTrafficDetail.Rows[0][4].ToString();
            tbTrafficPhoneNo.Text = dt_GetTrafficDetail.Rows[0][1].ToString();
            tbTrafficEmail.Text = dt_GetTrafficDetail.Rows[0][5].ToString();
            tbTrafficBrithDate.Text = dt_GetTrafficDetail.Rows[0][7].ToString();
            ddlTrafficGender.Text = dt_GetTrafficDetail.Rows[0][8].ToString();
            ddlTrafficProffName.Text = dt_GetTrafficDetail.Rows[0][6].ToString();
            ddlTrafficsBranch.Text = dt_GetTrafficDetail.Rows[0][9].ToString();
            ddlResponsibility.Text = dt_GetTrafficDetail.Rows[0][10].ToString();


            tbTrafficFName.ReadOnly = true;
            tbTrafficMName.ReadOnly = true;
            tbTrafficLName.ReadOnly = true;

            tbTrafficPhoneNo.ReadOnly = true;
            tbTrafficEmail.ReadOnly = true;
            tbTrafficBrithDate.ReadOnly = true;

            ddlTrafficProffName.SelectedItem.Enabled = false;
            tbTrafficLName.ReadOnly = true;
            tbTrafficLName.ReadOnly = true;

            ddlTrafficsBranch.Enabled = false;
            ddlTrafficGender.Enabled = false;
            ddlTrafficProffName.Enabled = false;
            ddlResponsibility.Enabled = false;



            divPhotoUpload.Visible = false;
            divFileUpload.Visible = false;

            //divSaveNewDetail.Visible = false;



        }
    }
    private void ListOfSingleTrafficWorkHistory()
    {
        //string TrafficPhoneNO = Request.QueryString["Phone_No"].ToString();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_TrafficWorkHistory = new SqlCommand("Select * From Records WHERE Traffi_Phone='" + Request.QueryString["Phone_No"] + "'", con);
            SqlDataAdapter sda_TrafficWorkHistory = new SqlDataAdapter(cmd_TrafficWorkHistory);
            DataTable dt_TrafficWorkHistory = new DataTable();
            sda_TrafficWorkHistory.Fill(dt_TrafficWorkHistory);

            rptrListOfSingleTrafficWorkHistory.DataSource = dt_TrafficWorkHistory;
            rptrListOfSingleTrafficWorkHistory.DataBind();
        }

        }
    private void CheckAccount()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_CheckAccount = new SqlCommand("Select * From Accounts WHERE Phone_No='" + Request.QueryString["Phone_No"] + "'", con);
            SqlDataAdapter sda_CheckAccount = new SqlDataAdapter(cmd_CheckAccount);
            DataTable dt_CheckAccount = new DataTable();
            sda_CheckAccount.Fill(dt_CheckAccount);

            

            if (dt_CheckAccount.Rows[0][5].ToString() == "ON")
            {
                lbAcctivateAccount.Visible = false;
                spnStatus_Of_Account.InnerText = "ACTIVE";
            }

            else
            {
                lbDeactivateAccount.Visible = false;
                spnStatus_Of_Account.InnerText = "OFF";
            }

        }
    }



    protected void lbDeactivateAccount_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {

            string FoundedPhoneNO = Request.QueryString["Phone_No"].ToString();

            SqlCommand cmd_Acctivate_Account = new SqlCommand("UPDATE Accounts SET Account_Status = 'OFF' WHERE Phone_No ='" + FoundedPhoneNO + "'", con);
            con.Open();
            cmd_Acctivate_Account.ExecuteNonQuery();
            con.Close();

            Server.Transfer("TrafficDetail.aspx");
        }
    }

    protected void lbAcctivateAccount_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {

            string FoundedPhoneNO = Request.QueryString["Phone_No"].ToString();

            SqlCommand cmd_Acctivate_Account = new SqlCommand("UPDATE Accounts SET Account_Status = 'ON' WHERE Phone_No ='" + FoundedPhoneNO + "'", con);
            con.Open();
            cmd_Acctivate_Account.ExecuteNonQuery();
            con.Close();

            Server.Transfer("TrafficDetail.aspx");
        }

    }
}