using System;
using System.Data;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary de=scription for Rating
/// </summary>
public class Rating
{
    sqlDb sql = new sqlDb();

    private string userName;
    private string userRating;
    public Rating()
    {

    }

    public Rating(string uN)
    {
        this.userName = uN;
    }

    public Rating(string uN, string uR)
    {
        this.userName = uN;
        this.userRating = uR;
    }

    public string UserName
    {
        get { return this.userName; }
        set { this.userName = value; }
    }

    public string UserRating
    {
        get { return this.userRating; }
        set { this.userRating = value; }

    }

    //הוספת דירוג
    //הפעולה מכניסה לבסיס הנתונים את הדירוג
    public void addRating()
    {
        string stAddRating = @"Insert into tblRating(userName, rating) values 
                               ('" + this.UserName + "', '" + int.Parse(this.UserRating) + "')";
        sql.udi(stAddRating);
    }

    //הפעולה המחזירה את כל הפרטים על כל הדירוגים בבסיס הנתונים
    public DataSet allRating()
    {
        string stallRating = "SELECT tblRating.userName, tblRating.rating FROM tblRating;";
        return sql.chkData(stallRating);
    }

    //הפעולה מחזירה את ממוצע הדירוגים
    public DataSet RatingAverage()
    {
        string staver = "SELECT Avg(tblRating.rating) AS Avgמתוךrating FROM tblRating; ";
        return sql.chkData(staver);
    }
}