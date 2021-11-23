using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTCRSuperAdmin_SuperAdmin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {


        }

        else
        {
            Response.Redirect("~/LoginPage.aspx");
        }
    }
    protected void lbtnLout_click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        Response.Redirect("~/LoginPage.aspx");
    }

    protected void logout_click(object sender, EventArgs e) {

        Response.Write("<script langudge: javascript>alert('Done @ all!')</script>");
    }

}
