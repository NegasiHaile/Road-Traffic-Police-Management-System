using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class TTCRSuperAdmin_EditBranch : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

         if(Session["USERNAME"] != null)
        {
            divBranchRegistrationError.Visible = false;
            divBranchRegistrationSuccess.Visible = false;

            //Response.Cookies["BranchName"].Value = tbBranchName.Text;

            //tbBranchName.Text = Response.Cookies["BranchName"].Value;

            if (IsPostBack)
            {
                //tbBranchName.Text = tbBranchName.Text;
                //tbbranchtellephone.Text = tbbranchtellephone.Text;

            }

            else
            {
                GetbranchName();
            }
        }

        else
        {
            Response.Redirect("../Loginpage.aspx");
        }

    }

    protected  void GetbranchName()
    {
        string BrancId = Request.QueryString["Id"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_GetBranch = new SqlCommand("SELECT * FROM Branchs WHERE Id='" + BrancId + "'", con);
            SqlDataAdapter sda_GetBranch = new SqlDataAdapter(cmd_GetBranch);
            DataTable dt_GetBranch = new DataTable();
            sda_GetBranch.Fill(dt_GetBranch);
            spnBranchName.InnerText = dt_GetBranch.Rows[0][1].ToString();
            tbBranchName.Text = dt_GetBranch.Rows[0][1].ToString();
            tbbranchtellephone.Text = dt_GetBranch.Rows[0][2].ToString();
            con.Close();
        }
    }

    protected void lbtnupdateBranch_Click1(object sender, EventArgs e)
    {
        string BrancId = Request.QueryString["Id"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_GetBranch = new SqlCommand("SELECT * FROM Branchs WHERE Id='" + BrancId + "'", con);
            SqlDataAdapter sda_GetBranch = new SqlDataAdapter(cmd_GetBranch);
            DataTable dt_GetBranch = new DataTable();
            sda_GetBranch.Fill(dt_GetBranch);

           string BName = dt_GetBranch.Rows[0][1].ToString();
           string  BTelephone = dt_GetBranch.Rows[0][2].ToString();
            if(tbBranchName.Text == BName && tbbranchtellephone.Text == BTelephone)
            {
                divBranchRegistrationError.Visible = true;
                spnBranchRegistrationError.InnerText = "No new data to be updated has been added!";
            }

            else
            {
                //SqlCommand cmd_CheckBranchName = new SqlCommand("SELECT * FROM Branchs WHERE BrancName='" + tbBranchName.Text + "'", con);
                //SqlDataAdapter sda_CheckBranchName = new SqlDataAdapter(cmd_CheckBranchName);
                //DataTable dt_CheckBranchName = new DataTable();
                //sda_CheckBranchName.Fill(dt_CheckBranchName);

                //if (dt_CheckBranchName.Rows.Count == 0)
                //{
                    SqlCommand cmd_UpdateBranch = new SqlCommand("UPDATE Branchs SET BrancName='" + tbBranchName.Text + "', BranchPhone='" + tbbranchtellephone.Text + "' WHERE Id='" + BrancId + "'", con);
                    cmd_UpdateBranch.ExecuteNonQuery();

                    SqlCommand cmd_UdatebranchInDeviants = new SqlCommand("UPDATE Deviants SET Branch='" + tbBranchName.Text + "' WHERE Branch='" + BName + "'", con);
                    cmd_UdatebranchInDeviants.ExecuteNonQuery();

                    SqlCommand cmd_UdatebranchInLocations = new SqlCommand("UPDATE Locations SET BranchName='" + tbBranchName.Text + "' WHERE BranchName='" + BName + "'", con);
                    cmd_UdatebranchInLocations.ExecuteNonQuery();

                    SqlCommand cmd_UdatebranchInRecords = new SqlCommand("UPDATE Records SET Branch_Name='" + tbBranchName.Text + "' WHERE Branch_Name='" + BName + "'", con);
                    cmd_UdatebranchInRecords.ExecuteNonQuery();

                    SqlCommand cmd_UdatebranchInSchedule = new SqlCommand("UPDATE Records SET Branch_Name='" + tbBranchName.Text + "' WHERE Branch_Name='" + BName + "'", con);
                    cmd_UdatebranchInSchedule.ExecuteNonQuery();

                    SqlCommand cmd_UdatebranchOfTraffics = new SqlCommand("UPDATE Traffics SET Branch='" + tbBranchName.Text + "' WHERE Branch='" + BName + "'", con);
                    cmd_UdatebranchOfTraffics.ExecuteNonQuery();

                    divBranchRegistrationSuccess.Visible = true;
                    spnBranchRegistrationSuccess.InnerText = "Branch data updated at all neccessary areas!";
                //}
                //else
                //{
                //    divBranchRegistrationError.Visible = true;
                //    spnBranchRegistrationError.InnerText = "There is a branch with this name, Try it again!";
                //}
            }
            con.Close();
        }
    }
}