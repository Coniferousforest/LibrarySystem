using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        isUserLogin();
    }
    protected void isUserLogin()
    {
        if (Session["user"] != null)
        {
            User user = Session["user"] as User;
            Panel1.Visible = false;
            Panel2.Visible = true;
            HyperLink1.Text = user.Name;
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session["user"] = null;
        Response.Redirect("index.aspx");
    }
}
