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
public partial class TTCRSuperAdmin_DriverDetaileToSuperAdmin : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            if (IsPostBack)
            {
                divDriverRegistrationError.Visible = false;
                divDriverRegistrationSuccess.Visible = false;
                divnotaxiDriverMessage.Visible = false;
            }
            else
            {
                divDriverRegistrationError.Visible = false;
                divDriverRegistrationSuccess.Visible = false;
                divnotaxiDriverMessage.Visible = false;
                gletDriverDetail();
            }
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }


    }

    private void gletDriverDetail()
    {
        getDrivers();
        using (SqlConnection con = new SqlConnection(CS))
        {
            //con.Open();
            SqlCommand cmd_GetDriverDetail = new SqlCommand("Select * From Drivers WHERE Phone_No='" + Request.QueryString["Phone_No"] + "'", con);
            SqlDataAdapter sda_GetDriverDetail = new SqlDataAdapter(cmd_GetDriverDetail);
            DataTable dt_GetDriverDetail = new DataTable();
            sda_GetDriverDetail.Fill(dt_GetDriverDetail);

            if (dt_GetDriverDetail.Rows.Count != 0)
            {
                rptrDrirverDetail.DataSource = dt_GetDriverDetail;
                rptrDrirverDetail.DataBind();

                tbLicense_No.Text = dt_GetDriverDetail.Rows[0][0].ToString();
                tbDriver_Name.Text = dt_GetDriverDetail.Rows[0][2].ToString();
                tbDriver_Ftehrsname.Text = dt_GetDriverDetail.Rows[0][3].ToString();
                //tbDriver_Email.Text = dt_GetDriverDetail.Rows[0][2].ToString();
                tbDriverPhone.Text = dt_GetDriverDetail.Rows[0][1].ToString();
                dlTaxisperOwner.Text = dt_GetDriverDetail.Rows[0][4].ToString();
            }
            else
            {
                divnotaxiDriverMessage.Visible = true;
                divDriverDeatil.Visible = false;
            }


            //con.Close();
        }
    }

    private void getDrivers()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getPlats = new SqlCommand("SELECT Plate FROM Taxis WHERE Owner_Phone ='" + Session["USERNAME"] + "' ORDER BY Plate ASC", con);
            SqlDataReader dr;
            dr = cmd_getPlats.ExecuteReader();

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
}