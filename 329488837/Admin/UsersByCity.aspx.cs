using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UsersByCity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["adminName"] == null) Response.Redirect("loginAdmin.aspx");
        Label4.Visible = false;
        grddetails.Visible = false;
    }

    //פרטי משתמש על פי לפי הפעולה ממחלקת משתמשים
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        users ucity = new users();
        ucity.CityName = ddlCity.SelectedItem.ToString();
        if (ucity.UserByCity().Tables[0].Rows.Count > 0)
        {
            grddetails.DataSource = ucity.UserByCity().Tables[0];
            grddetails.DataBind();
            Label4.Text = " מספר המשתמשים ב" + ucity.CityName.ToString() + " : " + grddetails.Rows.Count;
            Label4.Visible = true;
            grddetails.Visible = true;
        }
        else
        {
            Label4.Text = "אין לקוחות ב" + ucity.CityName;
            Label4.Visible = true;
        }
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminMenu.aspx");
    }
}