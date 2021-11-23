using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class TTCRSuperAdmin_BranchDetail : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    public int AdmiinAssigned;
    public int CrimeIdentfirAssigned;
    public int BranchTechinicalAssigned;
    public int EnoughOutOffice;
    //public int No_Of_Locations;

    protected void Page_Load(object sender, EventArgs e)
    {
       
       if(Session["USERNAME"] != null)
        {
            
            //Response.Write("<script langudge: javascript>document.getElementById('spnBranchAdminAssigned').innerHTML=' <img src='../ assets / icons / delete.png' /> ';</script>");
            Branchname.InnerText = Request.QueryString["BrancName"] as string;

            checkBranchEmployees();
            EmployeesPerBrach();
            getListOLocations();
            getRecordsInBranch();
        }
        else
        {
            Response.Redirect("../Loginpage.aspx");
        }
    }

    private void EmployeesPerBrach()
    {
        string BranchName = Request.QueryString["BrancName"];
        //int Locations;
        //int OutOffice;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getEmployeePerBranch = new SqlCommand("SELECT * FROM Traffics WHERE Branch='" + BranchName + "'", con);
            SqlDataAdapter sda_getEmployeePerBranch = new SqlDataAdapter(cmd_getEmployeePerBranch);
            DataTable dt_getEmployeePerBranch = new DataTable();
            sda_getEmployeePerBranch.Fill(dt_getEmployeePerBranch);
            //int AdAssigned = dt_getLocations.Rows.Count;
            // tbtry.Text = AdAssigned.ToString();
            rptrEmployessperBranch.DataSource = dt_getEmployeePerBranch;
            rptrEmployessperBranch.DataBind();
        }
        }

    public void checkBranchEmployees()
    {
        string BranchName = Request.QueryString["BrancName"];
        using (SqlConnection con = new SqlConnection(CS))
        {
            
            SqlCommand cmd_checkBranchAdmin = new SqlCommand("SELECT * FROM Traffics WHERE Branch ='" + BranchName + "' AND Responsibility = 'Branch Officer' ", con);
            SqlDataAdapter sda_checkBranchAdmin = new SqlDataAdapter(cmd_checkBranchAdmin);
            DataTable dt_checkBranchAdmin = new DataTable();
            sda_checkBranchAdmin.Fill(dt_checkBranchAdmin);

             AdmiinAssigned = dt_checkBranchAdmin.Rows.Count;
           // Response.Write("<script langudge= javascript>document.getElementById('spnBranchAdminAssigned').innerHTML = ' < img width = '15' src = '../assets/icons/error.png' /> ';</script>");

            SqlCommand cmd_checkBranchCrimeIdentifier = new SqlCommand("SELECT * FROM Traffics WHERE Branch ='" + BranchName + "' AND Responsibility = 'Crime Identifier' ", con);
            SqlDataAdapter sda_checkBranchCrimeIdentifier = new SqlDataAdapter(cmd_checkBranchCrimeIdentifier);
            DataTable dt_checkBranchCrimeIdentifier = new DataTable();
            sda_checkBranchCrimeIdentifier.Fill(dt_checkBranchCrimeIdentifier);

            CrimeIdentfirAssigned = dt_checkBranchCrimeIdentifier.Rows.Count;

            SqlCommand cmd_checkBranchTechinicalAssigned = new SqlCommand("SELECT * FROM Traffics WHERE Branch ='" + BranchName + "' AND Responsibility = 'Techinical' ", con);          
            SqlDataAdapter sda_checkBranchTechinicalAssigned = new SqlDataAdapter(cmd_checkBranchTechinicalAssigned);
            DataTable dt_checkBranchTechinicalAssigned = new DataTable();
            sda_checkBranchTechinicalAssigned.Fill(dt_checkBranchTechinicalAssigned);

            BranchTechinicalAssigned = dt_checkBranchTechinicalAssigned.Rows.Count;

            //SqlCommand cmd_checkTotalOutOfficeInBranch = new SqlCommand("SELECT * FROM Traffics WHERE Branch ='" + BranchName + "' AND Responsibility = 'Out Office' ", con);
            //SqlDataAdapter sda_checkTotalOutOfficeInBranch = new SqlDataAdapter(cmd_checkTotalOutOfficeInBranch);
            //DataTable dt_checkTotalOutOfficeInBranch = new DataTable();
            //sda_checkTotalOutOfficeInBranch.Fill(dt_checkTotalOutOfficeInBranch);

            //OutOffice = dt_checkTotalOutOfficeInBranch.Rows.Count;
        }
        }
    private void getListOLocations()
    {
        string BranchName = Request.QueryString["BrancName"];
        int Locations;
        int OutOffice;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getLocations = new SqlCommand("SELECT * FROM Locations WHERE BranchName='"+ BranchName + "'", con);
            SqlDataAdapter sda_getLocations = new SqlDataAdapter(cmd_getLocations);
            DataTable dt_getLocations = new DataTable();
            sda_getLocations.Fill(dt_getLocations);
            //int AdAssigned = dt_getLocations.Rows.Count;
           // tbtry.Text = AdAssigned.ToString();
            rptrAllLocationsInBranch.DataSource = dt_getLocations;
            rptrAllLocationsInBranch.DataBind();

            SqlCommand cmd_checkTotalOutOfficeInBranch = new SqlCommand("SELECT * FROM Traffics WHERE Branch ='" + BranchName + "' AND Responsibility = 'Out Office' ", con);
            SqlDataAdapter sda_checkTotalOutOfficeInBranch = new SqlDataAdapter(cmd_checkTotalOutOfficeInBranch);
            DataTable dt_checkTotalOutOfficeInBranch = new DataTable();
            sda_checkTotalOutOfficeInBranch.Fill(dt_checkTotalOutOfficeInBranch);

            OutOffice = dt_checkTotalOutOfficeInBranch.Rows.Count;
            Locations = dt_getLocations.Rows.Count;

            if(Locations  <= (OutOffice / 2))
            {
                EnoughOutOffice = 1;
                //Response.Write("<script langudge= javascript>document.getElementById('spnBranchEnoughEmployeeAssigned').innerHTML = ' < img width = '15' src = '../assets/icons/error.png' /> ';</script>");
            }

            else
            {
                EnoughOutOffice = 0;
            }

            spnTotalNoLocations.InnerText = Locations.ToString();
            spnOutOffice.InnerText = OutOffice.ToString();
        }
    }
    private void getRecordsInBranch()
    {
        string BranchName = Request.QueryString["BrancName"];
        using(SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd_recordsInBranch = new SqlCommand("SELECT * FROM Records WHERE Branch_Name ='"+ BranchName + "'", con);
            SqlDataAdapter sda_recordsInBranch = new SqlDataAdapter(cmd_recordsInBranch);
            DataTable dt_recordsInBranch = new DataTable();
            sda_recordsInBranch.Fill(dt_recordsInBranch);
            

            rptrAllRecordsInBranch.DataSource = dt_recordsInBranch;
            rptrAllRecordsInBranch.DataBind();

            int length = dt_recordsInBranch.Rows.Count;
            spntotalrecordsTillnow.InnerText = length.ToString();

            double totalIncomeTillnow = 0.0;
            double totalRecievedIncomeTillnow = 0.0;
            for (int i = 0; i< length; i++)
            {
                if(dt_recordsInBranch.Rows[i][13].ToString() == "Paid")
                {
                    totalIncomeTillnow += double.Parse(dt_recordsInBranch.Rows[i][9].ToString());
                    totalRecievedIncomeTillnow += double.Parse(dt_recordsInBranch.Rows[i][9].ToString());
                }
                else
                {
                    totalIncomeTillnow += double.Parse(dt_recordsInBranch.Rows[i][9].ToString());
                }
                
            }
            
            spntotalIncomeTillnow.InnerText = totalIncomeTillnow.ToString();
            spntotalRecievedIncomeTillnow.InnerText = totalRecievedIncomeTillnow.ToString();
            spntotalNonRecievedIncomeTillnow.InnerText = (totalIncomeTillnow - totalRecievedIncomeTillnow).ToString();
            con.Close();
        }
    }
}