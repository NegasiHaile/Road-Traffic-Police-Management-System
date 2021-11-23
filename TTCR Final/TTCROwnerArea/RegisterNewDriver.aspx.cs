using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

public partial class TTCROwnerArea_RegisterNewDriver : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
       if(Session["USERNAME"] != null)
        {
            divDriverRegistrationSuccess.Visible = false;
            divDriverRegistrationError.Visible = false;
            getTaxisPerOwner();
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }
    private string Encrpt(string strEncrString)
    {

        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrString);
        string Eecripted = Convert.ToBase64String(b);
        return Eecripted;
    }
    protected void getTaxisPerOwner()
    {
        string loggedinuser = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getTaxxisPerowner = new SqlCommand("SELECT Plate FROM Taxis WHERE Owner_Phone='"+ loggedinuser + "'", con);
            SqlDataReader dr;
            dr = cmd_getTaxxisPerowner.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    dlTaxisperOwner.Items.Add(dr[0].ToString());
                }
            }
            con.Close();

        }

        }

    protected int checkDriverInDrivers() {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_CheckDriver = new SqlCommand("SELECT * FROM Drivers WHERE license_Id='"+tbLicense_No.Text+"'", con);
            SqlDataAdapter sda_CheckDriver = new SqlDataAdapter(cmd_CheckDriver);
            DataTable dt_CheckDriver = new DataTable();
            sda_CheckDriver.Fill(dt_CheckDriver);


            int length = dt_CheckDriver.Rows.Count;
            con.Close();
            if (length == 0)
            {
                return length;
            }

            else
                {
                string on05 = dt_CheckDriver.Rows[0][5].ToString();

                if (on05  == "Assigned")
                {
                    return 1;
                }
                if (on05 == "UnAssigned")
                {
                    return 2;
                }
                else
                {
                    return 3;
                }
            }
            
        }
    }

    protected int checkPhoneInAccoutn()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_PhoneInAccoutn = new SqlCommand("SELECT * FROM Accounts WHERE Phone_No = '" + tbDriverPhone.Text + "'", con);
            SqlDataAdapter sda_PhoneInAccoutn = new SqlDataAdapter(cmd_PhoneInAccoutn);
            DataTable dt_PhoneInAccoutn = new DataTable();
            sda_PhoneInAccoutn.Fill(dt_PhoneInAccoutn);

            int length = dt_PhoneInAccoutn.Rows.Count;
            con.Close();
            return length;
        }
    }

    protected void btnAddDriver_Click(object sender, EventArgs e)
    {
        string owner = Session["USERNAME"] as string;
        int checkDriver = checkDriverInDrivers();
        int checkPhone = checkPhoneInAccoutn();

       // tbLicense_No.Text = checkDriver.ToString();

        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

           
            if (checkDriver == 0)
            {
                if (checkPhone == 0)
                {

                    ////Insert In to Driver  Start////////
                    SqlCommand cmd_insertDriver = new SqlCommand("InsertDriver", con);
                    cmd_insertDriver.CommandType = CommandType.StoredProcedure;


                    SqlParameter DrinverLiceseNo = new SqlParameter()
                    {
                        ParameterName = "@license_Id",
                        Value = tbLicense_No.Text
                    };
                    cmd_insertDriver.Parameters.Add(DrinverLiceseNo);

                    SqlParameter DriverPhoneInToDriverTable = new SqlParameter()
                    {
                        ParameterName = "@Phone_No",
                        Value = tbDriverPhone.Text
                    };
                    cmd_insertDriver.Parameters.Add(DriverPhoneInToDriverTable);

                    SqlParameter DrinverName = new SqlParameter()
                    {
                        ParameterName = "@Name",
                        Value = tbDriver_Name.Text
                    };
                    cmd_insertDriver.Parameters.Add(DrinverName);

                    SqlParameter DrinvermName = new SqlParameter()
                    {
                        ParameterName = "@mName",
                        Value = tbDriver_Ftehrsname.Text
                    };
                    cmd_insertDriver.Parameters.Add(DrinvermName);

                    SqlParameter DrinverTaxi_Plate = new SqlParameter()
                    {
                        ParameterName = "@Taxi_Plate",
                        Value = dlTaxisperOwner.SelectedItem.Value
                    };
                    cmd_insertDriver.Parameters.Add(DrinverTaxi_Plate);

                    SqlParameter Owner_Phone = new SqlParameter()
                    {
                        ParameterName = "@Owner_Phone",
                        Value = owner
                    };
                    cmd_insertDriver.Parameters.Add(Owner_Phone);

                    SqlParameter Driver_Status = new SqlParameter()
                    {
                        ParameterName = "@Driver_Status",
                        Value = "Assigned"
                    };
                    cmd_insertDriver.Parameters.Add(Driver_Status);

                    cmd_insertDriver.ExecuteNonQuery();
                    ////Insert In to Driver  End ////////


                    ///// Insert In to Account /////
                    SqlCommand cmdAccount = new SqlCommand("InsertAccount", con);
                    cmdAccount.CommandType = CommandType.StoredProcedure;



                    SqlParameter DriverAccountEmail = new SqlParameter()
                    {
                        ParameterName = "@Email",
                        Value = tbDriver_Email.Text
                    };
                    cmdAccount.Parameters.Add(DriverAccountEmail);

                    SqlParameter DriverPhone = new SqlParameter()
                    {
                        ParameterName = "@Phone_No",
                        Value = tbDriverPhone.Text
                    };
                    cmdAccount.Parameters.Add(DriverPhone);

                    SqlParameter DriverDPassword = new SqlParameter()
                    {
                        ParameterName = "@Password",
                        Value = Encrpt("TTCR@Driver")
                    };
                    cmdAccount.Parameters.Add(DriverDPassword);

                    SqlParameter DriverAccountType = new SqlParameter()
                    {
                        ParameterName = "@Account_Type",
                        Value = "Driver"
                    };
                    cmdAccount.Parameters.Add(DriverAccountType);

                    SqlParameter DriverAccount_Status = new SqlParameter()
                    {
                        ParameterName = "@Account_Status",
                        Value = "ON"
                    };
                    cmdAccount.Parameters.Add(DriverAccount_Status);

                    SqlParameter DriverAccount_ID = new SqlParameter()
                    {
                        ParameterName = "@Account_ID",
                        Value = -1,
                        Direction = ParameterDirection.Output
                    };
                    cmdAccount.Parameters.Add(DriverAccount_ID);

                    cmdAccount.ExecuteNonQuery();

                    ///// Insert In to Account End /////

                    ///// Upadate Taxi dirver start /////

                    SqlCommand cmd_UpdateTaxiDriver = new SqlCommand("UPDATE Taxis SET Driver_Phone='" + tbDriverPhone.Text + "' WHERE Plate ='" + dlTaxisperOwner.SelectedItem.Value + "'", con);
                    cmd_UpdateTaxiDriver.ExecuteNonQuery();
                    /////  Upadate Taxi dirver end/////


                    try
                    {
                        Byte[] bytes = null;
                        if (fuplDriverLicenseCard.HasFile)
                        {
                            string filename = fuplDriverLicenseCard.PostedFile.FileName;
                            string filePath = Path.GetFileName(filename);
                            Stream fs = fuplDriverLicenseCard.PostedFile.InputStream;
                            BinaryReader br = new BinaryReader(fs);
                            bytes = br.ReadBytes((Int32)fs.Length);
                        }

                        SqlCommand command = new SqlCommand(
                         "INSERT INTO tblImage (ImageName, Image, ReferenceID) " +
                         "Values(@ImageName, @Image, @ReferenceID)", con);
                        command.Parameters.Add("@ImageName",
                        SqlDbType.NVarChar, 20).Value = tbDriver_Name.Text;
                        command.Parameters.Add("@Image",
                        SqlDbType.Binary).Value = bytes;
                        command.Parameters.Add("@ReferenceID",
                        SqlDbType.NVarChar, 20).Value = tbDriverPhone.Text;

                        command.ExecuteNonQuery();

                        divDriverRegistrationSuccess.Visible = true;
                        spnDiverRegistrationSuccess.InnerText = "Driver Assignment successfuly done!";
                    }
                    catch (Exception)
                    {
                        divDriverRegistrationError.Visible = true;
                        spnDroiverRegistrationError.InnerText = "SOMTHING WENT WRONG IN PHOTO UPLOADING, PLEASE CHECK THE FIELD AGAIN!";

                    }

                    //////////////////////Inserting traffic photo end her
                }

                else
                {
                    divDriverRegistrationError.Visible = true;
                    spnDroiverRegistrationError.InnerText = "There is an account with in this phone number in the database, Please check the phone number.";
                    tbDriverPhone.Focus();
                }

            }

            if (checkDriver == 1)
            {
                divDriverRegistrationError.Visible = true;
                spnDroiverRegistrationError.InnerText = "This Driver is working with another taxi currently, Since he/she is not leave working with the another one you can not assigne as your driver!";
            }

            if (checkDriver == 2)
            {
                SqlCommand cmd_UpdateTaxiDriver = new SqlCommand("UPDATE Taxis SET Driver_Phone='" + tbDriverPhone.Text + "' WHERE Plate ='" + dlTaxisperOwner.SelectedItem.Value + "'", con);
                cmd_UpdateTaxiDriver.ExecuteNonQuery();

                    SqlCommand cmd_UpdateDriverTaxi = new SqlCommand("UPDATE Drivers SET Taxi_Plate='" + dlTaxisperOwner.SelectedItem.Value + "' WHERE License_No ='" + tbLicense_No.Text + "'", con);
                    cmd_UpdateDriverTaxi.ExecuteNonQuery();
                    
                    divDriverRegistrationSuccess.Visible = true;
                    spnDiverRegistrationSuccess.InnerText = "The Driver was working with another taxi previously, and now switched to your taxi succesfuly!";

                }
            

        //else
        //{
        //    divDriverRegistrationError.Visible = true;
        //    spnDroiverRegistrationError.InnerText = "Somthing Wrong with this driver detil!";
        //    tbLicense_No.Focus();
        //}
       
            con.Close();
        }
    }

}