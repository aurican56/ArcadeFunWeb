using System;
using System.Data;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Games
/// </summary>
public class Games
{
    sqlDb sql = new sqlDb();

    private string gameName;
    private string details;
    private string gameType;
    private string gameFile;
    private string gameImg;
    private string cost;

    public Games()  {   }
    public Games(string gn)
    {
        this.gameName = gn;
    }
    public Games(string gN, string d, string gT, string gF, string gI, string C)
    {
        this.gameName = gN;
        this.details = d;
        this.gameType = gT;
        this.gameFile = gF;
        this.gameImg = gI;
        this.cost = C;
    }
    public String GameName
    {
        get { return this.gameName; }
        set { this.gameName = value; }
    }
    public String Details
    {
        get { return this.details; }
        set { this.details = value; }
    }
    public String GameType
    {
        get { return this.gameType; }
        set { this.gameType = value; }
    }
    public String GameFile
    {
        get { return this.gameFile; }
        set { this.gameFile = value; }
    }
    public String GameImg
    {
        get { return this.gameImg; }
        set { this.gameImg = value; }
    }
    public String Cost
    {
        get { return this.cost; }
        set { this.cost = value; }
    }

    //משחקים בבעלות המשתמש
    //הפעולה מחזירה את כל הפרטים על כל המשחקים שהמשתמש קנה בעבר
    public DataSet chkOwn(string uN)
    {
        string preOwned = @"SELECT tblSubOrders.GameId, tblGames.gameName, tblGameType.gameTypeName, tblGames.details, tblGames.gameFile,
        tblGames.gameImg, tblGames.cost FROM tblGameType INNER JOIN (tblGames INNER JOIN(tblOrders INNER JOIN tblSubOrders ON 
        tblOrders.orderId = tblSubOrders.orderId) ON tblGames.GameID = tblSubOrders.GameId) ON tblGameType.GameTypeID = tblGames.gameType 
        WHERE(((tblOrders.user_Name) ='" + uN + "'));";
        return sql.chkData(preOwned);
    }
    //הפעולה מחזירה את כל שמות סוגי המשחק
    public DataSet ExistingGameTypes()
    {
        return sql.chkData(@"SELECT DISTINCT tblGameType.gameTypeName FROM tblGameType INNER JOIN tblGames 
                             ON tblGameType.GameTypeID = tblGames.gameType;");
    }

    //הפעולה מחזירה את כל המשחקים בסוג משחק
    public DataSet GetGamesByType()
    {
        return sql.chkData(@"SELECT tblGames.GameID, tblGames.gameName, tblGameType.gameTypeName, tblGames.details, tblGames.gameFile,
                            tblGames.gameImg, tblGames.cost FROM tblGameType INNER JOIN tblGames ON tblGameType.GameTypeID = 
                            tblGames.gameType WHERE(((tblGameType.gameTypeName) ='" + this.GameType + "'));");
    }
    //הפעולה מחזירה את כל המשחקים והפרטים שלהם
    public DataSet GetGames()
    {
        return sql.chkData(@"SELECT tblGames.GameID, tblGames.gameName, tblGameType.gameTypeName, tblGames.details, tblGames.gameFile,
                    tblGames.gameImg, tblGames.cost FROM tblGameType INNER JOIN tblGames ON tblGameType.GameTypeID = tblGames.gameType;");
    }
    //הפעולה מקבלת מחרוזת שמייצגת שם של סוג משחק ומחזירה אמת אם הוא קיים בבסיס הנתונים
    //במידה והוא לא קיים בבסיס הנתונים, הפעולה תכניס אותו ולאחר מכן תחזיר שקר
    public bool GameTypeifExist(string x)
    {
        string stuser = "SELECT tblGameType.gameTypeName FROM tblGameType WHERE(((tblGameType.gameTypeName) = '" + x + "')); ";
        if (sql.chkData(stuser).Tables[0].Rows.Count > 0) return true;
        sql.udi("Insert into tblGameType(gameTypeName) values ('" + x + "');");
        return false;
    }
    //הפעולה בודקת האם משחק בשם משחק מסוים קיים
    public bool GameifExist()
    {
        string stuser = "SELECT tblGames.gameName FROM tblGames WHERE(((tblGames.gameName) = '" + this.GameName + "')); ";
        if (sql.chkData(stuser).Tables[0].Rows.Count > 0) return true;
        return false;
    }
    //הפעולה מוסיפה לבסיס הנתונים את פרטי המשחק
    public void AddGame()
    {
        string stgame = @"Insert into tblGames(gameName, details, gameType, gameFile, gameImg, cost) values 
                          ('" + this.GameName + "', '" + this.Details +"', '" + this.GameType +"', '" + this.GameFile +"', '" 
                          + this.GameImg +"', '" + this.Cost +"');";
        sql.udi(stgame);
    }
    //החזרת משחק עם פרמטר
    //הפעולה מקבלת חלק מהשאילתה כפרמטר שמשפיע על אילו משחקים הפעולה תחזיר
    public DataSet UpdGame(string x)
    {
        return sql.chkData("SELECT tblGames.gameName, tblGames.cost FROM tblGames" + x);
    }
    //עדכון מחיר עם פרמטר
        //הפעולה מקבלת חלק מהשאילתה כפרמטר שמשפיע על אילו משחקים יחול שינוי המחיר
        //ומעדכנת את המחיר על פי פרמטר נוסף שקובע את אחוזי שינוי המחיר
    public void UpdatePrice(string y, string x)
    {
        sql.udi("UPDATE tblGames SET tblGames.cost = tblGames.cost + (" + y + " *tblGames.cost / 100) " + x);
    }
}