using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UsersByGender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
    {
        users ugen = new users();
        ugen.Gender = ddlGen.SelectedItem.ToString();
        if (ugen.UserByGender().Tables[0].Rows.Count > 0)
        {
            grddetails.DataSource = ugen.UserByGender().Tables[0];
            grddetails.DataBind();
            Label4.Text = " מספר המשתמשים ממין " + ugen.Gender.ToString() + " : " + grddetails.Rows.Count;
            Label4.Visible = true;
            grddetails.Visible = true;
        }
        else
        {
            Label4.Text = "אין לקוחות ממין זה";
            Label4.Visible = true;
        }
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminMenu.aspx");
    }
}