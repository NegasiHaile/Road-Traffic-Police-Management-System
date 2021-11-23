using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Drawing;

public partial class TTCRBranchAdmin_GenerateSchedule : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            displaySchedule();
        }
       
        else
        {
            Response.Redirect("~/LoginPage.aspx");
        }
    }

    protected string getIdentifier()
    {
        string loggedUsername = Session["USERNAME"] as string;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_getbranch = new SqlCommand("SELECT Branch From Traffics WHERE Phone_No ='"+ loggedUsername + "'", con);
            SqlDataAdapter sda_getbranch = new SqlDataAdapter(cmd_getbranch);
            DataTable dt_getbranch = new DataTable();
            sda_getbranch.Fill(dt_getbranch);

            return dt_getbranch.Rows[0][0].ToString();

        }
        }

    protected void lbtnGenerateSchedule_Click(object sender, EventArgs e)
    {
        string branchName = getIdentifier();

        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_Length = new SqlCommand("SELECT Loct_Name, Traffic_Phone, Bridge From Schedule WHERE Branch_Name ='"+ branchName + "'", con);
            SqlDataAdapter sda_Length = new SqlDataAdapter(cmd_Length);
            DataTable dt_Length = new DataTable();
            sda_Length.Fill(dt_Length);

            int length = dt_Length.Rows.Count;
            

            //spnLength.InnerText = dt_Length.Rows[2][1].ToString();


            for (int i = 0; i < length; i++)
            {
                if (i < length - 1)
                {
                    string key = dt_Length.Rows[i][1].ToString();
                    string value = dt_Length.Rows[i+1][1].ToString();

            
                    SqlCommand cmd_UpdateSchedule1 = new SqlCommand("UPDATE Schedule SET Bridge ='" + key + "' WHERE Traffic_Phone ='" + value + "' AND Branch_Name ='" + branchName + "'", con);

                    cmd_UpdateSchedule1.ExecuteNonQuery();

                    SqlCommand cmd_bridge = new SqlCommand("SELECT Loct_Name, Traffic_Phone, Bridge From Schedule WHERE Branch_Name ='" + branchName + "'", con);
                    SqlDataAdapter sda_bridge = new SqlDataAdapter(cmd_bridge);
                    DataTable dt_bridge = new DataTable();
                    sda_bridge.Fill(dt_bridge);

                    string bridge = dt_bridge.Rows[i+1][2].ToString();
                    //spnLength.InnerText = bridge;

                    SqlCommand cmd_UpdateSchedule2 = new SqlCommand("UPDATE Schedule SET Traffic_Phone ='" + value + "' WHERE Traffic_Phone ='" + key + "'AND Branch_Name ='" + branchName + "'", con);

                    cmd_UpdateSchedule2.ExecuteNonQuery();

                    SqlCommand cmd_UpdateSchedule3 = new SqlCommand("UPDATE Schedule SET Traffic_Phone ='" + bridge + "' WHERE Bridge ='" + bridge + "'AND Branch_Name ='" + branchName + "'", con);
                    cmd_UpdateSchedule3.ExecuteNonQuery();
                    
                }

                SqlCommand cmd_Shift = new SqlCommand("SELECT Traffic_Phone From Schedule WHERE Branch_Name ='" + branchName + "'", con);
                SqlDataAdapter sda_Shift = new SqlDataAdapter(cmd_Shift);
                DataTable dt_Shift = new DataTable();
                sda_Shift.Fill(dt_Shift);

                int shiftLength = dt_Shift.Rows.Count;
                int half = shiftLength / 2;

                for (int j = 0; j < shiftLength; j++)
                {
                   
                        string key1 = dt_Shift.Rows[j][0].ToString();

                        if (j < half)
                        {
                            SqlCommand cmd_UpdateShiftA = new SqlCommand("UPDATE Schedule SET Shift = 'A' WHERE Traffic_Phone ='" + key1 + "'AND Branch_Name ='" + branchName + "'", con);
                            cmd_UpdateShiftA.ExecuteNonQuery();
                        }

                        else
                        {
                            SqlCommand cmd_UpdateShiftB = new SqlCommand("UPDATE Schedule SET Shift = 'B' WHERE Traffic_Phone ='" + key1 + "'AND Branch_Name ='" + branchName + "'", con);
                            cmd_UpdateShiftB.ExecuteNonQuery();
                        }
                }
            }
            SqlCommand cmd_UpdateSchedule4 = new SqlCommand("UPDATE Schedule SET Bridge =NULL WHERE Branch_Name ='" + branchName + "'", con);
            cmd_UpdateSchedule4.ExecuteNonQuery();


            SqlCommand cmd_UpdateSAttendance = new SqlCommand("UPDATE Schedule SET Attendance = 'NO'", con);

            cmd_UpdateSAttendance.ExecuteNonQuery();
            con.Close();
        }
        displaySchedule();

    }

    protected void displaySchedule()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            

            con.Open();

            string branchName = getIdentifier();
            spnScheduletitleBranchName.InnerText = branchName;
            spnDate.InnerText = DateTime.UtcNow.ToString();

            //SqlCommand cmd_Number_of_AttendedA = new SqlCommand("SELECT COUNT(Attendance) FROM Schedule WHERE Attendance='YES' AND Branch_Name ='" + branchName + "' AND Shift ='A'", con);
            //int AttendedShifA = cmd_Number_of_AttendedA.ExecuteNonQuery();
            //spnAttendedShifA.InnerText = cmd_Number_of_AttendedA.ExecuteNonQuery().ToString();

            //SqlCommand cmd_Number_of_MissedA = new SqlCommand("SELECT COUNT(Attendance) FROM Schedule WHERE Attendance='NOoj' AND Branch_Name ='" + branchName + "' AND Shift ='A'", con);
            //int MissedShifA = cmd_Number_of_MissedA.ExecuteNonQuery();
            //spnMissedShiftA.InnerText = MissedShifA.ToString();

            SqlCommand cmd_Number_of_AttendedA = new SqlCommand("SELECT * FROM Schedule WHERE Attendance='YES' AND Branch_Name ='" + branchName + "' AND Shift ='A'", con);
            SqlDataAdapter sda_Number_of_AttendedA = new SqlDataAdapter(cmd_Number_of_AttendedA);
            DataTable dt_Number_of_AttendedA = new DataTable();
            sda_Number_of_AttendedA.Fill(dt_Number_of_AttendedA);
            spnAttendedShifA.InnerText = dt_Number_of_AttendedA.Rows.Count.ToString();

            SqlCommand cmd_Number_of_MissedA = new SqlCommand("SELECT * FROM Schedule WHERE Attendance='NO' AND Branch_Name ='" + branchName + "' AND Shift ='A'", con);
            SqlDataAdapter sda_Number_of_MissedA = new SqlDataAdapter(cmd_Number_of_MissedA);
            DataTable dt_Number_of_MissedA = new DataTable();
            sda_Number_of_MissedA.Fill(dt_Number_of_MissedA);
            spnMissedShiftA.InnerText = dt_Number_of_MissedA.Rows.Count.ToString();




            SqlCommand cmd_GetNewSchedule = new SqlCommand("SELECT Schedule.Id, Schedule.Loct_Name, Schedule.Traffic_Phone, Schedule.Shift, Schedule.Attendance, Traffics.FName, Traffics.MName, Traffics.Proff_Name From Schedule INNER JOIN Traffics ON Schedule.Traffic_Phone = Traffics.Phone_No WHERE Schedule.Branch_Name ='" + branchName + "' ORDER BY Schedule.Shift ASC", con);
            SqlDataAdapter sda_GetNewSchedule = new SqlDataAdapter(cmd_GetNewSchedule);
            DataTable dt_GetNewSchedule = new DataTable();
            sda_GetNewSchedule.Fill(dt_GetNewSchedule);

            rptrNewSchedule.DataSource = dt_GetNewSchedule;
            rptrNewSchedule.DataBind();

            con.Close();

            //spnLength.InnerText = "Done";
        }
        }

    protected void lbtnRefreshScheduleTable_Click(object sender, EventArgs e)
    {
        try
        {
            string AdninBranch_name = getIdentifier();
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd_DeleteScheduleData = new SqlCommand("SELECT Branch_Name, Traffic_Phone FROM Schedule WHERE Branch_Name='" + AdninBranch_name + "'", con);
                SqlDataAdapter sda_DeleteScheduleData = new SqlDataAdapter(cmd_DeleteScheduleData);
                DataTable dt_DeleteScheduleData = new DataTable();
                sda_DeleteScheduleData.Fill(dt_DeleteScheduleData);

                int length = dt_DeleteScheduleData.Rows.Count;

                for (int i = 0; i < length; i++)
                {
                    string Branch_Name = dt_DeleteScheduleData.Rows[i][0].ToString();
                    string Traffic_Phone = dt_DeleteScheduleData.Rows[i][1].ToString();

                    SqlCommand cmd_DeleteRow = new SqlCommand("DELETE FROM Schedule WHERE Traffic_Phone='" + Traffic_Phone + "'", con);
                    cmd_DeleteRow.ExecuteNonQuery();

                }

                //SqlCommand cmd_FetchScheduleData = new SqlCommand("SELECT Traffics.Phone_No, Locations.BranchName, Locations.Loct_Name FROM Traffics INNER JOIN Locations ON Traffics.Branch = Locations.BranchName", con);
                SqlCommand cmd_FetchScheduleData = new SqlCommand("SELECT BranchName, Loct_Name FROM Locations WHERE BranchName ='" + AdninBranch_name + "'", con);
                SqlDataAdapter sda_FetchScheduleData = new SqlDataAdapter(cmd_FetchScheduleData);
                DataTable dt_FetchScheduleData = new DataTable();
                sda_FetchScheduleData.Fill(dt_FetchScheduleData);
                int locationLength = dt_FetchScheduleData.Rows.Count;

                SqlCommand cmd_getPhone = new SqlCommand("SELECT Phone_No, Responsibility FROM Traffics WHERE Branch ='" + AdninBranch_name + "' AND Responsibility ='Out Office'", con);
                SqlDataAdapter sda_getPhone = new SqlDataAdapter(cmd_getPhone);
                DataTable dt_getPhone = new DataTable();
                sda_getPhone.Fill(dt_getPhone);
                int length1 = dt_getPhone.Rows.Count;

                string value = "";
                int j = 0;
                for (int i = 0; i < length1; i++)
                {

                    // value = value + dt_FetchScheduleData.Rows[i][1].ToString();


                    if (i == length1 / 2)
                    {
                        j = 0;
                    }

                    string Branch_Name = dt_FetchScheduleData.Rows[j][0].ToString();
                    string Loct_name = dt_FetchScheduleData.Rows[j][1].ToString();
                    string Traffic_Phone = dt_getPhone.Rows[i][0].ToString();
                    string Responsibility = dt_getPhone.Rows[i][1].ToString();
                    if (Responsibility == "Out Office")
                    {
                        SqlCommand cmd_InsertToSchedule = new SqlCommand("InserToSchedule", con);
                        cmd_InsertToSchedule.CommandType = CommandType.StoredProcedure;

                        SqlParameter SqlPRT_Branch_name = new SqlParameter()
                        {
                            ParameterName = "@Branch_Name",
                            Value = Branch_Name
                        };
                        cmd_InsertToSchedule.Parameters.Add(SqlPRT_Branch_name);

                        SqlParameter SqlPRT_Loct_name = new SqlParameter()
                        {
                            ParameterName = "@Loct_Name",
                            Value = Loct_name
                        };
                        cmd_InsertToSchedule.Parameters.Add(SqlPRT_Loct_name);

                        SqlParameter SqlPRT_Traffic_Phone = new SqlParameter()
                        {
                            ParameterName = "@Traffic_Phone",
                            Value = Traffic_Phone
                        };
                        cmd_InsertToSchedule.Parameters.Add(SqlPRT_Traffic_Phone);


                        SqlParameter SqlPRT_Bridge = new SqlParameter()
                        {
                            ParameterName = "@Bridge",
                            Value = "NULL"
                        };
                        cmd_InsertToSchedule.Parameters.Add(SqlPRT_Bridge);

                        SqlParameter SqlPRT_Shift = new SqlParameter()
                        {
                            ParameterName = "@Shift",
                            Value = "NULL"
                        };
                        cmd_InsertToSchedule.Parameters.Add(SqlPRT_Shift);

                        SqlParameter SqlPRT_Schedule_Date = new SqlParameter()
                        {
                            ParameterName = "@Date",
                            Value = DateTime.Now
                        };
                        cmd_InsertToSchedule.Parameters.Add(SqlPRT_Schedule_Date);

                        SqlParameter SqlPRT_Attendance = new SqlParameter()
                        {
                            ParameterName = "@Attendance",
                            Value = "NO"
                        };
                        cmd_InsertToSchedule.Parameters.Add(SqlPRT_Attendance);

                        SqlParameter SqlPRT_Id = new SqlParameter()
                        {
                            ParameterName = "@Id",
                            Value = -1,
                            Direction = ParameterDirection.Output
                        };
                        cmd_InsertToSchedule.Parameters.Add(SqlPRT_Id);


                        cmd_InsertToSchedule.ExecuteNonQuery();

                        j++;
                    }
                }

                con.Close();
            }
            displaySchedule();
        }
        catch
        {

        }
        
    }
}