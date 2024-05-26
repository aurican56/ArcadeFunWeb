using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
/// Summary description for orders
/// </summary>
public class orders
{
    sqlDb sql = new sqlDb();
    //תכונות
    private string orderId;
    private string orderDate; //תאריך הזמנה
    private string username; //קוד לקוח
    public orders(string ordate, string user)
    {
        this.orderDate = ordate;
        this.username = user;
    }
    public orders(string orID)
    {
        this.orderId = orID;
    }
    public string OrderId
    {
        get { return this.orderId; }
        set { this.orderId = value; }
    }
    public string OrderDate
    {
        get { return this.orderDate; }
        set { this.orderDate = value; }
    }
    public string Username
    {
        get { return this.username; }
        set { this.username = value; }
    }
    //הכנסת תאריך הזמנה ושם משתמש
    public void InsertNewOrder(orders or)
    {
        string stInsert = "Insert into tblOrders(orderDate, user_Name) values ('" + or.OrderDate + "', '" + or.Username + "')";
        sql.udi(stInsert);
    }
    
    //הפעולה מחזירה את מספר ההזמנה האחרון של המשתמש
    public String getLastOrderId()
    {
        string stget = @"SELECT Max(tblOrders.orderId) AS MaxמתוךorderId FROM tblOrders GROUP BY 
                         tblOrders.user_Name HAVING (tblOrders.user_Name='" + this.Username + "');";
        return sql.chkData(stget).Tables[0].Rows[0][0].ToString();
    }

    //הפעולה מכניסה את הפרטים לטבלת פרטי הזמנות שמשמשת כארכיון
    //לאחר מכן הפעולה מוחקת את פרטי ההזמנה הנ"ל מסל המשתמש
    public void DivideAndConquer(string UserName, string orderID, string GameID, string gameName, string total)
    {
        string stIn = @"Insert into tblSubOrders(orderId, GameId, GameName, total) 
                        values('" + orderID + "', '" + GameID + "', '" + gameName + "', '" + total + "');";
        sql.udi(stIn);
        string stDel = @"DELETE tblCart.user_Name, tblCart.GameId FROM tblCart WHERE
                         (tblCart.user_Name = '" + UserName + "' ) AND (tblCart.GameId =" + GameID+ ");";
        sql.udi(stDel);
    }

    //הפעולה מחזירה פרטי הזמנה מארכיון ההזמנות
    public DataSet SubOrderTable()
    {
        string stOr = @"SELECT tblSubOrders.GameId, tblGames.gameName, tblGames.cost, tblSubOrders.total FROM tblGames INNER JOIN tblSubOrders
                        ON tblGames.GameID = tblSubOrders.GameId WHERE(tblSubOrders.orderId = " + this.OrderId + ");";
        return sql.chkData(stOr);
    }

    //הפעולה מחזירה את פרטי כל ההזמנות של המשתמש
    public DataSet UserOrders()
    {
        string ur = "SELECT tblOrders.orderId, tblOrders.orderDate FROM tblOrders WHERE(tblOrders.user_Name='" + this.Username + "');";
        return sql.chkData(ur);
    }
}