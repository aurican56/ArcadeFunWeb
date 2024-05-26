using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ClientServices;
using System.Net;
using System.IO;

public partial class Admin_NewPackage : System.Web.UI.Page
{

    Games g = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblSucc.Visible = false;

    }
    protected void btn_Insert_Click(object sender, EventArgs e)
    {
        string ImgfilePath = HttpContext.Current.Server.MapPath("~/Images/"), ImgName = txt_imgName.Text + ".jpg";
        lblSucc.Visible = true;
        ImgName.Replace(' ', '_');
        if (txtGname.Text != "" && txtPrice.Text != "" && GameFileUpload.HasFile && txtfileName.Text != "" && txt_imgName.Text != "" && ddlGameTypes.SelectedItem.Text != "" && ImageFileUpload.HasFile)
        {
            g = new Games(txtGname.Text, txtDesc.Text, ddlGameTypes.SelectedItem.Value, "/Games 0.7/" + txtfileName.Text, "~/Images/" + ImgName, txtPrice.Text);
            if (g.GameifExist()) lblSucc.Text = "משחק זה כבר קיים";
            else try
            {
                try
                {
                    SaveGameFile();
                }
                catch (Exception)
                {
                    throw;
                }
                //SaveImageUploaded(ImgfilePath + ImgName);
                //g.AddGame();
                lblSucc.Text = "המשחק נוסף בהצלחה";
            }
            catch (Exception ex)
            {
                lblSucc.Text = "Couldn't Save Game File: " + ex.ToString();
            }
        }
        else lblSucc.Text = "קלט לא תקין";
    }
    public void SaveImageUploaded(string path)
    {
        ImageFileUpload.SaveAs(path);
    }
    public void SaveGameFile()
    {
        // Get the name of the file to upload.
        string fileName = Server.HtmlEncode(GameFileUpload.FileName);

        // Get the extension of the uploaded file.
        string extension = System.IO.Path.GetExtension(fileName);
        if (extension != ".zip" && extension != ".exe")
        {
            lblSucc.Text = "קובץ המשחק איננו ארכיון";
            throw new ArgumentException("סיומת קובץ המשחק אינה זיפ או exe" + extension);
        }
        string path = HttpContext.Current.Server.MapPath("~/Games 0.7/"), name = txtfileName.Text;
        name.Replace(' ', '_');
        CreateGameDirectory(path + name);
        GameFileUpload.SaveAs(path + name + "/" + fileName);
    }

    public void CreateGameDirectory(string path)
    {
        try
        {
            // Determine whether the directory exists.
            if (Directory.Exists(path))
            {
                lblSucc.Text = "שם זה כבר קיים במערכת";
                return;
            }

            // Try to create the directory.
            DirectoryInfo di = Directory.CreateDirectory(path);
            lblSucc.Text = "The directory was created successfully at " + Directory.GetCreationTime(path);
            return;
        }
        catch (Exception e)
        {
            lblSucc.Text = "The process failed: Path is " + path + " error is " + e.ToString();
        }
    }
    public void SaveImage(string imageUrl, string filename, System.Drawing.Imaging.ImageFormat format)
    {
        ServicePointManager.Expect100Continue = true;
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
        System.Net.WebClient client = new System.Net.WebClient();
        System.IO.Stream stream = client.OpenRead(imageUrl);
        System.Drawing.Bitmap bitmap;
        bitmap = new System.Drawing.Bitmap(stream);
        if (bitmap != null)
        {
            bitmap.Save(filename, format);
        }

        stream.Flush();
        stream.Close();
        client.Dispose();
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminMenu.aspx");
    }


    protected void btnInsertType_Click(object sender, EventArgs e)
    {
        g = new Games();
        lblSucc.Visible = true;
        if (txtGameType.Text != "")
        {
            if (g.GameTypeifExist(txtGameType.Text)) lblSucc.Text = "סוג משחק זה כבר קיים";
            else lblSucc.Text = "סוג המשחק נוסף בהצלחה";
        }
        else lblSucc.Text = "קלט לא תקין";
    }


    protected void btn_Insert_Click1(object sender, EventArgs e)
    {
        string filePath = @"F:\329488837\Documents\מדריך למנהל להעלאת קובץ משחק.docx";
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
}