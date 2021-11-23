using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

public partial class TTCRSuperAdmin_TrafficRegistration : System.Web.UI.Page
{

    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        divTrafficRegistrationError.Visible = false;
        divTrafficRegistrationSuccess.Visible = false;
        if (!IsPostBack)
        {
            getBranchs();
        }
    }

    private void getBranchs()
    {
        using(SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmdgetBranchs = new SqlCommand("SELECT BrancName FROM Branchs ORDER BY BrancName ASC", con);

            dr = cmdgetBranchs.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlTrafficBrach.Items.Add(dr[0].ToString());
                }
            }
        }
    }

    protected string TrafficWorkBranch()
    {
        if (ddlTrafficBrach.Text == "Assign work branch")
        {
            return "//// Not Assigned ////";
        }

        else
        {
            return ddlTrafficBrach.SelectedItem.Value;
        }
    }

    protected string TrafficResposibilityInBranch()
    {
        if (ddlTrafficResponsibility.Text == "Responsibility in branch")
        {
            return "//// No Responsibilty ////";
        }

        else
        {
            return ddlTrafficResponsibility.SelectedItem.Value;
        }
    }
    private string Encrpt(string strEncrString)
    {

        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrString);
        string Eecripted = Convert.ToBase64String(b);
        return Eecripted;
    }

    private string getGender()
    {
        string gender = string.Empty;
        if (rbTrafficMaleGender.Checked)
        {
            gender = "Male";
        }

        else
            {
            gender = "Female";
        }

        return gender;
    }


    protected void lbtnSaveTrafficDetail_Click(object sender, EventArgs e)
    {
        string psw1 = tbTrafficCreatePassword.Text;
        string psw2 = tbTrafficRetypePassword.Text;

        if (psw1 == psw2)
        {
            if (tbTrafficCreatePassword.Text == "")
            {
                psw1 = "TTCR@123";
            }
            else
            {
                psw1 = tbTrafficCreatePassword.Text;
            }
            using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd_CheckTrafficPhone = new SqlCommand("SELECT * FROM Traffics WHERE Phone_No = '" + tbTrafficPhoneNo.Text + "'", con);
                    con.Open();
                    SqlDataAdapter sda_CheckTrafficPhone = new SqlDataAdapter(cmd_CheckTrafficPhone);
                    DataTable dt_CheckTrafficPhone = new DataTable();
                    sda_CheckTrafficPhone.Fill(dt_CheckTrafficPhone);


                    if (dt_CheckTrafficPhone.Rows.Count == 0)
                    {
                        try
                        {

                            SqlCommand cmd = new SqlCommand("InsertTraffics", con);
                            cmd.CommandType = CommandType.StoredProcedure;

                            SqlParameter TrafficPhoneNo = new SqlParameter()
                            {
                                ParameterName = "@Phone_No",
                                Value = tbTrafficPhoneNo.Text
                            };
                            cmd.Parameters.Add(TrafficPhoneNo);

                            SqlParameter TrafficFName = new SqlParameter()
                            {
                                ParameterName = "@FName",
                                Value = tbTrafficFName.Text
                            };
                            cmd.Parameters.Add(TrafficFName);

                            SqlParameter TrafficMName = new SqlParameter()
                            {
                                ParameterName = "@MName",
                                Value = tbTrafficMName.Text
                            };
                            cmd.Parameters.Add(TrafficMName);

                            SqlParameter TrafficLName = new SqlParameter()
                            {
                                ParameterName = "@LName",
                                Value = tbTrafficLName.Text
                            };
                            cmd.Parameters.Add(TrafficLName);

                            SqlParameter TrafficEmail = new SqlParameter()
                            {
                                ParameterName = "@Email",
                                Value = tbTrafficEmail.Text
                            };
                            cmd.Parameters.Add(TrafficEmail);

                            SqlParameter TrafficProff_Name = new SqlParameter()
                            {
                                ParameterName = "@Proff_Name",
                                Value = ddlTrafficProffName.SelectedItem.Value
                            };
                            cmd.Parameters.Add(TrafficProff_Name);

                            SqlParameter TrafficBrith_date = new SqlParameter()
                            {
                                ParameterName = "@Brith_date",
                                Value = tbTrafficBrithDate.Text
                            };
                            cmd.Parameters.Add(TrafficBrith_date);

                            SqlParameter TrafficGender = new SqlParameter()
                            {
                                ParameterName = "@Gender",
                                Value = getGender()
                            };
                            cmd.Parameters.Add(TrafficGender);

                        SqlParameter TrafficBranch = new SqlParameter()
                        {
                            ParameterName = "@Branch",
                            Value = TrafficWorkBranch()
                            };
                            cmd.Parameters.Add(TrafficBranch);

                            SqlParameter TrafficResponsibility = new SqlParameter()
                            {
                                ParameterName = "@Responsibility",
                                Value = TrafficResposibilityInBranch()
                            };
                            cmd.Parameters.Add(TrafficResponsibility);

                            SqlParameter EplyID = new SqlParameter()
                            {
                                ParameterName = "@EplyID",
                                Value = -1,
                                Direction = ParameterDirection.Output
                            };
                            cmd.Parameters.Add(EplyID);
                            
                            cmd.ExecuteNonQuery();

                            ///////////////// Insert in to Account

                            SqlCommand cmdAccount = new SqlCommand("InsertAccount", con);
                            cmdAccount.CommandType = CommandType.StoredProcedure;



                            SqlParameter TrafficAccountEmail = new SqlParameter()
                            {
                                ParameterName = "@Email",
                                Value = tbTrafficEmail.Text
                            };
                            cmdAccount.Parameters.Add(TrafficAccountEmail);

                            SqlParameter TrafficPhone = new SqlParameter()
                            {
                                ParameterName = "@Phone_No",
                                Value = tbTrafficPhoneNo.Text
                            };
                            cmdAccount.Parameters.Add(TrafficPhone);

                            SqlParameter TrafficPassword = new SqlParameter()
                            {
                                ParameterName = "@Password",
                                Value = Encrpt(psw1)
                            };
                            cmdAccount.Parameters.Add(TrafficPassword);

                            SqlParameter TrafficAccountType = new SqlParameter()
                            {
                                ParameterName = "@Account_Type",
                                Value = ddlTrafficResponsibility.SelectedItem.Value
                            };
                            cmdAccount.Parameters.Add(TrafficAccountType);

                            SqlParameter TrafficAccount_Status = new SqlParameter()
                            {
                                ParameterName = "@Account_Status",
                                Value = "ON"
                            };
                            cmdAccount.Parameters.Add(TrafficAccount_Status);

                            SqlParameter TrafficAccount_ID = new SqlParameter()
                            {
                                ParameterName = "@Account_ID",
                                Value = -1,
                                Direction = ParameterDirection.Output
                            };
                            cmdAccount.Parameters.Add(TrafficAccount_ID);

                            cmdAccount.ExecuteNonQuery();


                            /////////////////// End of Inserting in to account



                            /////////////////////Inserting traffic Photo Starting here
                            try
                            {
                                Byte[] bytes = null;
                                if (fupldTrafficPhoto.HasFile)
                                {
                                    string filename = fupldTrafficPhoto.PostedFile.FileName;
                                    string filePath = Path.GetFileName(filename);
                                    Stream fs = fupldTrafficPhoto.PostedFile.InputStream;
                                    BinaryReader br = new BinaryReader(fs);
                                    bytes = br.ReadBytes((Int32)fs.Length);
                                }

                                SqlCommand command = new SqlCommand(
                                 "INSERT INTO tblImage (ImageName, Image, ReferenceID) " +
                                 "Values(@ImageName, @Image, @ReferenceID)", con);
                                command.Parameters.Add("@ImageName",
                                SqlDbType.NVarChar, 20).Value = tbTrafficFName.Text;
                                command.Parameters.Add("@Image",
                                SqlDbType.Binary).Value = bytes;
                                command.Parameters.Add("@ReferenceID",
                                SqlDbType.NVarChar, 20).Value = tbTrafficPhoneNo.Text;

                                command.ExecuteNonQuery();


                            }
                            catch (Exception)
                            {
                                divTrafficRegistrationError.Visible = true;
                                spnTrafficRegistrationError.InnerText = "SOMTHING WENT WRONG IN PHOTO UPLOADING, PLEASE CHECK THE FIELD AGAIN!";

                            }

                        //////////////////////Inserting traffic photo end her //////////


                        ///////////////////// Inserting traffic Certificate in Image form Starting here
                        try
                        {
                            Byte[] bytes = null;
                            if (fupldTrafficSkillCertificate.HasFile)
                            {
                                string filename = fupldTrafficSkillCertificate.PostedFile.FileName;
                                string filePath = Path.GetFileName(filename);
                                Stream fs = fupldTrafficSkillCertificate.PostedFile.InputStream;
                                BinaryReader br = new BinaryReader(fs);
                                bytes = br.ReadBytes((Int32)fs.Length);
                            }
                            string trafficFullName = tbTrafficFName.Text +" "+ tbTrafficMName.Text +" "+ tbTrafficLName.Text;
                            SqlCommand command = new SqlCommand(
                             "INSERT INTO tblImageFile (ImageName, Image, ReferenceID) " +
                             "Values(@ImageName, @Image, @ReferenceID)", con);
                            command.Parameters.Add("@ImageName",
                            SqlDbType.NVarChar, 20).Value = trafficFullName;
                            command.Parameters.Add("@Image",
                            SqlDbType.Binary).Value = bytes;
                            command.Parameters.Add("@ReferenceID",
                            SqlDbType.NVarChar, 20).Value = tbTrafficPhoneNo.Text;

                            command.ExecuteNonQuery();

                            
                        }
                        catch (Exception)
                        {
                            divTrafficRegistrationError.Visible = true;
                            spnTrafficRegistrationError.InnerText = "SOMTHING WENT WRONG IN Skill Certificate UPLOADING, PLEASE CHECK THE FIELD AGAIN!";

                        }

                        ////////////////////// Inserting traffic Certificate in Image form end her   /////////////
                        con.Close();


                            tbTrafficFName.Focus();

                            divTrafficRegistrationSuccess.Visible = true;
                            spnTrafficRegistrationSuccess.InnerHtml = "REGISTRATION OPERATED SUCCESSFULY!";



                        }

                        catch (Exception ex)
                        {
                            divTrafficRegistrationError.Visible = true;
                            spnTrafficRegistrationError.InnerText = "SOMTHING WENT WRONG, PLEASE CHECK ALL THE FIELDS!";
                        }

                    }
                    else
                    {
                    divTrafficRegistrationError.Visible = true;
                    spnTrafficRegistrationError.InnerHtml = "There is an account with in this phone number pleae chaeck it!";
                    Response.Write("<script language=javascript>alert('There is an account with in this phone number pleae chaeck it!')</script>");
                        tbTrafficPhoneNo.Focus();
                    }

                    //tbAminEmail.Text = "";
                    //tbAdminPassword.Text = "";
                    //tbAdminPasswordRewrite.Text = "";
                }
           
        }
        else
        {


            divTrafficRegistrationError.Visible = true;
            spnTrafficRegistrationError.InnerHtml = "Password not mutch!";
            tbTrafficCreatePassword.Focus();


        }
    }

    protected void lbtnCleanTrafficDetail_Click(object sender, EventArgs e)
    {
        tbTrafficFName.Text = "";
        tbTrafficMName.Text = "";
        tbTrafficLName.Text = "";
        tbTrafficPhoneNo.Text = "";
        tbTrafficEmail.Text = "";
        tbTrafficBrithDate.Text = "";
        tbTrafficCreatePassword.Text = "";
        tbTrafficRetypePassword.Text = "";
        ddlTrafficBrach.SelectedIndex = 0;
        ddlTrafficProffName.SelectedIndex = 0;
        ddlTrafficResponsibility.SelectedIndex = 0;

        tbTrafficFName.Focus();
    }
}