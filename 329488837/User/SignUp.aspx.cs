using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_SignUp : System.Web.UI.Page
{
    ServiceReference1.ServiceSoapClient ser = new ServiceReference1.ServiceSoapClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("LogIn.aspx");
    }
    ///הכנסת נתונים באמצעות מחלקת משתמש לטבלת הנתונים במידה והם תקינים ושימוש בפעולות אם משתמש קיים והוספת משתמש חדש
    protected void btn_Reg_Click(object sender, EventArgs e)
    {
        if (!NoEmpty(txtfname.Parent))
        {
            lblSucc.Text = "אחד או יותר מהפרטים שגויים";
            lblSucc.Visible = true;
            return;
        }
        users user = new users(txtfname.Text, txtlname.Text, txtAdress.Text, ddlCity.SelectedValue, rblGender.SelectedValue, ddlPr.SelectedValue + txtPhone.Text, txtmail.Text, txtUser.Text, txtPass.Text);
        //אם שם משתמש קיים
        if (user.ifExist()) lblfail.Visible = true;
        else
        {
            //הוספת המשתמש החדש
            user.addUser();
            btn_login.Visible = true;
            lblSucc.Text = "הרישום נקלט בהצלחה במערכת";
            lblSucc.Visible = true;
            ser.InsertPoints(txtUser.Text, 0);
        }
    }
    private bool NoEmpty(Control c)
    {

        foreach( TextBox tx in c.Controls.OfType<TextBox>())
        {
            if (tx.Text == "") return false;
        }
        return true;
    }
}
    
