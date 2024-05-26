<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PriceUpd.aspx.cs" Inherits="Admin_PriceUpd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body style="background-color:burlywood;">
    <form id="form1" runat="server">
        <asp:Label ID="lbl_des" runat="server" style="z-index: 1; position: absolute; top: 71px; left: 44%; width: 525px; height: 75px; font-size:80px; font-family:Gisha; color:royalblue; text-align:center; font-weight:bolder; margin-top: 0px;" Text="עדכון מחירים"></asp:Label>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; position: absolute; top: 518px; right: 990px; direction: rtl; font-family: Gisha; color: #870058; font-size: 30px; font-weight:bold;" Text="הכנס אחוז לשינוי" Visible="False"></asp:Label>
        <asp:TextBox ID="txtUpd" runat="server" style="z-index: 1; position: absolute; top: 515px; right: 1275px; direction: rtl; font-family: Gisha; font-size: 30px; color: #870058; font-weight:bold; width:200px;" Visible="False"></asp:TextBox>
        <asp:Button ID="btnUpd" runat="server" CssClass="button" style="z-index: 1; position: absolute; top: 620px; right: 1000px; height: 65px; font-size: 30px; width:225px" Text="שינוי מחירים" OnClick="btnUpd_Click" Visible="False" />
        <asp:Button ID="btnCanc" runat="server" CssClass="button" style="z-index: 1; position: absolute; top: 620px; right: 1250px; height: 65px; font-size: 30px; width:225px" Text="ביטול  השינוי" OnClick="btnCanc_Click" />
        <asp:RadioButtonList ID="rblChoice" runat="server" style="z-index: 1; position: absolute; top: 402px; right: 146px; direction: rtl; font-family: Gisha; font-size: 30px; color: #870058; font-weight:bold; height: 175px; width: 275px;" OnSelectedIndexChanged="rblChoice_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem Value="all">שינוי מחיר כולל</asp:ListItem>
            <asp:ListItem Value="book">שינוי מחיר למשחק</asp:ListItem>
        </asp:RadioButtonList>
        <asp:DropDownList ID="ddlPackages" runat="server" style="z-index: 1; position: absolute; top: 365px; right: 17%; font-size:28px; width:270px; direction:rtl;" AutoPostBack="True" Visible="false" OnSelectedIndexChanged="ddlPacks_SelectedIndexChanged" >
        </asp:DropDownList>
        <asp:Label ID="lbl_suc" runat="server" style="z-index: 1; position: absolute; top: 650px; right: 500px; direction: rtl; font-family: Gisha; color: #870058; font-size: 30px; font-weight:bold;" Visible ="false" Text="המחירים שונו בהצלחה"></asp:Label>

        <asp:GridView ID="grd_packages" runat="server" style="z-index: 1;position: absolute; top: 145px; left: 319px; font-family:Gisha; font-size:25px;" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:Button ID="btnBack" runat="server" style="z-index: 1; position: absolute; top: 10%; left: 25%;" Text="דף הבית" CssClass="button" OnClick="btn_Back_Click" />


    </form>
</body>
</html>
