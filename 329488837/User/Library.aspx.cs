using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_Library : System.Web.UI.Page
{
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null) Response.Redirect("LogIn.aspx");
        else
        {
            lbl_hello.Text = "שלום " + Session["userName"].ToString();
            pnl_creation();
        }
    }
    public void pnl_creation()
    {
        Games g = new Games();
        ds = g.chkOwn(Session["userName"].ToString()); ;
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            int left = 150 + (i % 3) * 650, top = 350 + (i / 3) * 375;
            Panel pnl = new Panel();
            pnl.ID = "pnl_gm" + i;
            pnl.Attributes.CssStyle.Add("top", top + "px");
            pnl.Attributes.CssStyle.Add("left", left + "px");
            pnl.CssClass = "pnl";
            pnl.Controls.Add(Control("lbl_succ" + i, "", 300, 175));
            pnl.Controls.Add(Control("img_gm" + i, ds.Tables[0].Rows[i][5].ToString()));
            pnl.Controls.Add(Control("lbl_GameName" + i, ds.Tables[0].Rows[i][1].ToString(), 10));
            pnl.Controls.Add(Control("btn_DownLoad" + i, "להורדה", 75, 265));
            pnl.Visible = true;
            Form.Controls.Add(pnl);
        }
    }
    public Control Control(string id, string teUr, int top = 0, int left = 0)
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
        btn.Attributes.CssStyle.Add("left", left + "px");
        btn.Click += new EventHandler(btnDownLoad);
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
    protected void btnDownLoad(object sender, EventArgs e)
    {
        if (Session["userName"] == null) Response.Redirect("LogIn.aspx");
        Button btn = (Button)sender;
        int x = btn.ID[12] - '0';
        game.Src = ds.Tables[0].Rows[x][4].ToString();
    }
}