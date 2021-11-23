using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class TTCRSuperAdmin_NewSuperAdminRegistration : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        getAllSuperAdmins();
    }
    private string Encrpt(string strEncrString)
    {

        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrString);
        string Eecripted = Convert.ToBase64String(b);
        return Eecripted;
    }

    protected void getAllSuperAdmins()
    {
        using(SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getSupers = new SqlCommand("SELECT * FROM Accounts WHERE Account_Type = 'Super Admin         '", con);
            con.Open();
            SqlDataAdapter sda_getSupers = new SqlDataAdapter(cmd_getSupers);
            DataTable dt_getSupers = new DataTable();
            sda_getSupers.Fill(dt_getSupers);
            con.Close();

            rptrAllSupers.DataSource = dt_getSupers;
            rptrAllSupers.DataBind();
            
        }
    }
    protected void btnRegisterSuperAdmin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS)) {

            SqlCommand cmd_CheckSuper = new SqlCommand("SELECT * FROM Accounts WHERE Phone_No = '"+tbSuperAdminPhone.Text+"'", con);
            con.Open();
            SqlDataAdapter sda_CheckSuper = new SqlDataAdapter(cmd_CheckSuper);
            DataTable dt_CheckSuper = new DataTable();
            sda_CheckSuper.Fill(dt_CheckSuper);


            if(dt_CheckSuper.Rows.Count == 0)
            {
            ///////////////// Insert in to Account
            if (tbSuperAdminPassword.Text.Length >= 6)
            {
                if (tbSuperAdminPassword.Text == tbSuperAdminRepeatpassword.Text)
                {
                    SqlCommand cmdAccount = new SqlCommand("InsertAccount", con);
                    cmdAccount.CommandType = CommandType.StoredProcedure;



                    SqlParameter SuperAdminAccountEmail = new SqlParameter()
                    {
                        ParameterName = "@Email",
                        Value = tbSuperAdminEmail.Text
                    };
                    cmdAccount.Parameters.Add(SuperAdminAccountEmail);

                    SqlParameter SuperAdminPhone = new SqlParameter()
                    {
                        ParameterName = "@Phone_No",
                        Value = tbSuperAdminPhone.Text
                    };
                    cmdAccount.Parameters.Add(SuperAdminPhone);

                    SqlParameter SuperAdminPassword = new SqlParameter()
                    {
                        ParameterName = "@Password",
                        Value = Encrpt(tbSuperAdminPassword.Text)
                    };
                    cmdAccount.Parameters.Add(SuperAdminPassword);

                    SqlParameter SuperAdminAccountType = new SqlParameter()
                    {
                        ParameterName = "@Account_Type",
                        Value = "Super Admin"
                    };
                    cmdAccount.Parameters.Add(SuperAdminAccountType);

                    SqlParameter SuperAdminAccount_Status = new SqlParameter()
                    {
                        ParameterName = "@Account_Status",
                        Value = "ON"
                    };
                    cmdAccount.Parameters.Add(SuperAdminAccount_Status);

                    SqlParameter SuperAdminAccount_ID = new SqlParameter()
                    {
                        ParameterName = "@Account_ID",
                        Value = -1,
                        Direction = ParameterDirection.Output
                    };
                    cmdAccount.Parameters.Add(SuperAdminAccount_ID);

                   

                    cmdAccount.ExecuteNonQuery();

                    con.Close();
                        getAllSuperAdmins();
                    Response.Write("<script language=javascript>alert('Super Admin Registered Successfuly!')</script>");
                    tbSuperAdminEmail.Text = "";
                    tbSuperAdminPhone.Text = "";
                    tbSuperAdminPassword.Text = "";
                    tbSuperAdminRepeatpassword.Text = "";
                }

                else
                {
                    Response.Write("<script language=javascript>alert('Password not much!')</script>");
                    tbSuperAdminPassword.Focus();
                }
            }

            else
            {
                Response.Write("<script language=javascript>alert('Password Too short!')</script>");
                tbSuperAdminPassword.Focus();
            }
                /////////////////// End of Inserting in to account
            }
            else
            {
                Response.Write("<script language=javascript>alert('There is an account opened with this phone number please check your number!')</script>");
            }
        }
    }
}