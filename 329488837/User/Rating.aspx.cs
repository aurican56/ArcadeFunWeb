using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Rating : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)
        {
            Response.Redirect("LogIn.aspx");
        }
        lbl_hello.Text = "שלום " + Session["userName"].ToString();
    }

    protected void btn_rating(object sender, EventArgs e)
    {
        if(Session["userName"] != null)
        {
            Rating rt = new Rating(Session["userName"].ToString(), rbl_rate.SelectedValue.ToString());
            rt.addRating();
            lbl_messange.Visible = true;
        }
        
    }
}