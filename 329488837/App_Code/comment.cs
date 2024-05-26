using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class comment
{
    sqlDb sql = new sqlDb();
    private string email;
    private string commentDate;
    private string commentType;
    private string commentContent;

    public comment(string mail,string coDate,string coType,string comt)
    {
        this.email = mail;
        this.commentDate = coDate;
        this.commentType = coType;
        this.commentContent = comt;
    }
    public comment()
    {

    }
    public string Email
    {
        get { return this.email; }
        set { this.email = value; }
    }
    public string CommentDate
    {
        get { return this.commentDate; }
        set { this.commentDate = value; }

    }
    public string CommentType
    {
        get { return this.commentType; }
        set { this.commentType = value; }

    }

    public string CommentContent
    {
        get { return this.commentContent; }
        set { this.commentContent = value; }
    }

    //הוספת תגובה
    //הפעולה מוסיפה את התגובה לבסיס הנתונים
    public void AddComment()
    {
        string stAddComment = @"Insert into tblComments(Email, commentDate, commentType, commentContent) values 
                                ('" + this.Email + "', '" + this.commentDate + "', '" + this.CommentType + "', '" + this.CommentContent + "')";
        sql.udi(stAddComment);
    }

}