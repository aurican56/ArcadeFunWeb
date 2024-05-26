using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null) Response.Write("<script language=javascript>sessionStorage.setItem('UserName', '" + Session["userName"].ToString() +"');</script>");
    }

    protected void btn_admin_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Admin/AdminLogin.aspx");
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("LogIn.aspx");
    }

    protected void btn_reg_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUp.aspx");
    }

    protected void btn_com_Click(object sender, EventArgs e)
    {
        Response.Redirect("Comments.aspx");
    }
    protected void btn_game_Click(object sender, EventArgs e)
    {
        Session["gameName"] = "flappybird";
        Response.Redirect("/Flappy.aspx");
        
    }

    protected void btn_test_Click(object sender, EventArgs e)
    {
    }

    protected void btn_Upd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Update.aspx");
    }

    protected void btn_PanelCat_Click(object sender, EventArgs e)
    {
        Response.Redirect("GameTypes.aspx");
    }

    protected void btn_DCat_Click(object sender, EventArgs e)
    {
        Response.Redirect("DifCatalog.aspx");
    }

    protected void btn_Cart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }

    protected void btn_rate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Rating.aspx");
    }
}