<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminMenu.aspx.cs" Inherits="Admin_AdminMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
    .button {
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background:linear-gradient(131.45deg,#0cabf0,#003CFF);
  border: none;
  border-radius: 50px;
  box-shadow: 0 5px #999;
  width:200px;
  font-family:Gisha;
  font-weight: bold;
  transition: all 0.5s;
}

.button:hover {
    background:linear-gradient(131.45deg,black,red);
    box-shadow: 0 3px #a38484;

}

.button:active {
  background:linear-gradient(131.45deg,black,red);
  box-shadow: 0 1px #666;
  transform: translateY(4px);
}
</style>
<body style="background-color:aquamarine;">
    <form id="form1" runat="server">


        <asp:Label ID="lbl_hello" runat="server" style="z-index: 1; position: absolute; top: 10%; left: 20%; width: 250px; height: 105px; font-size:20px; font-family:Gisha; color:black; text-align:center;" Text=""></asp:Label>
        <asp:Button ID="btn_userDet" runat="server" style="z-index: 1; position: absolute; top: 25%; left: 50%;" Text="פרטי משתמש" CssClass="button" OnClick="btn_Details_Click" />    
        <asp:Button ID="btn_login" runat="server" style="z-index: 1; position: absolute; top: 15%; left: 30%;" Text="להתחברות" CssClass="button" OnClick="btn_login_Click" />
        <asp:Button ID="btnBack" runat="server" style="z-index: 1; position: absolute; top: 10%; left: 10%;" Text="דף הבית" CssClass="button" OnClick="btn_Back_Click" />
        <asp:Button ID="btnCity" runat="server" style="width: 320px; z-index: 1; position: absolute; top: 35%; left: 50%;" Text="פרטי משתמש לפי עיר" CssClass="button" OnClick="btn_City_Click" />
        <asp:Button ID="btnGen" runat="server" style="width: 320px; z-index: 1; position: absolute; top: 35%; left: 30%;" Text="פרטי משתמש לפי מין" CssClass="button" OnClick="btn_Gen_Click" />
        <asp:Button ID="btnUpd" runat="server" style="z-index: 1; position: absolute; top: 35%; left: 10%;" Text="עדכון מחירים" CssClass="button" OnClick="btn_Upd_Click" />
        <asp:Button ID="btnNew" runat="server" style="width: 420px; z-index: 1; position: absolute; top: 35%; left: 70%;" Text="הוספת משחק וסוג משחק" CssClass="button" OnClick="btn_New_Click" />
        <asp:Button ID="btnRate" runat="server" style="width: 320px; z-index: 1; position: absolute; top: 15%; left: 70%;" Text="דירוגי האתר" CssClass="button" OnClick="btn_rat_Click" />

    </form>
</body>
</html>
