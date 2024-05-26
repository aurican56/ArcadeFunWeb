using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_GameTypes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Start();
    }
    public void Start()
    {
        Random p = new Random();
        Games g = new Games();
        DataSet ds = g.ExistingGameTypes(), sd;
        for (int i =0; i < ds.Tables[0].Rows.Count; i++)
        {
            g.GameType = ds.Tables[0].Rows[i][0].ToString();
            sd = g.GetGamesByType();
            double top = 12.5 + (i / 4) * 50, left = 16.5 + (i % 4) * 20;
            int tob = 17 + (i / 4) * 50, lefb = 10 + (i % 4) * 20, j = p.Next(0, sd.Tables[0].Rows.Count);
            Form.Controls.Add(Label("lbl_" + i, ds.Tables[0].Rows[i][0].ToString(), top, left));
            Form.Controls.Add(ImageButton("imgbtn_" + i, ds.Tables[0].Rows[i][0].ToString(), sd.Tables[0].Rows[j][5].ToString(), tob, lefb));
        }
    }
    public Control ImageButton(string id, string type, string url, int top, int left)
    {
        ImageButton imgbtn = new ImageButton();
        imgbtn.CssClass = "imgbtn";
        imgbtn.ID = id;
        imgbtn.ImageUrl = url;
        imgbtn.AlternateText = type;
        imgbtn.Click += new ImageClickEventHandler(ImageClick);
        imgbtn.Attributes.CssStyle.Add("top", top + "%");
        imgbtn.Attributes.CssStyle.Add("left", left + "%");
        return imgbtn;

    }
    public Control Label(string id, string Text, double top, double left)
    {
        Label str = new Label();
        str.CssClass = "lbl";
        str.ID = id;
        str.Text = Text;
        str.Attributes.CssStyle.Add("top", top + "%");
        str.Attributes.CssStyle.Add("left", left + "%");
        return str;
    }
    public void ImageClick(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        Session["GameType"] = btn.AlternateText;
        Response.Redirect("PanelCatalog.aspx");
    }
}
