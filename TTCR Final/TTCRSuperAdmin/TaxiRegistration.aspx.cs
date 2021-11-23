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

public partial class TTCRSuperAdmin_TaxiRegistration : System.Web.UI.Page
{
    
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    public string OwnerStatusOnRegistration = "New";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            if (IsPostBack)
            { // The choice is just having two buttons for new owner and old owner, button of the new owner is active by default but button of 
                // the old one is activate when the search old owner clicked.
                
                // rbOwnerfemale.Checked = false;
                //lbtnSearchOwner_Click(sender, e);
            }
                    
            else
            {
                btnSaveAllTaxiAndOldOwnerDetail.Visible = false;
                ExistingOwners();
            }

        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }
    protected void lbtnSearchOwner_Click1(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            if (ddlExisttingOwnersPhone.SelectedItem.Value != "Select Owner's Phone Number")
            {
                OwnerStatusOnRegistration = "Exist";

                con.Open();
                SqlCommand cmd_OwnerDetail = new SqlCommand("SELECT * FROM Owners WHERE Phone_No ='" + ddlExisttingOwnersPhone.SelectedItem.Value + "'", con);
                SqlDataAdapter sda_OwnerDetail = new SqlDataAdapter(cmd_OwnerDetail);
                DataTable dt_OwnerDetail = new DataTable();
                sda_OwnerDetail.Fill(dt_OwnerDetail);

                tbOwnerFName.Text = dt_OwnerDetail.Rows[0][2].ToString();
                tbOwnerMName.Text = dt_OwnerDetail.Rows[0][3].ToString();
                tbOwnerLName.Text = dt_OwnerDetail.Rows[0][4].ToString();
                tbOwnerPhone.Text = dt_OwnerDetail.Rows[0][1].ToString();
                tbOwnerTellephone.Text = dt_OwnerDetail.Rows[0][6].ToString();
                tbOwnerEmail.Text = dt_OwnerDetail.Rows[0][7].ToString();

                if (dt_OwnerDetail.Rows[0][5].ToString() == "Male")
                {
                    rbOwnerMale.Checked = true;
                }

                if (dt_OwnerDetail.Rows[0][5].ToString() == "Female")
                {
                    rbOwnerfemale.Checked = true;
                }
                else
                {

                }
                con.Close();
                btnSaveAllTaxiAndOwnerDetail.Visible = false;
                btnSaveAllTaxiAndOldOwnerDetail.Visible = true;
                // tbOwnerFName.Text = OwnerStatusOnRegistration;
            }
            else
            {
                // Response.Write("<script>alert('You haven't selected owner Phone number, Please select!')</script>");
                Response.Write("<script language=javascript>alert('You have not selected owner Phone number, Please select!')</script>");

            }


        }
    }

  
    protected void Button2_Click(object sender, EventArgs e)
    {
        tbOwnerLName.Text = tbOwnerFName.Text;
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
        if (rbOwnerMale.Checked)
        {
            gender = "Male";
        }

        else
        {
            gender = "Female";
        }

        return gender;
    }
    protected void ExistingOwners()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_FindDetail = new SqlCommand("SELECT Phone_No FROM Owners ORDER BY Phone_No ASC", con);
            SqlDataReader dr;
            dr = cmd_FindDetail.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlExisttingOwnersPhone.Items.Add(dr[0].ToString());
                }
            }

            con.Close();
            
        }
    }

    protected int CheckPhone()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_CheckPhone = new SqlCommand("SELECT * FROM Accounts WHERE Phone_No ='" + tbOwnerPhone.Text + "'", con);
            SqlDataAdapter sda_CheckPhone = new SqlDataAdapter(cmd_CheckPhone);
            DataTable dt_CheckPhone = new DataTable();
            sda_CheckPhone.Fill(dt_CheckPhone);
            int length = dt_CheckPhone.Rows.Count;
            con.Close();
            return length;
        }
        }
    protected int CheckPlate()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_CheckPlate = new SqlCommand("SELECT * FROM Taxis WHERE Plate ='" + tbTaxiPlateNumber.Text + "'", con);
            SqlDataAdapter sda_CheckPlate = new SqlDataAdapter(cmd_CheckPlate);
            DataTable dt_CheckPlate = new DataTable();
            sda_CheckPlate.Fill(dt_CheckPlate);
            int length = dt_CheckPlate.Rows.Count;
            con.Close();
            return length;
        }
    }
    //protected int checkPhone
    protected void btnSaveAllTaxiAndOwnerDetail_Click(object sender, EventArgs e)
    {
        if (fupldtaxiDetail.HasFile)
        {
                if (fupldOwnerTradeLicens.HasFile)
                {

                int phoneExist = CheckPhone();
                if (phoneExist == 0)
                {

                    int plateLength = CheckPlate();
                    if (plateLength == 0)
                    {
                        InsertOwner();

                        Inserttaxi();
                        /// Inserting taxi detail ends here 



                        
                        Response.Write("<script>alert('Conguradulation! EveryThing has been Done!')</script>");
                        tbOwnerFName.Text = "";
                        tbOwnerMName.Text = "";
                        tbOwnerLName.Text = "";
                        tbOwnerPhone.Text = "";
                        tbOwnerTellephone.Text = "";
                        tbOwnerEmail.Text = "";
                        tbOwnerPassword.Text = "";

                        tbTaxiPlateNumber.Text = "";
                        ddltaxiType.Text = "";
                        ddltaxiType.SelectedIndex = 0;
                        ddlTaxiColor.SelectedIndex = 0;
                        ddlTaxiLevel.SelectedIndex = 0;

                    }

                    else
                    {
                        Response.Write("<script>alert('A Vehicle with this plate number is Exist in our system, please check the plate number!')</script>");
                        tbTaxiPlateNumber.Focus();
                    }
                }
                else
                {
                    Response.Write("<script>alert('This phone number is allready taken, Please check the phone number!')</script>");
                    tbOwnerPhone.Focus();
                }
            }

            else
            {
                    Response.Write("<script>alert('You have not selected taxi Owner of Trade License File, Please Select an Image type of Bothe Files!')</script>");
                    fupldOwnerTradeLicens.Focus();
            }
        }
        else
        {
            Response.Write("<script>alert('You have not selected Taxi Libre File, Please Select an Image type of Bothe Files!')</script>");
            fupldOwnerTradeLicens.Focus();
        }
    }

    protected void btnSaveAllTaxiAndOldOwnerDetail_Click(object sender, EventArgs e)
    {
        Inserttaxi();
        
    }
    private void InsertOwner()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            try
            {
                con.Open();
                SqlCommand cmdd_InsertOwner = new SqlCommand("InsertOwner", con);
                cmdd_InsertOwner.CommandType = CommandType.StoredProcedure;

                //// Inserting Of taxi Owner Starts here
                SqlParameter OwnerPhoneNumber = new SqlParameter()
                {
                    ParameterName = "@Phone_No",
                    Value = tbOwnerPhone.Text
                };
                cmdd_InsertOwner.Parameters.Add(OwnerPhoneNumber);

                SqlParameter OwnerFName = new SqlParameter()
                {
                    ParameterName = "@FName",
                    Value = tbOwnerFName.Text
                };
                cmdd_InsertOwner.Parameters.Add(OwnerFName);

                SqlParameter OwnerMName = new SqlParameter()
                {
                    ParameterName = "@MName",
                    Value = tbOwnerMName.Text
                };
                cmdd_InsertOwner.Parameters.Add(OwnerMName);

                SqlParameter OwnerLName = new SqlParameter()
                {
                    ParameterName = "@LName",
                    Value = tbOwnerLName.Text
                };
                cmdd_InsertOwner.Parameters.Add(OwnerLName);

                SqlParameter OwnerGender = new SqlParameter()
                {
                    ParameterName = "@Gender",
                    Value = getGender()
                };
                cmdd_InsertOwner.Parameters.Add(OwnerGender);

                SqlParameter OwnerTelePhone = new SqlParameter()
                {
                    ParameterName = "@Tellephone",
                    Value = tbOwnerTellephone.Text
                };
                cmdd_InsertOwner.Parameters.Add(OwnerTelePhone);

                SqlParameter OwnerEmail = new SqlParameter()
                {
                    ParameterName = "@Email",
                    Value = tbOwnerEmail.Text
                };
                cmdd_InsertOwner.Parameters.Add(OwnerEmail);

                SqlParameter OwnerStatus = new SqlParameter()
                {
                    ParameterName = "@OwnerStatus",
                    Value = "Active"
                };
                cmdd_InsertOwner.Parameters.Add(OwnerStatus);

                SqlParameter OwnerId = new SqlParameter()
                {
                    ParameterName = "@Owner_Id",
                    Value = -1,
                    Direction = ParameterDirection.Output
                };
                cmdd_InsertOwner.Parameters.Add(OwnerId);

                cmdd_InsertOwner.ExecuteNonQuery();
                /// Inserting of Owner of taxi detail ends here


                /// Creating Account of owner Starts here
            

                SqlCommand cmd_CrateOwnerAccount = new SqlCommand("InsertAccount", con);
                cmd_CrateOwnerAccount.CommandType = CommandType.StoredProcedure;

                SqlParameter OwnerAccountEmail = new SqlParameter()
                {
                    ParameterName = "@Email",
                    Value = tbOwnerEmail.Text
                };
                cmd_CrateOwnerAccount.Parameters.Add(OwnerAccountEmail);

                SqlParameter OwnerPhone = new SqlParameter()
                {
                    ParameterName = "@Phone_No",
                    Value = tbOwnerPhone.Text
                };
                cmd_CrateOwnerAccount.Parameters.Add(OwnerPhone);

                SqlParameter OwnerPassword = new SqlParameter()
                {
                    ParameterName = "@Password",
                    Value = Encrpt(tbOwnerPassword.Text)
                };
                cmd_CrateOwnerAccount.Parameters.Add(OwnerPassword);

                SqlParameter OwnerAccountType = new SqlParameter()
                {
                    ParameterName = "@Account_Type",
                    Value = "TaxiOwner"
                };
                cmd_CrateOwnerAccount.Parameters.Add(OwnerAccountType);

                SqlParameter OwnerAccount_Status = new SqlParameter()
                {
                    ParameterName = "@Account_Status",
                    Value = "ON"
                };
                cmd_CrateOwnerAccount.Parameters.Add(OwnerAccount_Status);

                SqlParameter OwnerAccount_ID = new SqlParameter()
                {
                    ParameterName = "@Account_ID",
                    Value = -1,
                    Direction = ParameterDirection.Output
                };
                cmd_CrateOwnerAccount.Parameters.Add(OwnerAccount_ID);

                cmd_CrateOwnerAccount.ExecuteNonQuery();
                ///Creating Owners Account ends here 

                /// Insertin owner trade license strats here

            
                Byte[] bytes = null;
                
                string filename = fupldOwnerTradeLicens.PostedFile.FileName;
                string filePath = Path.GetFileName(filename);
                Stream fs = fupldOwnerTradeLicens.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);
                
                SqlCommand command = new SqlCommand(
                 "INSERT INTO tblImageFile (ImageName, Image, ReferenceID) " +
                 "Values(@ImageName, @Image, @ReferenceID)", con);
                command.Parameters.Add("@ImageName",
                SqlDbType.NVarChar, 20).Value = "TLicense of "+ tbOwnerFName.Text + " " + tbOwnerMName.Text;
                command.Parameters.Add("@Image",
                SqlDbType.Binary).Value = bytes;
                command.Parameters.Add("@ReferenceID",
                SqlDbType.NVarChar, 20).Value = tbOwnerPhone.Text;

                command.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception)
            {
                Response.Write("<script>alert('SOMTHING WENT WRONG IN Owner Registration!')</script>");

            }
        }
    }
    private void Inserttaxi()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            try
            {
                con.Open();
                SqlCommand cmd_InsertTaxi = new SqlCommand("InsertTaxi", con);
                cmd_InsertTaxi.CommandType = CommandType.StoredProcedure;

                SqlParameter taxiPlate = new SqlParameter()
                {
                    ParameterName = "@Plate",
                    Value = tbTaxiPlateNumber.Text
                };
                cmd_InsertTaxi.Parameters.Add(taxiPlate);

                SqlParameter OwnerPhoneAsForeignKey = new SqlParameter()
                {
                    ParameterName = "@Owner_Phone",
                    Value = tbOwnerPhone.Text
                };
                cmd_InsertTaxi.Parameters.Add(OwnerPhoneAsForeignKey);

                SqlParameter TaxiType = new SqlParameter()
                {
                    ParameterName = "@Type",
                    Value = ddltaxiType.SelectedItem.Value
                };
                cmd_InsertTaxi.Parameters.Add(TaxiType);

                SqlParameter TaxiLevel = new SqlParameter()
                {
                    ParameterName = "@Level",
                    Value = ddlTaxiLevel.SelectedItem.Value
                };
                cmd_InsertTaxi.Parameters.Add(TaxiLevel);

                SqlParameter TaxiColor = new SqlParameter()
                {
                    ParameterName = "@Color",
                    Value = ddlTaxiColor.SelectedItem.Value
                };
                cmd_InsertTaxi.Parameters.Add(TaxiColor);

                SqlParameter TaxiPlate_Renewed_Date = new SqlParameter()
                {
                    ParameterName = "@Plate_Renewed_Date",
                    Value = DateTime.Now
                };
                cmd_InsertTaxi.Parameters.Add(TaxiPlate_Renewed_Date);

                SqlParameter TaxiDriverPhone = new SqlParameter()
                {
                    ParameterName = "@Driver_Phone",
                    Value = "Not Assighned"
                };
                cmd_InsertTaxi.Parameters.Add(TaxiDriverPhone);

                SqlParameter TaxiDescipline = new SqlParameter()
                {
                    ParameterName = "@taxi_Status",
                    Value = "Well"
                };
                cmd_InsertTaxi.Parameters.Add(TaxiDescipline);

                SqlParameter TaxiId = new SqlParameter()
                {
                    ParameterName = "@Id",
                    Value = -1,
                    Direction = ParameterDirection.Output
                };
                cmd_InsertTaxi.Parameters.Add(TaxiId);

                    
                /// Inserting of taxi Libre in to tblimages stars here
                
                Byte[] bytes = null;

                string filename = fupldtaxiDetail.PostedFile.FileName;
                string filePath = Path.GetFileName(filename);
                Stream fs = fupldtaxiDetail.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);


                SqlCommand command = new SqlCommand(
                    "INSERT INTO tblImageFile (ImageName, Image, ReferenceID) " +
                    "Values(@ImageName, @Image, @ReferenceID)", con);
                command.Parameters.Add("@ImageName",
                SqlDbType.NVarChar, 20).Value = "Taix of "+ tbOwnerFName.Text +" "+ tbOwnerMName.Text;
                command.Parameters.Add("@Image",
                SqlDbType.Binary).Value = bytes;
                command.Parameters.Add("@ReferenceID",
                SqlDbType.NVarChar, 20).Value = tbTaxiPlateNumber.Text;

                cmd_InsertTaxi.ExecuteNonQuery();
                command.ExecuteNonQuery();

                con.Close();

                Response.Write("<script>alert('Taxi Registration opprated siccessfuly!')</script>");
            }
            catch (Exception)
            {
                Response.Write("<script>alert('SOMTHING WENT WRONG  During Uploading, Please try again!')</script>");

            }
        }
    }

    protected void btnCleanAllTaxiAndOwnerDetail_Click(object sender, EventArgs e)
    {
        tbOwnerFName.Text = "";
        tbOwnerMName.Text = "";
        tbOwnerLName.Text = "";
        tbOwnerPhone.Text = "";
        tbOwnerTellephone.Text = "";
        tbOwnerEmail.Text = "";
        tbOwnerPassword.Text = "";

        tbTaxiPlateNumber.Text = "";
        ddltaxiType.Text = "";
        ddltaxiType.SelectedIndex = 0;
        ddlTaxiColor.SelectedIndex = 0;
        ddlTaxiLevel.SelectedIndex = 0;

        btnSaveAllTaxiAndOldOwnerDetail.Visible = false;
        btnSaveAllTaxiAndOwnerDetail.Visible = true;



    }

}

