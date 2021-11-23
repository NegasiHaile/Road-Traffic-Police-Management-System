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

public partial class TTCRTrafficArea_DeviantFound : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            getDefiantDetail();
            DisableFields();
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }



    private void getDefiantDetail()
    {
        string DviantId = Request.QueryString["Id"].ToString();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_DeviantById = new SqlCommand("SELECT * FROM Deviants WHERE Id ='"+ DviantId + "'", con);
            SqlDataAdapter sda_DeviantById = new SqlDataAdapter(cmd_DeviantById);
            DataTable dt_DeviantById = new DataTable();
            sda_DeviantById.Fill(dt_DeviantById);

            spnReceiptVocherNo.InnerText = dt_DeviantById.Rows[0][0].ToString();
            spnDate.InnerText = dt_DeviantById.Rows[0][7].ToString();

            ddlBranchname.Text = dt_DeviantById.Rows[0][1].ToString();
            ddlLocationName.Text = dt_DeviantById.Rows[0][2].ToString();

            tbTaxiPlateNO.Text = dt_DeviantById.Rows[0][3].ToString();
            tbDefiantDescription.Text = dt_DeviantById.Rows[0][5].ToString();
            tbRecorderName.Text = dt_DeviantById.Rows[0][4].ToString();
        }
    }

    private void DisableFields()
    {
        ddlBranchname.ReadOnly = false;
        ddlLocationName.ReadOnly = false;
        tbTaxiPlateNO.ReadOnly = true;
        tbDefiantDescription.ReadOnly = true;
        tbRecorderName.ReadOnly = true;
    }
}