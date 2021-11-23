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

public partial class TTCRSuperAdmin_TrafficsDetail : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    public string OrginalPhoneNo;
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            OrginalPhoneNo = Request.QueryString["Phone_No"].ToString();
        
        if (Session["USERNAME"] != null)
        {
           divTrafficRegistrationError.Visible = false;
            divTrafficRegistrationSuccs.Visible = false;


            CheckAccount();

            if (IsPostBack)
            {

            }

            else
            {
                getBranchs();
                getTrafficDetail();
                    ListOfSingleTrafficWorkHistory();
            }
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }

        }
        catch
        {
            Response.Redirect("../Loginpage.aspx");
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
            SqlCommand cmd_GetTrafficDetail = new SqlCommand("Select * From Traffics WHERE Phone_No='" + Request.QueryString["Phone_No"]+"'", con);
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

            lbEnableTrafficDetailEditting.Visible = true;
            divSaveNewDetail.Visible = false;



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

            if(dt_CheckAccount.Rows[0][5].ToString() == "ON")
            {
                lbAcctivateAccount.Visible = false;
            }

            else
            {
                lbDeactivateAccount.Visible = false;
            }
            
        }
        }

    protected void lbEnableTrafficDetailEditting_Click(object sender, EventArgs e)
    {
        tbTrafficFName.ReadOnly = false;
        tbTrafficMName.ReadOnly = false;
        tbTrafficLName.ReadOnly = false;

        tbTrafficPhoneNo.ReadOnly = false;
        tbTrafficEmail.ReadOnly = false;
        tbTrafficBrithDate.ReadOnly = false;

        ddlTrafficProffName.SelectedItem.Enabled = true;
        tbTrafficLName.ReadOnly = false;
        tbTrafficLName.ReadOnly = false;

        ddlTrafficsBranch.Enabled = true;
        ddlTrafficGender.Enabled = true;
        ddlTrafficProffName.Enabled = true;
        ddlResponsibility.Enabled = true;

        divPhotoUpload.Visible = true;
        divFileUpload.Visible = true;
        divSaveNewDetail.Visible = true;
        lbEnableTrafficDetailEditting.Visible = false;

    }

    protected void lbDeactivateAccount_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {

            string FoundedPhoneNO = Request.QueryString["Phone_No"].ToString();

            //SqlCommand cmd_DeactivateAccount = new SqlCommand("UPDATE Accounts SET Account_Status = 'Deactivated' WHERE Phone_No ='" + FoundedPhoneNO + "'", con);

            //con.Open();
            //cmd_DeactivateAccount.ExecuteNonQuery();
            //con.Close();
            SqlCommand cmd_Acctivate_Account = new SqlCommand("UPDATE Accounts SET Account_Status = 'OFF' WHERE Phone_No ='" + FoundedPhoneNO + "'", con);
            con.Open();
            cmd_Acctivate_Account.ExecuteNonQuery();
            con.Close();

            Server.Transfer("TrafficsDetail.aspx");
            divTrafficRegistrationSuccs.Visible = true;
            spnEditingSuccess.Visible = true;
            spnEditingSuccess.InnerHtml = "Account Deactivated successfully!";

        }
    }

    protected void lbAcctivateAccount_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {

            string FoundedPhoneNO = Request.QueryString["Phone_No"].ToString();

            //SqlCommand cmd_DeactivateAccount = new SqlCommand("UPDATE Accounts SET Account_Status = 'Deactivated' WHERE Phone_No ='" + FoundedPhoneNO + "'", con);

            //con.Open();
            //cmd_DeactivateAccount.ExecuteNonQuery();
            //con.Close();
            SqlCommand cmd_Acctivate_Account = new SqlCommand("UPDATE Accounts SET Account_Status = 'ON' WHERE Phone_No ='" + FoundedPhoneNO + "'", con);
            con.Open();
            cmd_Acctivate_Account.ExecuteNonQuery();
            con.Close();

            Server.Transfer("TrafficsDetail.aspx");
            divTrafficRegistrationSuccs.Visible = true;
            spnEditingSuccess.Visible = true;
            spnEditingSuccess.InnerHtml = "Account Activated successfully!";
        }
        
    }
    

    protected void lbSaveNewDetail_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            //try {
                if (fupldTrafficPhoto.HasFile)
                {
                    try
                    {
                        Byte[] bytes = null;


                        string filename = fupldTrafficPhoto.PostedFile.FileName;
                        string filePath = Path.GetFileName(filename);
                        Stream fs = fupldTrafficPhoto.PostedFile.InputStream;
                        BinaryReader br = new BinaryReader(fs);
                        bytes = br.ReadBytes((Int32)fs.Length);


                        SqlCommand commandPhoto = new SqlCommand("UPDATE tblImage SET ImageName = @ImageName, Image = @Image WHERE ReferenceID ='" + tbTrafficPhoneNo.Text + "'", con);
                        commandPhoto.Parameters.Add("@ImageName",
                        SqlDbType.NVarChar, 20).Value = tbTrafficFName.Text + " " + tbTrafficMName.Text + " " + tbTrafficLName.Text;
                        commandPhoto.Parameters.Add("@Image",
                        SqlDbType.Binary).Value = bytes;
                        commandPhoto.Parameters.Add("@ReferenceID",
                        SqlDbType.NVarChar, 20).Value = tbTrafficPhoneNo.Text;

                        con.Open();
                        commandPhoto.ExecuteNonQuery();
                        con.Close();

                        divTrafficRegistrationSuccs.Visible = true;
                        spnEditingSuccess.Visible = true;
                        spnEditingSuccess.InnerHtml = "<h5> Traffic Profile picture editing oprated successfully! </h5>";


                    }
                    catch (Exception)
                    {
                        divTrafficRegistrationError.Visible = true;
                        pEditingError.Visible = true;
                        pEditingError.InnerHtml = "<h5> Somthing went Wrong During Photo uploading, Please again! </h5>";
                    }
                }

                if (fupldTrafficSkillCertificate.HasFile)
                {
                    try
                    {
                        Byte[] bytes = null;


                        string filename = fupldTrafficSkillCertificate.PostedFile.FileName;
                        string filePath = Path.GetFileName(filename);
                        Stream fs = fupldTrafficSkillCertificate.PostedFile.InputStream;
                        BinaryReader br = new BinaryReader(fs);
                        bytes = br.ReadBytes((Int32)fs.Length);


                        SqlCommand commandImageFile = new SqlCommand("UPDATE tblImageFile SET ImageName = @ImageName, Image = @Image, ReferenceID=@ReferenceID WHERE ReferenceID ='" + tbTrafficPhoneNo.Text + "'", con);
                        commandImageFile.Parameters.Add("@ImageName",
                        SqlDbType.NVarChar, 20).Value = tbTrafficFName.Text + " " + tbTrafficMName.Text + " " + tbTrafficLName.Text;
                        commandImageFile.Parameters.Add("@Image",
                        SqlDbType.Binary).Value = bytes;
                        commandImageFile.Parameters.Add("@ReferenceID",
                        SqlDbType.NVarChar, 20).Value = tbTrafficPhoneNo.Text;

                        con.Open();
                        commandImageFile.ExecuteNonQuery();
                        con.Close();

                        divTrafficRegistrationSuccs.Visible = true;
                        spnEditingSuccess.Visible = true;
                        spnEditingSuccess.InnerHtml = "<h5> Traffic Skill certificate editing oprated successfully!</h5>";


                    }
                    catch (Exception)
                    {
                        divTrafficRegistrationError.Visible = true;
                        pEditingError.Visible = true;
                        pEditingError.InnerHtml = "<h5> Somthing went Wrong During Skill Certificate uploading! </h5>";
                    }
                }




                string Phone_No = tbTrafficPhoneNo.Text;
                string FName = tbTrafficFName.Text;
                // SqlCommand cmdUpdateDetail = new SqlCommand("UPDATE Traffics SET FName ='"+ FName + "' WHERE Phone_No ='"+ Phone_No +"'", con);
                SqlCommand cmdUpdateDetail = new SqlCommand(
                    "UPDATE Traffics SET FName = @FName, MName = @MName, LName = @LName, Email = @Email, Proff_Name= @Proff_Name, Brith_date= @Brith_date, Gender = @Gender, Branch = @Branch, Responsibility = @Responsibility  WHERE Phone_No ='" + Phone_No + "'", con);
                cmdUpdateDetail.Parameters.Add("@FName",
                SqlDbType.NVarChar, 20).Value = tbTrafficFName.Text;
                cmdUpdateDetail.Parameters.Add("@MName",
                SqlDbType.NVarChar, 20).Value = tbTrafficMName.Text;
                cmdUpdateDetail.Parameters.Add("@LName",
                SqlDbType.NVarChar, 20).Value = tbTrafficLName.Text;
                cmdUpdateDetail.Parameters.Add("@Email",
                SqlDbType.NVarChar, 20).Value = tbTrafficEmail.Text;
                cmdUpdateDetail.Parameters.Add("@Proff_Name",
                SqlDbType.NVarChar, 20).Value = ddlTrafficProffName.SelectedItem.Value;
                cmdUpdateDetail.Parameters.Add("@Brith_date",
                SqlDbType.NVarChar, 20).Value = tbTrafficBrithDate.Text;
                cmdUpdateDetail.Parameters.Add("@Gender",
                SqlDbType.NVarChar, 20).Value = ddlTrafficGender.SelectedItem.Value;
                cmdUpdateDetail.Parameters.Add("@Branch",
                SqlDbType.NVarChar, 20).Value = ddlTrafficsBranch.SelectedItem.Value;
                cmdUpdateDetail.Parameters.Add("@Responsibility",
                SqlDbType.NVarChar, 20).Value = ddlResponsibility.SelectedItem.Value;

                con.Open();
                cmdUpdateDetail.ExecuteNonQuery();

                SqlCommand cmdUpdateTrafficAccounts = new SqlCommand("UPDATE Accounts SET Email = @EmailToAccount, Account_Type = @ResponsibilityToAccout WHERE Phone_No ='" + Phone_No + "'", con);
                cmdUpdateTrafficAccounts.Parameters.Add("@EmailToAccount",
                SqlDbType.NVarChar, 20).Value = tbTrafficEmail.Text;
                cmdUpdateTrafficAccounts.Parameters.Add("@ResponsibilityToAccout",
                SqlDbType.NVarChar, 20).Value = ddlResponsibility.SelectedItem.Value;


                cmdUpdateTrafficAccounts.ExecuteNonQuery();
                con.Close();

                // Response.Redirect("TrafficsDetail.aspx");
                getTrafficDetail();
                divTrafficRegistrationSuccs.Visible = true;
                spnEditingSuccess.Visible = true;
                spnEditingSuccess.InnerHtml = "<h5>Traffic Personal detaile editing oprated successfully!</h5>";

            //}
            //catch
            //{
            //    divTrafficRegistrationError.Visible = true;
            //    pEditingError.Visible = true;
            //    pEditingError.InnerHtml = "<h5> Somthing went Wrong During Detail Editing, Please tyr it again! May be delete the time in brith date.</h5>";
            //}
            }
       
    }



    
}


//SqlCommand cmd_Acctivate_Account = new SqlCommand("UPDATE Distributor SET Account_Status = 'OFF' WHERE Dstr_id ='" + Dstr_id + "'", con);
//con.Open();
//            cmd_Acctivate_Account.ExecuteNonQuery();
//            con.Close();



//string connection = ConfigurationManager.ConnectionStrings["PaydayLunchConnectionString1"].ConnectionString;
//SqlConnection conn = new SqlConnection(connection);

//conn.Open();
//            SqlCommand cmd1 = new SqlCommand("DELETE FROM Users WHERE Name = @Name", conn);
//cmd1.Parameters.AddWithValue("@Name", txtRemoveUser.Text);
//            SqlDataReader rd1 = cmd1.ExecuteReader();
//conn.Close();

//            conn.Open();
//            SqlCommand cmd2 = new SqlCommand("UPDATE FROM Admin_TaskList SET Status = 'Complete' WHERE Description = 'Remove User' AND Name = @Name", conn);
//cmd2.Parameters.AddWithValue("@Name", txtRemoveUser.Text);
//            SqlDataReader rd2 = cmd2.ExecuteReader();
//conn.Close();

//            txtRemoveUser.Text = "";
//            Response.Redirect("/AdminSide/TaskList.aspx");