using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTCRBranchAdmin_BranchAdmin : System.Web.UI.MasterPage
{
    public string BranchAdminPhoneNo;
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Session["USERNAME"] != null)
        {
            BranchAdminPhoneNo = Session["USERNAME"].ToString();

        }

        else
        {
            Response.Redirect("~/LoginPage.aspx");
        }
    }

    protected void lbtnLout_Click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        Response.Redirect("~/LoginPage.aspx");
    }
}
