using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class TTCRSuperAdmin_ListOfBranchs : System.Web.UI.Page
{

    string CS = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(Session["USERNAME"] != null){
                getListOfBRANCHS();
            }
            else
            {

            }
        }
    }

    private void getListOfBRANCHS()
    {
        using(SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd_getBranchs = new SqlCommand("SELECT * FROM Branchs ORDER BY BrancName ASC", con);
            SqlDataAdapter sda_getBranchs = new SqlDataAdapter(cmd_getBranchs);
            DataTable dt_getBranchs = new DataTable();
            sda_getBranchs.Fill(dt_getBranchs);

            rptrAllBranchs.DataSource = dt_getBranchs;
            rptrAllBranchs.DataBind();
        }
    }
}