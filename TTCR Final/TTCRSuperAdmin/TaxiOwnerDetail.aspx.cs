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

public partial class TTCRSuperAdmin_TaxiOwnerDetail : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    public string OwnerPhone;
    protected void Page_Load(object sender, EventArgs e)
    {
        OwnerPhone = Request.QueryString["Phone_No"].ToString();
        if (Session["USERNAME"] != null)
        {
            if (IsPostBack)
            {

            }

            else
            {
                getOwnerDetail();
                DisableForms();
                getListOftaxiPerOwner();
            }
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }

    private void getListOftaxiPerOwner()
    {
        string OwnerPhoneNo = Request.QueryString["Phone_No"].ToString();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getTaxisPerOwner = new SqlCommand("SELECT * FROM Taxis WHERE Owner_Phone='" + OwnerPhoneNo + "'", con);
            SqlDataAdapter sda_getTaxisPerOwner = new SqlDataAdapter(cmd_getTaxisPerOwner);
            DataTable dt_getTaxisPerOwner = new DataTable();
            sda_getTaxisPerOwner.Fill(dt_getTaxisPerOwner);

            rptrListOfTaxisPerOwner.DataSource = dt_getTaxisPerOwner;
            rptrListOfTaxisPerOwner.DataBind();
        }
    }

    private void DisableForms()
    {
        divTradelicense.Visible = false;
        divButtonUpdatedetail.Visible = false;
    }

    protected void getOwnerDetail()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {

            
            Page.DataBind();

            con.Open();
            SqlCommand cmd_OwnerDetail = new SqlCommand("SELECT * FROM Owners WHERE Phone_No ='" + OwnerPhone + "'", con);
            SqlDataAdapter sda_OwnerDetail = new SqlDataAdapter(cmd_OwnerDetail);
            DataTable dt_OwnerDetail = new DataTable();
            sda_OwnerDetail.Fill(dt_OwnerDetail);

            tbOwnerFName.Text = dt_OwnerDetail.Rows[0][2].ToString();
            tbOwnerMName.Text = dt_OwnerDetail.Rows[0][3].ToString();
            tbOwnerLName.Text = dt_OwnerDetail.Rows[0][4].ToString();
            tbOwnerPhone.Text = dt_OwnerDetail.Rows[0][1].ToString();
            tbOwnerTellephone.Text = dt_OwnerDetail.Rows[0][6].ToString();
            tbOwnerEmail.Text = dt_OwnerDetail.Rows[0][7].ToString();
            ddlOwnerGender.Text = dt_OwnerDetail.Rows[0][5].ToString();

            con.Close();
        }
    }

    protected void LbtnEnableOwnerDetailEditing_Click(object sender, EventArgs e)
    {
            divTradelicense.Visible = true;
            divButtonUpdatedetail.Visible = true;
    }
    protected void LbtnUpdateOwnerDetail_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {

            if (fupldOwnerTradeLicens.HasFile)
            {
                try
                {
                    Byte[] bytes = null;


                    string filename = fupldOwnerTradeLicens.PostedFile.FileName;
                    string filePath = Path.GetFileName(filename);
                    Stream fs = fupldOwnerTradeLicens.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    bytes = br.ReadBytes((Int32)fs.Length);


                    SqlCommand commandImageFile = new SqlCommand("UPDATE tblImageFile SET Image = @Image WHERE ReferenceID ='" + Request.QueryString["Phone_No"].ToString() + "'", con);

                    commandImageFile.Parameters.Add("@Image",
                    SqlDbType.Binary).Value = bytes;

                    con.Open();
                    commandImageFile.ExecuteNonQuery();
                    con.Close();
                    


                }

                
                catch (Exception)
                {
                    Response.Write("<script>alert('Somthing wrong with Updating of the trade license, please try it again!')</script>");
                }
            }

            OwnerPhone = Request.QueryString["Phone_No"].ToString();
            SqlCommand cmdUpdateOwnerDetail = new SqlCommand(
                "UPDATE Owners SET FName = @FName, MName = @MName, LName = @LName, Gender = @Gender, TellePhone = @TellePhone, Email = @Email  WHERE Phone_No ='" + OwnerPhone + "'", con);
            cmdUpdateOwnerDetail.Parameters.Add("@FName", 
            SqlDbType.NVarChar, 20).Value = tbOwnerFName.Text;
            cmdUpdateOwnerDetail.Parameters.Add("@MName",
            SqlDbType.NVarChar, 20).Value = tbOwnerMName.Text; 
            cmdUpdateOwnerDetail.Parameters.Add("@LName",
            SqlDbType.NVarChar, 20).Value = tbOwnerLName.Text;
            cmdUpdateOwnerDetail.Parameters.Add("@Gender", 
            SqlDbType.NVarChar, 20).Value = ddlOwnerGender.SelectedItem.Value;
            cmdUpdateOwnerDetail.Parameters.Add("@TellePhone", 
            SqlDbType.NVarChar, 20).Value = tbOwnerTellephone.Text;
            cmdUpdateOwnerDetail.Parameters.Add("@Email", 
            SqlDbType.NVarChar, 20).Value = tbOwnerEmail.Text;



            con.Open();
            cmdUpdateOwnerDetail.ExecuteNonQuery();
            con.Close();
            getOwnerDetail();
            Response.Write("<script>alert('Updating has been Done!')</script>");

            getOwnerDetail();
            DisableForms();
            getListOftaxiPerOwner();

        }
    }
}