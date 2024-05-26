using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Comments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtdate.Text = DateTime.Now.ToString();
        if (Session["userName"] != null)
        {
            users us = new users(Session["userName"].ToString());
            txtmail.Text = us.UserByUserName().Tables[0].Rows[0][6].ToString();
        }
        else Response.Redirect("LogIn.aspx");
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        if (txtcomment.Text != "" && txtmail.Text != "" && ddlType.Text != "לבחור")
        {
            comment com = new comment(txtmail.Text, txtdate.Text, ddlType.SelectedValue, txtcomment.Text);
            com.AddComment();
            lbl_fin.Visible = true;
            txtcomment.Text = "";
            ddlType.SelectedIndex = 0;
        }
    }
}