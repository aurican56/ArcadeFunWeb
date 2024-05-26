using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_PriceUpd : System.Web.UI.Page
{
    public static string where = ";";
    public static double precent;
    Games g = new Games();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminName"] == null) Response.Redirect("AdminMenu.aspx");
        if (!IsPostBack)
        {
            GridData(";");
        }
        btnCanc.Visible = false;
        lbl_suc.Visible = false;
    }
    public void GridData(string f)
    {
        
        grd_packages.DataSource = g.UpdGame(f);
        grd_packages.DataBind();
        grd_packages.Visible = true;
    }
    protected void rblChoice_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnUpd.Visible = true;
        txtUpd.Visible = true;
        Label1.Visible = true;
        if (rblChoice.SelectedValue == "all") All();
        else Game();
    }
    public void All()
    {
        where = ";";
        GridData(where);
        ddlPackages.Visible = false;
        txtUpd.Text = "";
    }
    public void Game()
    {
        ddlPackages.Items.Clear();
        DataSet ds = g.GetGames();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ddlPackages.Items.Add(ds.Tables[0].Rows[i][1].ToString());
        }
        ddlPackages.Visible = true;
    }
    protected void ddlPacks_SelectedIndexChanged(object sender, EventArgs e)
    {
        where = " WHERE(((tblGames.gameName) = '" + ddlPackages.SelectedItem.Text + "'));";
        GridData(where);
    }
    protected void btnUpd_Click(object sender, EventArgs e)
    {
        btnCanc.Visible = true;
        if (txtUpd.Text != "" && where != null)
        {
            g.UpdatePrice(txtUpd.Text, where);
            precent = double.Parse(txtUpd.Text);
            lbl_suc.Visible = true;
            grd_packages.DataSource = g.UpdGame(where);
            grd_packages.DataBind();
            grd_packages.Visible = true;
        }
    }
    protected void btnCanc_Click(object sender, EventArgs e)
    {
        precent = -100 * precent / (precent + 100);
        //precent *= -1;
        if (where != null)
        {
            g.UpdatePrice(precent.ToString(), where);
            precent = 0;
            lbl_suc.Text = "השינוי בוטל בהצלחה";
            lbl_suc.Visible = true;
            grd_packages.DataSource = g.UpdGame(where);
            grd_packages.DataBind();
            grd_packages.Visible = true;
        }
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminMenu.aspx");
    }

}