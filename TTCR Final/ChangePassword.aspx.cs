using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class ChangePassword : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    public string loggeduser;
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (Session["USERNAME"] != null)
        {
            divChangePasswordSuccess.Visible = false;
            divdivChangePasswordError.Visible = false;
        }

        else
        {
            Response.Redirect("Loginpage.aspx");
        }
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
         loggeduser = Session["USERNAME"].ToString();
        // btnChangePassword.OnClientClick.return ("alert('')");
        if(tbYourNewPassword.Text == tbRetypePasssword.Text)
        {
            string YourNewPassword = EncrptPassword(tbYourNewPassword.Text);
            if (CheckPassword())
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlCommand cmd_getMyTaxis = new SqlCommand("UPDATE Accounts SET Password = '" + YourNewPassword + "' WHERE Phone_No='" + loggeduser + "'", con);
                    cmd_getMyTaxis.ExecuteNonQuery();
                    con.Close();

                    divChangePasswordSuccess.Visible = true;
                    spndivChangePasswordSuccess.InnerText = "Your Password has been Changed Successfuly!";
                    Response.Write("<script language=javascript>alert('Your Password has been Changed Successfuly, Now you can login with your new password!')</script>");

                    //Session["USERNAME"] = null;
                    //Response.Redirect("~/LoginPage.aspx");
                }

            }

            else
            {
                divdivChangePasswordError.Visible = true;
                spndivChangePasswordError.InnerText = "Please insert your old password correctly!";
            }
        }

        else
        {
            divdivChangePasswordError.Visible = true;
            spndivChangePasswordError.InnerText = "Password Not Match, Please retype again!";
            tbYourNewPassword.Focus();
            //tbYourNewPassword.Text = "";
            //tbRetypePasssword.Text = "";
        }

    }

    private bool CheckPassword()
    {

        using (SqlConnection con = new SqlConnection(CS))
        {
            string oldPassWord = EncrptPassword(tbBOldPasswordd.Text);
            SqlCommand cmd_GetOldPassword = new SqlCommand("SELECT Password FROM Accounts WHERE Phone_No='" + loggeduser + "'", con);
            SqlDataAdapter sda_GetOldPassword = new SqlDataAdapter(cmd_GetOldPassword);
            DataTable dt_GetOldPassword = new DataTable();
            sda_GetOldPassword.Fill(dt_GetOldPassword);

            string RetrivedOldPassword = dt_GetOldPassword.Rows[0][0].ToString();
            
            //tbRetypePasssword.Text = RetrivedOldPassword;
            if (oldPassWord == RetrivedOldPassword)
            {
                return true;
            }

            else
            {
                return false;
            }
        }
    }

    private string EncrptPassword(string strEncrString)
    {

        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrString);
        string Eecripted = Convert.ToBase64String(b);
        return Eecripted;
    }
}