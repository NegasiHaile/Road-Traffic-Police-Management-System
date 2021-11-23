using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class TTCRSuperAdmin_ListOfTaxis : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        getAllTaxis();
    }

    public void getAllTaxis()
    {
        using(SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getAllTaxis = new SqlCommand("SELECT Owners.Phone_No, Owners.FName, Owners.MName, Owners.Gender, Taxis.Id, Taxis.Plate, Taxis.Driver_Phone, Taxis.taxi_Status FROM Owners INNER JOIN Taxis ON Owners.Phone_No = Taxis.Owner_Phone", con);
            SqlDataAdapter sda_getAllTaxis = new SqlDataAdapter(cmd_getAllTaxis);
            DataTable dt_getAllTaxis = new DataTable();
            sda_getAllTaxis.Fill(dt_getAllTaxis);

            rptrAllTaxis.DataSource = dt_getAllTaxis;
            rptrAllTaxis.DataBind();
        }
    }
}

// using (SqlCommand cmd = new SqlCommand("select Distributor.Dstr_id, Distributor.FName, Distributor.MName, Distributor.Email, ProductOrder.Dstr_IDN, 
//ProductOrder.Id, ProductOrder.Total_Prdcts, ProductOrder.Total_Price, ProductOrder.Order_date From Distributor INNER JOIN ProductOrder ON Distributor.Email= 
//ProductOrder.Dstr_IDN where ProductOrder.Order_Status='" + Order_Status + "'", con))