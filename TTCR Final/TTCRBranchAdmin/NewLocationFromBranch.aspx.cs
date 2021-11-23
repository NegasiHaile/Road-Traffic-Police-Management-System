using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class TTCRBranchAdmin_NewLocationFromBranch : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;

    
    protected void Page_Load(object sender, EventArgs e)
    {

        if(Session["USERNAME"] != null)
        {
            divTrafficRegistrationSuccess.Visible = false;
            divTrafficRegistrationErorr.Visible = false;

            string loggedUsername = Session["USERNAME"] as string;
            GetLocationsUnderBranch();
            DeleteLocation();
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }


    protected void DeleteLocation()
    {
        try
        {
            if (Request.QueryString["Id"] != null)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {


                    con.Open();
                    SqlCommand cmd_DeleteLocation = new SqlCommand("DELETE FROM Locations WHERE Id ='" + Request.QueryString["Id"].ToString() + "'", con);
                    cmd_DeleteLocation.ExecuteNonQuery();
                    con.Close();

                    //Response.Redirect("ListOfLocations.aspx");

                    divTrafficRegistrationSuccess.Visible = true;
                    spnLocationReisteredSuccesfuly.InnerText = "Location Deleted Successfully!";
                    GetLocationsUnderBranch();


            }
        }
        }
        catch
        {
        }
    }
    protected string getBranchname()
    {
        string loggedUsername = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_LocationOfBranch = new SqlCommand("SELECT * FROM Traffics WHERE Phone_No ='" + loggedUsername + "'", con);
            SqlDataAdapter sda_LocationOfBranch = new SqlDataAdapter(cmd_LocationOfBranch);
            DataTable dt_LocationOfBranch = new DataTable();
            sda_LocationOfBranch.Fill(dt_LocationOfBranch);

            ddlLocationBranch.Items.Add(dt_LocationOfBranch.Rows[0][9].ToString());
            return dt_LocationOfBranch.Rows[0][9].ToString();
        }
        
    }

    protected int checkLocation()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_CheckLocation = new SqlCommand("SELECT Loct_Name FROM Locations WHERE BranchName ='"+ getBranchname() + "' AND Loct_Name = '" + tbLocationName.Text + "'", con);
            SqlDataAdapter sda_CheckLocation = new SqlDataAdapter(cmd_CheckLocation);
            DataTable dt_CheckLocation = new DataTable();
            sda_CheckLocation.Fill(dt_CheckLocation);

            return dt_CheckLocation.Rows.Count;
        }
    }
    protected void GetLocationsUnderBranch()
    {
        string loggedUsername = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {

            string loggeduserBranch = getBranchname();

            SqlCommand cmd_getBranchLocations = new SqlCommand("SELECT * FROM Locations WHERE BranchName ='"+loggeduserBranch+"'", con);
            SqlDataAdapter sda_getBranchLocations = new SqlDataAdapter(cmd_getBranchLocations);
            DataTable dt_getBranchLocations = new DataTable();
            sda_getBranchLocations.Fill(dt_getBranchLocations);

            rptrBranchLocations.DataSource = dt_getBranchLocations;
            rptrBranchLocations.DataBind();


        }

    }

    protected void btnregisterLocation_Click(object sender, EventArgs e)
    {

        if (checkLocation() == 0)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd_AddRegisterLocation = new SqlCommand("InserLocation", con);
                cmd_AddRegisterLocation.CommandType = CommandType.StoredProcedure;

                SqlParameter LoacationBranch = new SqlParameter()
                {
                    ParameterName = "@BranchName",
                    Value = ddlLocationBranch.SelectedItem.Value
                };
                cmd_AddRegisterLocation.Parameters.Add(LoacationBranch);

                SqlParameter LocationaName = new SqlParameter()
                {
                    ParameterName = "@Loct_Name",
                    Value = tbLocationName.Text
                };
                cmd_AddRegisterLocation.Parameters.Add(LocationaName);

                SqlParameter LocationInfo = new SqlParameter()
                {
                    ParameterName = "@Loca_Info",
                    Value = tbLocationAddtionalInfo.Text
                };
                cmd_AddRegisterLocation.Parameters.Add(LocationInfo);

                SqlParameter LocationId = new SqlParameter()
                {
                    ParameterName = "@Id",
                    Value = -1,
                    Direction = ParameterDirection.Output
                };
                cmd_AddRegisterLocation.Parameters.Add(LocationId);

                con.Open();
                cmd_AddRegisterLocation.ExecuteNonQuery();
                con.Close();

                //Response.Redirect("NewLocationFromBranch.aspx");

                divTrafficRegistrationErorr.Visible = false;
                divTrafficRegistrationSuccess.Visible = true;
                spnLocationReisteredSuccesfuly.InnerText = "Location Added Succesfully!";
            GetLocationsUnderBranch();

        }
    }
        else
        {

            divTrafficRegistrationErorr.Visible = true;
            spnLocationReisteredError.InnerText = "This location is aready in the database pealse chake the name of the location!";
            tbLocationName.Focus();
        }

    }
}