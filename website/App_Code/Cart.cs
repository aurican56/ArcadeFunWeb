
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Cart
/// </summary>
public class Cart
{

    sqlDb sql = new sqlDb();


    private string user_Name;
    private string gameId;
    private string gameName;
    private string total;
    public Cart()
    {

    }
    public Cart(string u)
    {
        this.user_Name = u;
    }
    public Cart(string u, string gI)
    {
        this.user_Name = u;
        this.gameId = gI;
    }
    public Cart(string uN, string gI, string t)
    {
        this.user_Name = uN;
        this.gameId = gI;
        this.total = t;
    }
    public Cart(string uN, string gI, string gN, string t)
    {
        this.user_Name = uN;
        this.gameId = gI;
        this.gameName = gN;
        this.total = t;
    }
    public String User_Name
    {
        get { return this.user_Name; }
        set { this.user_Name = value; }
    }
    public String GameId
    {
        get { return this.gameId; }
        set { this.gameId = value; }
    }
    public String GameName
    {
        get { return this.gameName; }
        set { this.gameName = value; }
    }
    public String Total
    {
        get { return this.total; }
        set { this.total = value; }
    }

    //הוספה לסל
    //הפעולה בודקת האם המשתמש כבר קנה את המשחק, ואם לא היא מוסיפה אותו לסל - במידה והוא עוד לא נמצא שם
    public bool addToCart()
    {
        
        DataSet ds1 = chkOwnThisGame(this.User_Name, this.GameId);
        if (ds1.Tables[0].Rows.Count > 0) return false;
        string ifExist = @"SELECT tblCart.user_Name, tblCart.gameId, tblCart.gameName, tblCart.total FROM tblCart WHERE
                           (((tblCart.user_Name) ='" + this.User_Name + "') AND((tblCart.gameId) =" + this.GameId + ")); ";
        DataSet ds = sql.chkData(ifExist);
        if (ds.Tables[0].Rows.Count <= 0)
        {
            string stadd = @"Insert into tblCart(user_Name, gameId, gameName, total) values ('" + this.User_Name + 
                            "', '" + this.GameId + "', '" + this.GameName + "', '" + this.Total + "');";
            sql.udi(stadd);
        }
        return true;
    }

    //בדיקת בעלות
    //הפעולה בודקת האם המשתמש קנה בעבר את המשחק
    public DataSet chkOwnThisGame(string u, string i)
    {
        string preOwned = @"SELECT tblOrders.user_Name, tblSubOrders.GameId FROM tblOrders INNER JOIN tblSubOrders ON tblOrders.orderId =
                            tblSubOrders.orderId WHERE(((tblOrders.user_Name) ='" + u + @"') AND((tblSubOrders.GameId) =" + i + "));";
        return sql.chkData(preOwned);
    }

    //הפעולה מחזירה את פרטי עגלת המשתמש
    public DataSet getCart()
    {
        string stuser = @"SELECT tblCart.user_Name, tblCart.gameId, tblCart.gameName, tblCart.total FROM tblCart 
                          WHERE(((tblCart.user_Name) ='" + this.User_Name + "'))";
        return sql.chkData(stuser);
    }

    //מחיקת משחק מעגלה של משתמש
    public void DeleteCartRow()
    {
        string DelBook = @"DELETE tblCart.user_Name, tblCart.gameId FROM tblCart 
                            WHERE(((tblCart.user_Name) = '" + this.User_Name + "' ) AND((tblCart.gameId) = " + this.GameId + " ));";
        sql.udi(DelBook);
    }

    //עדכון מחיר
    //הפעולה מקבלת מחרוזת המייצגת את אחוזי שינוי המחיר ומשנה אותה לפיו
    public void UpdatePrice(string y)
    {
        sql.udi("UPDATE tblCart SET tblCart.total = tblCart.total - (" + y + @" *tblCart.total / 100) WHERE
                 (((tblCart.user_Name) ='" + this.User_Name + "'));");
    }
}