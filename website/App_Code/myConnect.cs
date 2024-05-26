using System;
using System.Data;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class myConnect
{

    //שם הקובץ  של בסיס הנתונים  
    const string FILE_NAME = "db.mdb";

    // פעולה סטטית המחזירה מחרוזת התחברות.
    //האתר ידע היכן קובץ  הנתונים נמצא ונוכל לעדכן ולבצע שאילתות על הנתונים  
    public static string GetConnectionString()
    {
        string location = HttpContext.Current.Server.MapPath("~/App_Data/" + FILE_NAME);
        string ConnectionString = @"provider=Microsoft.jet.oledb.4.0; data source =" + location;
        return ConnectionString;
    }
}