using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_PanelCatalog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GameType"] == null) Response.Redirect("GameTypes.aspx");
        else pnl_creation();
        lbldes.Text = Session["GameType"].ToString();
    }
    
    public void pnl_creation()
    {
        Games g = new Games();
        g.GameType = Session["GameType"].ToString();
        DataSet ds = g.GetGamesByType();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            int left = 150 + (i % 2) * 875, top = 150 + (i / 2) * 725;
            Panel pnl = new Panel();
            pnl.ID = "pnl_gm" + i;
            pnl.Attributes.CssStyle.Add("top", top + "px");
            pnl.Attributes.CssStyle.Add("left", left + "px");
            pnl.CssClass = "pnl";
            pnl.Controls.Add(Control("lbl_code" + i, "קוד משחק", 95, 120));
            pnl.Controls.Add(Control("lbl_name" + i, "שם משחק", 215, 120));
            pnl.Controls.Add(Control("lbl_c" + i, "מחיר", 345, 120));
            pnl.Controls.Add(Control("lbl_succ" + i, "", 660, 175));
            pnl.Controls.Add(Control("img_gm" + i, ds.Tables[0].Rows[i][5].ToString()));
            pnl.Controls.Add(Control("txt_GameCode" + i, ds.Tables[0].Rows[i][0].ToString(), 125));
            pnl.Controls.Add(Control("txt_GameName" + i, ds.Tables[0].Rows[i][1].ToString(), 255));
            pnl.Controls.Add(Control("txt_Cos" + i, ds.Tables[0].Rows[i][6].ToString(), 400));
            pnl.Controls.Add(Control("btn_End" + i, "סיום הזמנה", 575, 75));
            pnl.Controls.Add(Control("btn_Add" + i, "הוסף לסל", 575, 300));
            pnl.Visible = true;
            Form.Controls.Add(pnl);
        }
    }
    public Control Control(string id, string teUr, int top  = 0, int left = 0)
    {
        switch (id.Split('_')[0])
        {
            case "img":
                return Image(id, teUr);
            case "lbl":
                return Label(id, teUr, top, left);
            case "txt":
                return TextBox(id, top, teUr);
            case "btn":
                return Button(id, teUr, left, top);
            default:
                return null;
        }
    }
    public Control Button(string id, string Text, int left, int top)
    {
        Button btn = new Button();
        btn.ID = id;
        btn.CssClass = "button";
        btn.Text = Text;
        if (id.Contains("Add")) btn.Click += new EventHandler(btnAdd_Click);
        if (id.Contains("End")) btn.Click += new EventHandler(btnEnd_Click);
        btn.Attributes.CssStyle.Add("left", left + "px");
        btn.Attributes.CssStyle.Add("top", top + "px");
        return btn;
    }
    public Control Image(string id, string url)
    {
        Image img = new Image();
        img.ID = id;
        img.CssClass = "img";
        img.ImageUrl = url;
        return img;
    }

    public Control Label(string id, string Text, int top, int left)
    {
        Label str = new Label();
        str.CssClass = "lbl";
        str.ID = id;
        str.Text = Text;
        str.Attributes.CssStyle.Add("right", left + "px");
        str.Attributes.CssStyle.Add("top", top + "px");
        return str;
    }
    public Control TextBox(string id, int top, string val)
    {
        TextBox txt = new TextBox();
        txt.ID = id;
        txt.CssClass = "txt";
        txt.Attributes.CssStyle.Add("top", top + "px");
        txt.Attributes.Add("disabled", "disabled");
        txt.Text = val;
        return txt;
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Session["userName"] == null) Response.Redirect("LogIn.aspx");
        Button btn = (Button)sender;
        int x = btn.ID[7] - '0';
        TextBox txtSum = (TextBox)btn.Parent.FindControl("txt_Cos" + x), txtGameCode = (TextBox)btn.Parent.FindControl("txt_GameCode" + x), txtGameName = (TextBox)btn.Parent.FindControl("txt_GameName" + x);
        Label lbl_succ = (Label)btn.Parent.FindControl("lbl_succ" + x);
        Cart ctup = new Cart(Session["userName"].ToString(), txtGameCode.Text, txtGameName.Text,  txtSum.Text);
        if (ctup.addToCart()) lbl_succ.Text = "ההזמנה נקלטה בהצלחה";
        else lbl_succ.Text = "כבר קנית משחק זה, אם ברצונך להורידו שוב ניתן לעשות זאת בספרייה";
        lbl_succ.Visible = true;
    }

    protected void btnEnd_Click(object sender, EventArgs e)
    {
        if (Session["userName"] == null) Response.Redirect("LogIn.aspx");
        Response.Redirect("Cart.aspx");
    }
}