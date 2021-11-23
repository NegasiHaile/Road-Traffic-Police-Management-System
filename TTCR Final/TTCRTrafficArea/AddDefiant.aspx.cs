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

public partial class TTCRTrafficArea_AddDefiant : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;

    string DefiatUnderBranch = "";
    string DefiatUnderLocation = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["USERNAME"] != null)
        {
            getReceiptVocherNo();
            string brancch = ddlBranchname.Text;
            getBranchs();
            if (brancch == "Select!")
            {
                ddlBranchname.Text = getUserBranch();
            }

            else
            {
                DefiatUnderBranch = brancch;
                ddlBranchname.Text = brancch;
            }
            
            string Location = ddlLocationName.Text;
            getLocations();
            if (Location == "Select!")
            {
                ddlLocationName.Text = getUserLocation();
            }

            else
            {
                DefiatUnderLocation = Location;
                ddlLocationName.Text = Location;
            }
            gettrafficDetail();
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }
    private void getReceiptVocherNo()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getReceiptVocherNo = new SqlCommand("SELECT id FROM Deviants", con);
            SqlDataAdapter sda_getReceiptVocherNo = new SqlDataAdapter(cmd_getReceiptVocherNo);
            DataTable dt_getReceiptVocherNo = new DataTable();
            sda_getReceiptVocherNo.Fill(dt_getReceiptVocherNo);

            int bigvocher = 0;
            int valu = 0;
            for (int i = 0; i < dt_getReceiptVocherNo.Rows.Count; i++)
            {
                valu = int.Parse(dt_getReceiptVocherNo.Rows[i][0].ToString());
                if (bigvocher <= valu)
                {
                    bigvocher = valu + 1;
                }
            }

            spnReceiptVocherNo.InnerText = bigvocher.ToString();
        }
    }
    private void gettrafficDetail()
    {
        string loggeduser = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_trafficDeatil = new SqlCommand("SELECT FName, MName, Branch FROM Traffics WHERE Phone_No='" + loggeduser + "'", con);
            SqlDataAdapter sda_trafficDeatil = new SqlDataAdapter(cmd_trafficDeatil);
            DataTable dt_trafficDeatil = new DataTable();
            sda_trafficDeatil.Fill(dt_trafficDeatil);

            tbRecorderName.Text = dt_trafficDeatil.Rows[0][2].ToString();
            tbRecorderName.Text = dt_trafficDeatil.Rows[0][0].ToString() + " " + dt_trafficDeatil.Rows[0][1].ToString();
        }
    }
    private string getUserLocation()
    {
        string loggeduser = Session["USERNAME"] as string;

        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getUserLocation = new SqlCommand("SELECT Loct_Name FROM Schedule WHERE Traffic_Phone = '" + loggeduser + "'", con);
            SqlDataAdapter sda_getUserLocation = new SqlDataAdapter(cmd_getUserLocation);
            DataTable dt_getUserLocation = new DataTable();
            sda_getUserLocation.Fill(dt_getUserLocation);

            string Location = dt_getUserLocation.Rows[0][0].ToString();
            con.Close();
            return Location;
        }
    }

    private void getLocations()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getLocations = new SqlCommand("SELECT Loct_Name FROM Locations ORDER BY Loct_Name ASC", con);
            SqlDataReader dr;
            dr = cmd_getLocations.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlLocationName.Items.Add(dr[0].ToString());
                }
            }

            con.Close();
        }
    }
protected string getUserBranch()
    {
        string loggeduser = Session["USERNAME"] as string;

        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getUserBranch = new SqlCommand("SELECT Branch FROM Traffics WHERE Phone_No = '" + loggeduser + "'", con);
            SqlDataAdapter sda_getUserBranch = new SqlDataAdapter(cmd_getUserBranch);
            DataTable dt_getUserBranch = new DataTable();
            sda_getUserBranch.Fill(dt_getUserBranch);

            string branch = dt_getUserBranch.Rows[0][0].ToString();
            con.Close();
            return branch;
        }
    }

    protected void getBranchs()
    {
        string loggeduser = Session["USERNAME"] as string;

        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getBranchs = new SqlCommand("SELECT BrancName FROM Branchs", con);
            SqlDataReader dr;
            dr = cmd_getBranchs.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlBranchname.Items.Add(dr[0].ToString());
                }
            }
            con.Close();
        }
    }

    protected string checkPlateIfInSearchDaviant()
    {
        using(SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_CheckPlateIfinsearch = new SqlCommand("SELECT * FROM Deviants WHERE Plate ='"+tbTaxiPlateNO.Text+"' AND Status='"+ "InSearch" + "'", con);
            SqlDataAdapter sda_CheckPlateIfinsearch = new SqlDataAdapter(cmd_CheckPlateIfinsearch);
            DataTable dt_CheckPlateIfinsearch = new DataTable();
            sda_CheckPlateIfinsearch.Fill(dt_CheckPlateIfinsearch);

            string returningvalue;

            if(dt_CheckPlateIfinsearch.Rows.Count == 0)
            {
                returningvalue = "NotExist";
            }

            else
            {
                returningvalue = "Exist";
            }
            con.Close();
            return returningvalue;
        } 
    }
    protected void btnDefiateSubmition_Click(object sender, EventArgs e)
    {

        string checkPlateinDaviant = checkPlateIfInSearchDaviant();

        try
        {
           if(checkPlateinDaviant == "NotExist")
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd_insertDefiant = new SqlCommand("InsertDefiant", con);
                    cmd_insertDefiant.CommandType = CommandType.StoredProcedure;

                    SqlParameter Branch = new SqlParameter()
                    {
                        ParameterName = "@Branch",
                        Value = DefiatUnderBranch
                    };
                    cmd_insertDefiant.Parameters.Add(Branch);

                    SqlParameter Location = new SqlParameter()
                    {
                        ParameterName = "@Location",
                        Value = DefiatUnderLocation
                    };
                    cmd_insertDefiant.Parameters.Add(Location);

                    SqlParameter Plate = new SqlParameter()
                    {
                        ParameterName = "@Plate",
                        Value = tbTaxiPlateNO.Text
                    };
                    cmd_insertDefiant.Parameters.Add(Plate);

                    SqlParameter Phone = new SqlParameter()
                    {
                        ParameterName = "@Phone",
                        Value = Session["USERNAME"] as string
                    };
                    cmd_insertDefiant.Parameters.Add(Phone);

                    SqlParameter Description = new SqlParameter()
                    {
                        ParameterName = "@Description",
                        Value = tbDefiantDescription.Text
                    };
                    cmd_insertDefiant.Parameters.Add(Description);

                    SqlParameter Status = new SqlParameter()
                    {
                        ParameterName = "@Status",
                        Value = "InSearch"
                    };
                    cmd_insertDefiant.Parameters.Add(Status);

                    SqlParameter DefiantDateTime = new SqlParameter()
                    {
                        ParameterName = "@DateTime",
                        Value = DateTime.Now
                    };
                    cmd_insertDefiant.Parameters.Add(DefiantDateTime);

                    SqlParameter OwnerPhone = new SqlParameter()
                    {
                        ParameterName = "@Owner_Phone",
                        Value = getOwner_Phone()
                    };
                    cmd_insertDefiant.Parameters.Add(OwnerPhone);

                    SqlParameter Driver_Phone = new SqlParameter()
                    {
                        ParameterName = "@Driver_Phone",
                        Value = getDriver_Phone()
                    };
                    cmd_insertDefiant.Parameters.Add(Driver_Phone);

                    SqlParameter DefiantId = new SqlParameter()
                    {
                        ParameterName = "@Id",
                        Value = -1,
                        Direction = ParameterDirection.Output
                    };
                    cmd_insertDefiant.Parameters.Add(DefiantId);

                    con.Open();
                    cmd_insertDefiant.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("AddDefiant.aspx");

                    ddlBranchname.Text = getUserBranch();
                    ddlLocationName.Text = getUserLocation();
                    tbTaxiPlateNO.Text = "";
                    tbDefiantDescription.Text = "";

                    Response.Write("<script language=javascript> alert ('It successfuly Exposed to all locations of the city!') </script>");
                    ddlBranchname.Focus();
                }
            }

            else
            {
                Response.Write("<script language=javascript> alert ('this taxi is peviously added as a defiant, you can check it in the list!') </script>");
            }
        }
        catch
        {
            Response.Write("<script language=javascript> alert ('Somthing went wrong, please try again!') </script>");
        }

    }

    private string getDriver_Phone()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getDriver_Phone = new SqlCommand("SELECT Driver_Phone FROM Taxis WHERE Plate='"+tbTaxiPlateNO.Text+"'", con);
            SqlDataAdapter sda_getDriver_Phone = new SqlDataAdapter(cmd_getDriver_Phone);
            DataTable dt_getDriver_Phone = new DataTable();
            sda_getDriver_Phone.Fill(dt_getDriver_Phone);

            string getDriver_Phone;
            if (dt_getDriver_Phone.Rows.Count == 1)
            {
                getDriver_Phone = dt_getDriver_Phone.Rows[0][0].ToString();
            }

            else
            {
                getDriver_Phone = "00000000000";
            }

            con.Close();
            return getDriver_Phone;
        }
    }

    private string getOwner_Phone()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getOwner_Phone = new SqlCommand("SELECT Owner_Phone FROM Taxis WHERE Plate='" + tbTaxiPlateNO.Text + "'", con);
            SqlDataAdapter sda_getOwner_Phone = new SqlDataAdapter(cmd_getOwner_Phone);
            DataTable dt_getOwner_Phone = new DataTable();
            sda_getOwner_Phone.Fill(dt_getOwner_Phone);

            string getOwner_Phone;

            if (dt_getOwner_Phone.Rows.Count == 1)
            {
                getOwner_Phone = dt_getOwner_Phone.Rows[0][0].ToString();
            }

            else
            {
                getOwner_Phone = "00000000000";
            }
            con.Close();
            return getOwner_Phone;


        }
    }
}