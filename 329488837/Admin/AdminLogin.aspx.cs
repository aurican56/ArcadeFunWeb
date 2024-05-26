using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("/User/Home.aspx");
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        admin loginAd = new admin(txt_AdminUsername.Text, txt_Adminpass.Text);
        if (loginAd.loginadmin())
        {
            Session["adminName"] = txt_AdminUsername.Text;
            Session["userName"] = txt_AdminUsername.Text;
            Response.Redirect("AdminMenu.aspx");
        }
        else lbl_err.Visible = true;
    }
}