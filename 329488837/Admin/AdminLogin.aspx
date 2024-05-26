<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Admin_AdminLogin" %>

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
<body style="background-color:bisque;">
    <form id="form1" runat="server" style="font-family:Gisha; font-size:large;">
    <asp:Label ID="lbl_des" runat="server" style="z-index: 1; position: absolute; top: 150px; left: 40%; width: 380px; height: 105px; font-size:45px; font-family:Gisha; color:royalblue; text-align:center; font-weight:bold;" Text="התחברות מנהל"></asp:Label>
    <asp:Panel ID="pll_login" runat="server" style="background-color:mediumaquamarine; z-index: 1; width: 700px; height: 338px; position: absolute; top: 300px; left: 30%;">
        <asp:Label ID="Label2" runat="server" style="z-index: 1; position: absolute; top: 10%; right: 25%" Text="שם משתמש מנהל"></asp:Label>
        <asp:TextBox ID="txt_AdminUsername" runat="server" style="z-index: 1; position: absolute; top: 10%; right: 50%"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; position: absolute; top: 25%; right: 25%" Text="סיסמת מנהל"></asp:Label>
        <asp:TextBox ID="txt_Adminpass" runat="server" style="z-index: 1; position: absolute; top: 25%; right: 50%"></asp:TextBox>
        <asp:Button ID="btn_login" runat="server" style="z-index: 1; position: absolute; top: 60%; right: 60%; width:225px;" Text="התחברות מנהל" CssClass="button" OnClick="btn_login_Click" />
        <asp:Label ID="lbl_err" runat="server" style="z-index: 1; position: absolute; top: 70%; right: 30%" Visible="false" Text="פרטים שגויים"></asp:Label>
    </asp:Panel>
        <asp:Button ID="btnBack" runat="server" style="z-index: 1; position: absolute; top: 10%; left: 10%;" Text="דף הבית" CssClass="button" OnClick="btn_Back_Click" />
    </form>
</body>
</html>
