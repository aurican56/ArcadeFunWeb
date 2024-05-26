using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserDetailsByUserName : System.Web.UI.Page
{
    ServiceReference1.ServiceSoapClient ser = new ServiceReference1.ServiceSoapClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminName"] == null) Response.Redirect("AdminLogin.aspx");
        txt_fName.Enabled = false;
        txt_lName.Enabled = false;
        txt_phoneNum.Enabled = false;
        txt_Sex.Enabled = false;
        txt_address.Enabled = false;
    }

    protected void ddlDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        users uUsers = new users(ddl_userdetails.SelectedItem.Text);
        if (uUsers.UserByUserName().Tables[0].Rows.Count > 0)
        {
            grdDetails.DataSource = uUsers.UserByUserName().Tables[0];
            grdDetails.DataBind();
            grdDetails.Visible = true;
            txt_fName.Text = grdDetails.Rows[0].Cells[0].Text;
            txt_lName.Text = grdDetails.Rows[0].Cells[1].Text;
            txt_address.Text = grdDetails.Rows[0].Cells[2].Text + ", " + grdDetails.Rows[0].Cells[3].Text;
            txt_Sex.Text = grdDetails.Rows[0].Cells[4].Text;
            txt_phoneNum.Text = grdDetails.Rows[0].Cells[5].Text;
            txt_Points.Text = ser.PointByUserName(uUsers.User_Name).ToString();
            pnlUser.Visible = true;
            txtNewPoints.Visible = true;
            btnUpd.Visible = true;
            lblChange.Visible = true;
            lbl_Points.Visible = true;
            txt_Points.Visible = true;
            txtNewPoints.Text = "";
        }
    }

    protected void ddl_userdetails_Load(object sender, EventArgs e)
    {
        
        lblNum.Text = "מספר המשתמשים הוא: " + users.GetUsers();
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminMenu.aspx");
    }

    protected void btnUpd_Click(object sender, EventArgs e)
    {
        int a;
        if (txtNewPoints.Text != "" && int.TryParse(txtNewPoints.Text, out a))
        {
            ser.updPoints(ddl_userdetails.SelectedItem.Text, a);
            txt_Points.Text = ser.PointByUserName(ddl_userdetails.SelectedItem.Text).ToString();
            txtNewPoints.Text = "";
        }
    }
}