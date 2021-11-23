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

public partial class TTCRTrafficArea_TrafficPlacment : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {

            divAttendance.Visible = false;
            checkAttendance();
            ddlLocationName.Enabled = false;
            getLocationsList();
            getPlacment();
        }
        else
        {
            Response.Redirect("../Loginpage.aspx");
        }

    }

    private void checkAttendance()
    {
        try
        {

            string loggeduser = Session["USERNAME"] as string;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd_getPlacement = new SqlCommand("SELECT Branch_Name, Loct_Name, Shift, Attendance FROM Schedule WHERE Traffic_Phone='" + loggeduser + "'", con);
                SqlDataAdapter sda_getPlacement = new SqlDataAdapter(cmd_getPlacement);
                DataTable dt_getPlacement = new DataTable();
                sda_getPlacement.Fill(dt_getPlacement);

                if (dt_getPlacement.Rows[0][3].ToString() == "YES")
                {
                    lbtnTrafficAttending.Visible = false;
                    Attendance.Visible = false;
                    divAttendance.Visible = true;
                    spnAttendanceSuccess.InnerText = "You Attended!";
                }
                else
                {
                }
            }
        }
        catch
        {

        }
    }

    private void getPlacment()
    {
        string loggeduser = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getPlacement = new SqlCommand("SELECT Branch_Name, Loct_Name, Shift, Attendance FROM Schedule WHERE Traffic_Phone='"+loggeduser+"'", con);
            SqlDataAdapter sda_getPlacement = new SqlDataAdapter(cmd_getPlacement);
            DataTable dt_getPlacement = new DataTable();
            sda_getPlacement.Fill(dt_getPlacement);

            if (dt_getPlacement.Rows[0][2].ToString() != "NULL")
            {
               
                if (dt_getPlacement.Rows[0][2].ToString() == "A")
                {
                    spnFromTo.InnerText = "12:00 AM To 7:00 PM LT";
                    spnDescrtimeInterval.InnerText = "12:00 AM To 7:00 PM LT";
                }
                if (dt_getPlacement.Rows[0][2].ToString() == "B")
                {
                    spnFromTo.InnerText = "7:00 PM To 3:00 PM LT";
                    spnDescrtimeInterval.InnerText = "7:00 PM To 3:00 PM LT";
                }

                spnKifleketema.InnerText = dt_getPlacement.Rows[0][0].ToString();
                spnShift.InnerText = dt_getPlacement.Rows[0][2].ToString();
                spnDescrLocation.InnerText = dt_getPlacement.Rows[0][1].ToString();
                if (dt_getPlacement.Rows[0][1].ToString() != null)
                {
                    ddlLocationName.Text = dt_getPlacement.Rows[0][1].ToString();
                }

                else
                {

                }
                //lbtnTrafficAttending.Visible = true;
                //Attendance.Visible = true;

            }

            else
            {
                spnKifleketema.InnerText = dt_getPlacement.Rows[0][0].ToString();
                spnShift.InnerText = "Not palced for today!";
                lbtnTrafficAttending.Visible = false;
                Attendance.Visible = false;
            }
           
        }
    }

    private string getUserBranch()
    {
        string loggeduser = Session["USERNAME"] as string;

        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getUserBranch = new SqlCommand("SELECT Branch FROM Traffics WHERE Phone_No = '"+loggeduser+"'", con);
            SqlDataAdapter sda_getUserBranch = new SqlDataAdapter(cmd_getUserBranch);
            DataTable dt_getUserBranch = new DataTable();
            sda_getUserBranch.Fill(dt_getUserBranch);

            string branch = dt_getUserBranch.Rows[0][0].ToString();
            con.Close();
            return branch;
        }
        }

    private void getLocationsList()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            string branch = getUserBranch();
            con.Open();
            SqlCommand cmd_getLocations = new SqlCommand("SELECT Loct_Name FROM Locations WHERE BranchName ='"+ branch + "'ORDER BY Loct_Name ASC", con);
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

    protected void lbtnTrafficAttending_Click(object sender, EventArgs e)
    {
        if (cbTrafficAttendance.Checked)
        {
            string loggeduser = Session["USERNAME"] as string;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd_Attending = new SqlCommand("UPDATE Schedule SET Attendance = 'YES' WHERE Traffic_Phone ='"+ loggeduser + "'", con);
                cmd_Attending.ExecuteNonQuery();
                con.Close();
                lbtnTrafficAttending.Visible = false;
                Attendance.Visible = false;

                divAttendance.Visible = true;
                spnAttendanceSuccess.InnerText = "You Succesfully Attend!";
            }
        }

        else
        {
            divAttendance.Visible = true;
            spnAttendanceSuccess.InnerText = "Pleasse Check the palcment agreement box!";
            cbTrafficAttendance.Focus();
        }
    }
}