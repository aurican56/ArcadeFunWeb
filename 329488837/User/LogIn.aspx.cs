using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_LogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        if (!NoEmpty(txt_uname.Parent))
        {
            lblSucc.Text = "אחד או יותר מהפרטים שגויים";
            lblSucc.Visible = true;
            return;
        }
        users loginUs = new users();
        loginUs.User_Name = txt_uname.Text;
        loginUs.Pass = txt_pass.Text;
        if (loginUs.loginuser())
        {

            Session["userName"] = txt_uname.Text;
            Response.Redirect("Home.aspx");
        }
        else
        {
            lblSucc.Text = "משתמש עם פרטים אלו לא קיים";
            lblSucc.Visible = true;
        }
    }

    private bool NoEmpty(Control c)
    {

        foreach (TextBox tx in c.Controls.OfType<TextBox>())
        {
            if (tx.Text == "") return false;
        }
        return true;
    }

    protected void btn_signup_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUp.aspx");
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}