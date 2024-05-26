using System;
using System.Data;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class users
{
    sqlDb sql = new sqlDb();
    static sqlDb sq = new sqlDb();

    //תכונות
    private string fName;  // שם פרטי
    private string lName;//שם משפחה
    private string addres;//כתובת
    private string cityName; //עיר
    private string gender; //מגדר
    private string phoneNumber; //טלפון
    private string mail; //דואר אלקטרוני
    private string user_Name; //שם משתמש
    private string pass; //סיסמה
   
    public users() { }
    public users(string uN)
    {
        this.user_Name = uN;
    }
    public users(string fN, string lN, string aD, string cN, string gE, string pN, string mA, string uN, string pA)
    {
        this.fName = fN;
        this.lName = lN;
        this.addres = aD;
        this.cityName = cN;
        this.gender = gE;
        this.phoneNumber = pN;
        this.mail = mA;
        this.user_Name = uN;
        this.pass = pA;

    }
    public string FName
    {
        get { return this.fName; }
        set { this.fName = value; }
    }
    public string LName
    {
        get { return this.lName; }
        set { this.lName = value; }
    }
    public string Addres
    {
        get { return this.addres; }
        set { this.addres = value; }
    }
    public string CityName
    {
        get { return this.cityName; }
        set { this.cityName = value; }

    }
    public string Gender
    {
        get { return this.gender; }
        set { this.gender = value; }
    }
    public string PhoneNumber
    {
        get { return this.phoneNumber; }
        set { this.phoneNumber = value; }
    }
    public string Mail
    {
        get { return this.mail; }
        set { this.mail = value; }

    }
    public string User_Name
    {
        get { return this.user_Name; }
        set { this.user_Name = value; }
    }
    public string Pass
    {
        get { return this.pass; }
        set { this.pass = value; }
    }

    //בדיקה בבסיס הנתונים האם שם המשתמש כבר קיים
    public bool ifExist()
    {
        string stuser = "SELECT tblUsers.User_Name FROM tblUsers WHERE(((tblUsers.User_Name) = '" + this.User_Name + "'));";
        if (sql.chkData(stuser).Tables[0].Rows.Count > 0) return true;
        return false;
    }
    //הוספת המשתמש לבסיס הנתונים
    public void addUser()
    {
        string stAddUser = @"Insert into tblUsers(fName, lName, adress, city, Gender, Phone_Number, mail, User_Name, User_Password) values 
                            ('" + this.FName + "', '" + this.LName + "', '" + this.Addres + "', '" + this.CityName + "', '" + this.Gender +
                            "', '" + this.PhoneNumber + "', '" + this.Mail + "', '" + this.User_Name + "', '" + this.Pass + "')";
        sql.udi(stAddUser);
    }
    
    //התחברות משתמש
    public bool loginuser()
    {
        string stlogin = @"SELECT tblUsers.User_Name, tblUsers.User_Password FROM tblUsers WHERE
                          (((tblUsers.User_Name) ='" + this.User_Name + "') AND((tblUsers.User_Password) ='" + this.Pass + "')); ";
        if (sql.chkData(stlogin).Tables[0].Rows.Count > 0) return true;
        return false;
    }
    //פרטי משתמש על פי שם המשתמש שלו
    public DataSet UserByUserName()
    {
        string stusers = @"SELECT tblUsers.fName, tblUsers.lName, tblUsers.adress, tblUsersCities.CityName, 
                          tblUsersGender.Gender, tblUsers.Phone_Number, tblUsers.mail FROM tblUsersCities INNER JOIN
                          (tblUsersGender INNER JOIN  tblUsers ON tblUsersGender.GenderId = tblUsers.Gender) ON 
                          tblUsersCities.CityID = tblUsers.city WHERE(((tblUsers.User_Name) ='" + this.User_Name + "'));";
        return sql.chkData(stusers);
    }

    //פרטי משתמש על פי עיר
    public DataSet UserByCity()
    {
        string stusers = @"SELECT tblUsers.fName, tblUsers.lName, tblUsers.adress FROM tblUsersCities INNER JOIN tblUsers
                           ON tblUsersCities.CityId = tblUsers.city WHERE(((tblUsersCities.CityName) = '" + this.CityName + "'));";
        return sql.chkData(stusers);
    }
    //פרטי משתמש על פי מין
    public DataSet UserByGender()
    {
        string stusers = @"SELECT tblUsers.fName, tblUsers.lName, tblUsers.adress FROM tblUsersGender INNER JOIN tblUsers
                           ON tblUsersGender.GenderID = tblUsers.Gender WHERE(((tblUsersGender.Gender) ='" + this.Gender + "'));";
        return sql.chkData(stusers);
    }

    //הפעולה מחזירה את כל המשתמשים בבסיס הנתונים
    public static int GetUsers()
    {
        string stusers = "SELECT tblUsers.fName, tblUsers.lName, tblUsers.adress FROM tblUsers;";
        return sq.chkData(stusers).Tables[0].Rows.Count;
    }
}
