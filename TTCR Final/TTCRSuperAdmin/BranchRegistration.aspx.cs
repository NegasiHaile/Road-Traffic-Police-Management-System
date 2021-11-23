using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class TTCRSuperAdmin_BranchRegistration : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        //divBranchRegistrationSuccess.Visible = false;
        //divBranchRegistrationError.Visible = false;

    }

    protected void btnAddBranch_Click(object sender, EventArgs e)
    {
        try { 

        using (SqlConnection con = new SqlConnection(CS))
        {
                SqlCommand cmd_CheckBranchExisting = new SqlCommand("SELECT BrancName FROM Branchs WHERE BrancName = '"+tbBranchName.Text+"'", con);
                SqlDataAdapter sda_CheckBranchExisting = new SqlDataAdapter(cmd_CheckBranchExisting);
                DataTable dt_CheckBranchExisting = new DataTable();
                sda_CheckBranchExisting.Fill(dt_CheckBranchExisting);

                if(dt_CheckBranchExisting.Rows.Count == 0)
                {
                    SqlCommand cmd_PhoneEsixtance = new SqlCommand("SELECT BranchPhone FROM Branchs WHERE BranchPhone = '" + tbbranchtellephone.Text + "'", con);
                    SqlDataAdapter sda_PhoneEsixtance = new SqlDataAdapter(cmd_PhoneEsixtance);
                    DataTable dt_PhoneEsixtance = new DataTable();
                    sda_PhoneEsixtance.Fill(dt_PhoneEsixtance);

                    if(dt_PhoneEsixtance.Rows.Count == 0)
                    {
                        SqlCommand cmdAddBranch = new SqlCommand("InsertBranch", con);
                        cmdAddBranch.CommandType = CommandType.StoredProcedure;

                        SqlParameter Branchname = new SqlParameter()
                        {
                            ParameterName = "@BrancName",
                            Value = tbBranchName.Text
                        };
                        cmdAddBranch.Parameters.Add(Branchname);


                        SqlParameter BranchTellephone = new SqlParameter()
                        {
                            ParameterName = "@BranchPhone",
                            Value = tbbranchtellephone.Text
                        };
                        cmdAddBranch.Parameters.Add(BranchTellephone);

                        SqlParameter BranchId = new SqlParameter()
                        {
                            ParameterName = "@Id",
                            Value = -1,
                            Direction = ParameterDirection.Output
                        };
                        cmdAddBranch.Parameters.Add(BranchId);

                        con.Open();
                        cmdAddBranch.ExecuteNonQuery();
                        con.Close();

                        tbBranchName.Text = "";
                        tbbranchtellephone.Text = "";
                        tbBranchName.Focus();

                        Response.Write("<script langudge: javascript > alert('The Branch has been Added Successfuly'); </script>");
                        //divBranchRegistrationSuccess.Visible = true;
                        //spnBranchRegistrationSuccess.InnerHtml = "The Branch has been Added Successfuly";
                    }

                    else
                    {
                        Response.Write("<script langudge: javascript > alert('This phone number is taken by another branch, Please check it!');</script>");
                        tbbranchtellephone.Focus();
                    }

                }

                else
                {
                    Response.Write("<script langudge: javascript > alert('This Branch is already in the databases!'); </script>");
                    tbBranchName.Focus();
                    //divBranchRegistrationError.Visible = true;
                    //spnBranchRegistrationError.InnerText = "This Branch is already registered!";
                }
            }
        }
        catch (Exception ex)
        {

        }
    }
}


//String StrCon = "Your Connection";
//SqlConnection objcon = new sqlconnection(StrCon);
//objcon.open();

//string query = "select Student from table where Batchid='" + Dropdownlist1.selectedItem.text + "'";

//sqlcommand cmd = new sqlcommand(query, objcon);
//sqldatareader dr;
//dr=cmd.executereader();

//if (dr.hasrows)
//  {while(dr.read())
//  {
//    dropdownlist2.items.add(dr[0].tostring());
//  }
//}