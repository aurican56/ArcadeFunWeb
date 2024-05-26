using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminName"] != null) lbl_hello.Text = Session["adminName"].ToString() + " שלום מנהל";
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("/User/Home.aspx");
    }

    protected void btn_Details_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserDetails.aspx");
    }


    protected void btn_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminLogin.aspx");
    }

    protected void btn_City_Click(object sender, EventArgs e)
    {
        Response.Redirect("UsersByCity.aspx");
    }

    protected void btn_Gen_Click(object sender, EventArgs e)
    {
        Response.Redirect("UsersByGender.aspx");
    }

    protected void btn_Upd_Click(object sender, EventArgs e)
    {
        Response.Redirect("PriceUpd.aspx");
    }
    protected void btn_New_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewGame.aspx");
    }

    protected void btn_rat_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserRating.aspx");
    }

}