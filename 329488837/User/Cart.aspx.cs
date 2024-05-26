using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Cart : System.Web.UI.Page
{
    private bool Once = true;
    ServiceReference1.ServiceSoapClient ser = new ServiceReference1.ServiceSoapClient();
    Cart cart = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null) Response.Redirect("Home.aspx");
        cart = new Cart(Session["userName"].ToString());
        pnlCredit.Visible = false;
        lblPost.Visible = false;
        if (Once)
        {
            Method();
            Once = false;
        }
    }
    protected void Method()
    {
        txtDate.Text = DateTime.Now.ToString();
        cart.User_Name = Session["userName"].ToString();
        //הצגת פרטי משתמש על פי שם משתמש אליו ישלחו הפריטים לאחר ביצוע התשלום
        grdDetailsUser.DataSource = new users(Session["userName"].ToString()).UserByUserName();
        grdDetailsUser.DataBind();
        //הצגת הפרטים בסל הלקוח לפי שם משתמשו
        grdDetailsCart.DataSource = cart.getCart();
        grdDetailsCart.DataBind();
        Calc();
    }
    protected void Calc()
    {
        int sum = 0;
        if (grdDetailsCart.Rows.Count > 0)
        {
            for (int i = 0; i < grdDetailsCart.Rows.Count; i++)
            {
                sum += int.Parse(grdDetailsCart.Rows[i].Cells[grdDetailsCart.Rows[0].Cells.Count - 1].Text);
            }
        }
        txtTotal.Text = sum.ToString();
        txtNum.Text = grdDetailsCart.Rows.Count.ToString();
    }
    protected void btnPnl_Click(object sender, EventArgs e)
    {
        pnlCredit.Visible = true;
    }
    //מחיקה מהטבלה שמציגה את סל הקניות
    protected void grdDetailsCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Cart DelCart = new Cart(Session["userName"].ToString(), grdDetailsCart.Rows[e.RowIndex].Cells[2].Text);
        DelCart.DeleteCartRow();
        Method();
    }
    //לסיום ההזמנה יש שלושה שלבים
    //א. הכנסת תאריך ההזמנה ושם המשתמש המזמין ומיספור אוטומטי של ההזמנה לשמור את אותו המספר בסשן שהוא מספר ההזמנה האחרון של אותו המשתמש
    //ב. נעתיק מטבלת הסל את כל הפריטים שהמשתמש קנה ונשים אותם בטבלת פרטי הההזמנה, שמשמשת אותנו כארכיון
    //ג. נמחק מטבלת הסל את הפריטים שהמשתמש קנה ושהועברו לארכיון
    //***********שלב א******************
    protected void btnPay_Click(object sender, EventArgs e)
    {
        //בדיקת כרטיסי האשראי מול השרת

        if (Session["userName"] == null) Response.Redirect("Home.aspx");
        ServiceReference1.Credit c = new ServiceReference1.Credit();
        c.Id = txtId.Text;
        c.CardNum = txtCardNum.Text;
        c.Company = ddlComp.SelectedItem.Text;
        c.Expr = ddlMonth.SelectedItem.Text + "/" + ddlYear.SelectedItem.Text;
        c.Cvv = txtCVV.Text;
        if(ser.chkCard(c))
        {
            float x;
            try
            {
                x = ser.PointByUserName(Session["userName"].ToString());
            }
            catch (ArgumentException ex)
            {
                ser.InsertPoints(ex.ParamName, 0);
                x = 0;
            }
            if (x > 0)
            {
                lblCover.Visible = true;
                lblPost.Text = (x / 10).ToString();
                lblPoints.Text = Session["userName"].ToString() + " ברשותך " + x + " נקודות, האם ברצונך להשתמש בהן בקניה זו?" + " לאחר שימוש בנקודות, המחיר הכולל יהיה " + (int.Parse(txtTotal.Text) - x / 10) + " במקום " + txtTotal.Text;
                pnlPoints.Visible = true;
            }
            else
            {
                lblPost.Text = "0";
                btnSavePoints_Click(sender, e);
            }
        }
        else
        {
            Response.Write("<script>alert('פרטי כרטיס האשראי לא תואמים');</script>");
            pnlCredit.Visible = true;
            return;
        }
            
        
    }
        
    protected void btnRec_Click(object sender, EventArgs e)
    {
        Session["credit"] = txtCardNum.Text;
        Response.Redirect("Receipt.aspx");
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    /*protected void btnCoupon_Click(object sender, EventArgs e)
    {
        double f = 0;
        if (txtCoupon.Text != "")
        {
            ServiceReference1.coupon cp = new ServiceReference1.coupon();
            cp.MainCoupon = txtCoupon.Text;
            if (ser.chkCoupon(cp))
            {
                string x = ser.GetCoupon(cp);
                cart.UpdatePrice(x);
                
                if(Session["userName"] != null)
                {
                    cart.User_Name = Session["userName"].ToString();
                    grdDetailsCart.DataSource = cart.getCart();
                    grdDetailsCart.DataBind();
                    lblPost.Visible = true;
                    for (int i = 0; i < grdDetailsCart.Rows.Count; i++)
                    {
                        f += double.Parse(grdDetailsCart.Rows[i].Cells[grdDetailsCart.Rows[0].Cells.Count - 1].Text);
                    }
                    txtPC.Text = f.ToString();
                    txtPC.Visible = true;
                    Response.Write("<script>alert('קופן הוזן בהצלחה וזכאי ל " + x + "אחוזי הנחה ');</script>");
                    lblCoupon.Visible = false;
                    txtCoupon.Visible = false;
                    btnCoupon.Visible = false;
            
                }
                else
                {
                    Response.Redirect("LogIn.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('קופון זה לא קיים');</script>");
                return;
            }
        }
    }*/



    protected void btnUsePoints_Click(object sender, EventArgs e)
    {
        orders endOrder = new orders(DateTime.Now.ToString(), Session["userName"].ToString());
        endOrder.InsertNewOrder(endOrder);
        Session["OrderID"] = endOrder.getLastOrderId(); //שמירת מספר ההזמנה האחרון של המשתמש המזמין בסשן
        lbl_succ.Visible = true;
        pnlCredit.Visible = true;
        float priceFirst;
        //הכנסת לטבלת פרטי הזמנה מהסל
        for (int i = 0; i < grdDetailsCart.Rows.Count; i++)
        {   
            priceFirst = int.Parse(grdDetailsCart.Rows[0].Cells[grdDetailsCart.Rows[0].Cells.Count - 1].Text) - float.Parse(lblPost.Text);
            if (priceFirst < 0)
            {
                lblPost.Text = Math.Abs(priceFirst).ToString();
                priceFirst = 0;
            }
            else
            {
                lblPost.Text = "0";
            }
            endOrder.DivideAndConquer(Session["userName"].ToString(), Session["OrderID"].ToString(), grdDetailsCart.Rows[i].Cells[grdDetailsCart.Rows[0].Cells.Count - 3].Text, grdDetailsCart.Rows[i].Cells[grdDetailsCart.Rows[0].Cells.Count - 2].Text, priceFirst.ToString());
        }
        ser.updPoints(Session["userName"].ToString(), (int)(float.Parse(lblPost.Text) * 10));
        lbl_succ.Visible = true;
        btnRec.Visible = true;
        grdDetailsCart.Visible = false;
        pnlPoints.Visible = false;
        lblCover.Visible = false;
        Page_Load(sender, e);
    }



    protected void btnSavePoints_Click(object sender, EventArgs e)
    {
        orders endOrder = new orders(DateTime.Now.ToString(), Session["userName"].ToString());
        endOrder.InsertNewOrder(endOrder);
        Session["OrderID"] = endOrder.getLastOrderId(); //שמירת מספר ההזמנה האחרון של המשתמש המזמין בסשן
        lbl_succ.Visible = true;
        pnlCredit.Visible = true;
        //הכנסת לטבלת פרטי הזמנה מהסל
        for (int i = 0; i < grdDetailsCart.Rows.Count; i++)
        {
            endOrder.DivideAndConquer(Session["userName"].ToString(), Session["OrderID"].ToString(), grdDetailsCart.Rows[i].Cells[grdDetailsCart.Rows[0].Cells.Count - 3].Text, grdDetailsCart.Rows[i].Cells[grdDetailsCart.Rows[0].Cells.Count - 2].Text, grdDetailsCart.Rows[i].Cells[grdDetailsCart.Rows[0].Cells.Count - 1].Text);
        }
        ser.updPoints(Session["userName"].ToString(), (int)(float.Parse(lblPost.Text) * 10) + int.Parse(txtTotal.Text));
        lbl_succ.Visible = true;
        btnRec.Visible = true;
        grdDetailsCart.Visible = false;
        pnlPoints.Visible = false;
        lblCover.Visible = false;
        Page_Load(sender, e);
    }


}