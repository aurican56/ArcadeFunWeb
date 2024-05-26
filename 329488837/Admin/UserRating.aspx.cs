using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserRating : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminName"] == null) Response.Redirect("AdminLogin.aspx");
        ShowGridView();
    }
    public void ShowGridView()
    {
        Rating rt = new Rating();
        grdrating.DataSource = rt.allRating().Tables[0];
        grdrating.DataBind();
        lbl_average.Text = "ממוצע הדירוגים הוא: " + rt.RatingAverage().Tables[0].Rows[0][0].ToString();
        lbl_average.Visible = true;
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminMenu.aspx");
    }
}