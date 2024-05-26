using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_Receipt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null) Response.Redirect("LogIn.aspx");
        if (Session["orderId"] == null) Response.Redirect("Cart.aspx");
        Disposition(Session["orderId"].ToString());
    }
    public void Disposition(string x)
    {
        int sum = 0;
        DataSet sub = new orders(x).SubOrderTable(), us = new users(Session["userName"].ToString()).UserByUserName();
        lbl_credit.Text = "הזמנה על שם " + us.Tables[0].Rows[0][0].ToString() + " " + us.Tables[0].Rows[0][1].ToString();
        lbl_Norder.Text = "מספר הזמנה " + x;
        lbl_Amount.Text = "מספר משחקים: " + sub.Tables[0].Rows.Count;
        grd_books.DataSource = sub;
        grd_books.DataBind();
        for (int i = 0; i < grd_books.Rows.Count; i++) sum += int.Parse(grd_books.Rows[i].Cells[3].Text);
        lbl_Sum.Text = "סה\"כ: " + sum + " ש\"ח";
    }
}