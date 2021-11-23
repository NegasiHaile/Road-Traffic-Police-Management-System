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

public partial class TTCRSuperAdmin_LocationRegistration : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        divLocationRegistrationError.Visible = false;
        divLocationRegistrationSuccess.Visible = false;
        if (!IsPostBack)
        {
            
            getBranchs();
        }
    }

    private void getBranchs()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmdgetBranchs = new SqlCommand("SELECT BrancName FROM Branchs ORDER BY BrancName ASC", con);
            SqlDataReader dr;
            dr = cmdgetBranchs.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlLocationBranch.Items.Add(dr[0].ToString());
                }
            }
            con.Close();
        }
    }

    protected void btnregisterLocation_Click(object sender, EventArgs e)
    {


        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmdgetBranchs = new SqlCommand("SELECT * FROM Locations WHERE BranchName ='"+ ddlLocationBranch.SelectedItem.Value + "' AND Loct_Name ='"+tbLocationName.Text+"'", con);
            SqlDataReader dr;
            dr = cmdgetBranchs.ExecuteReader();

            if (!dr.HasRows)
            {
                con.Close();
                if (ddlLocationBranch.SelectedItem.Value != "Select location branch")
                {
                    try
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

                        divLocationRegistrationSuccess.Visible = true;
                        spnLocationRegistrationSuccess.InnerText = "Location Added Succesfully!";
                    }
                    catch
                    {
                        divLocationRegistrationError.Visible = true;
                        spnLocationRegistrationError.InnerText = "Somthing went wrong, Please try again!";
                    }
                }
                else
                {
                    divLocationRegistrationError.Visible = true;
                    spnLocationRegistrationError.InnerText = "Empty fields detected!";
                    ddlLocationBranch.Focus();
                }
            }
            else
            {
                divLocationRegistrationError.Visible = true;
                spnLocationRegistrationError.InnerText = "Ther is a location name in "+ddlLocationBranch.SelectedItem.Value+" same to this one, please write the location name correctly!";
                tbLocationName.Focus();
            }
        }
    }
}