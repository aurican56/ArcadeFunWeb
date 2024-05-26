using System;
using System.Data;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class admin
{
    sqlDb sql = new sqlDb();
    //תכונות
    private string adminUser_Name; //שם משתמש
    private string adminPass; //סיסמה

    public admin(string aduser, string adpass)
    {
        this.adminUser_Name = aduser;
        this.adminPass = adpass;
    }
    public string AdminUser_Name
    {
        get { return this.adminUser_Name; }
        set { this.adminUser_Name = value; }
    }
    public string AdminPass
    {
        get { return this.adminPass; }
        set { this.adminPass = value; }
    }

    //התחברות מנהל
    //בדיקה האם פרטי המנהל המוזנים קיימים בבסיס הנתונים
    public bool loginadmin()
    {
        string stlogin = @"SELECT tblAdmin.adminUser, tblAdmin.adminPass FROM tblAdmin WHERE(((tblAdmin.adminUser) =
                           '" + this.AdminUser_Name + "') AND((tblAdmin.adminPass) ='" + this.AdminPass + "')); ";
        if (sql.chkData(stlogin).Tables[0].Rows.Count > 0) return true;
        return false;
    }


}

