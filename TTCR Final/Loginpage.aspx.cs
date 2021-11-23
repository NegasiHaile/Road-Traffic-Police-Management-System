using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

public partial class Loginpage : System.Web.UI.Page
{

    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblLogInError.Visible = false;
        tbLogInUserName.Focus();

        if (!IsPostBack)
        {
            if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
            {
                tbLogInUserName.Text = Request.Cookies["UserName"].Value;
                tbLogInPassword.Attributes["Value"] = Request.Cookies["Password"].Value;
                cbLogInRememberPassword.Checked = true;
            }

            else
            {
                //lblLogInErrorDisplay.Visible = true;
                //lblLogInErrorDisplay.Text = "Please Enter your password and User name Proporly!";
                //tbLogInUserName.Focus();
            }
        }
    }

    private string Encrpt(string strEncrString)
    {

        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrString);
        string Eecripted = Convert.ToBase64String(b);
        return Eecripted;
    }

    protected void btnLogIn_Click1(object sender, EventArgs e)
    {

        lblLogInError.Text = tbLogInUserName.Text;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string Password = Encrpt(tbLogInPassword.Text);
             
            SqlCommand cmd_Authentication = new SqlCommand("SELECT * FROM Accounts WHERE Phone_No = @UserPhone_No AND Password = @UserPassword", con);
            cmd_Authentication.Parameters.AddWithValue("@UserPhone_No", tbLogInUserName.Text);
            cmd_Authentication.Parameters.AddWithValue("@UserPassword", Password);
            con.Open();
            SqlDataAdapter sda_Authentication = new SqlDataAdapter(cmd_Authentication);
            DataTable dt_Authentication = new DataTable();
            sda_Authentication.Fill(dt_Authentication);


            cmd_Authentication.ExecuteNonQuery();


            if (dt_Authentication.Rows.Count != 0)
            {
                if (dt_Authentication.Rows[0][5].ToString() == "ON")
                {
                    if (cbLogInRememberPassword.Checked)
                    {

                        Response.Cookies["UserName"].Value = tbLogInUserName.Text;
                        Response.Cookies["Password"].Value = tbLogInPassword.Text;

                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(2);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(2);

                    }
                    else
                    {

                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                    }
                    /// Super Admin
                    if (dt_Authentication.Rows[0][4].ToString() == "Super Admin")
                    {
                        Session["USERNAME"] = tbLogInUserName.Text;
                        Response.Redirect("~/TTCRSuperAdmin/SuperAdminHome.aspx");
                    }

                    if (dt_Authentication.Rows[0][4].ToString() == "Branch Officer")
                    {
                        Session["USERNAME"] = tbLogInUserName.Text;
                        Response.Redirect("~/TTCRBranchAdmin/BranchAdminHome.aspx");
                    }

                    if (dt_Authentication.Rows[0][4].ToString() == "Out Office")
                    {
                        Session["USERNAME"] = tbLogInUserName.Text;
                        Response.Redirect("~/TTCRTrafficArea/TrafficHome.aspx");
                    }


                    if (dt_Authentication.Rows[0][4].ToString() == "TaxiOwner")
                    {
                        Session["USERNAME"] = tbLogInUserName.Text;
                        Response.Redirect("~/TTCROwnerArea/OwnerHome.aspx");
                    }

                    if (dt_Authentication.Rows[0][4].ToString() == "Driver")
                    {
                        Session["USERNAME"] = tbLogInUserName.Text;
                        Response.Redirect("~/TTCRDriverArae/DriverHome.aspx");
                    }

                    else
                    {
                        Response.Write("<script language=javascript>alert('Pages for this Account Comming soon!')</script>");
                    }


                }
                /// End of super Adim
                else
                {
                    Response.Write("<script language=javascript>alert('Your Account is deactivated please contact your officer!')</script>");
                }

                
                //Response.Write("<script language=javascript>alert('Correct password and username!')</script>");
                //lblLogInError.Visible = true;
                //lblLogInError.Text = "Correct at all!";
            }

            else
            {
                Response.Write("<script language=javascript>alert('You Are Invalid User')</script>");
            }

            con.Close();
        }
    }
}