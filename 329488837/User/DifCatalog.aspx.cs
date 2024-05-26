using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class User_DifCatalog : System.Web.UI.Page
{
    Games g = new Games();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["userName"] == null) Response.Redirect("LogIn.aspx");      
        grd_games.DataSource = g.GetGames();
        grd_games.DataBind();
        if (grd_games.Rows.Count > 0)
        {
            grd_games.HeaderRow.Cells[5].Width = 300;
            grd_games.HeaderRow.Cells[6].Visible = false;
            grd_games.HeaderRow.Cells[7].Visible = false;
            
            for (int i = 0; i < grd_games.Rows.Count; i++)
            {
                grd_games.Rows[i].Cells[6].Visible = false;
                grd_games.Rows[i].Cells[7].Visible = false;
                grd_games.Rows[i].Cells[5].Width = 300;
            }
        }
        lbl_succ.Visible = false;
    }
    protected void grd_games_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //שליפת נתונים מהגריד ויו לפאנל בהתאם למספר השורה שבחרתי
        pnl_game.Visible = true;
        int row = Convert.ToInt32(e.CommandArgument);//בעזרת פקודה זו מקבלים את מספר השורה שבחרנו
        txtGameCode.Text = grd_games.Rows[row].Cells[2].Text;
        txtGameName.Text = grd_games.Rows[row].Cells[3].Text;
        txtPrice.Text = grd_games.Rows[row].Cells[8].Text;
        txtgameType.Text = grd_games.Rows[row].Cells[4].Text;
        GameImg.ImageUrl = grd_games.Rows[row].Cells[7].Text;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Session["userName"] == null) Response.Redirect("LogIn.aspx");
        Button btn = (Button)sender;
        Cart ctup = new Cart(Session["userName"].ToString(), txtGameCode.Text, txtGameName.Text, txtPrice.Text);
        if (ctup.addToCart()) lbl_succ.Text = "ההזמנה נקלטה בהצלחה";
        else lbl_succ.Text = "כבר קנית משחק זה, אם ברצונך להורידו שוב ניתן לעשות זאת בספרייה";
        lbl_succ.Visible = true;
    }

    protected void btnEnd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    
}