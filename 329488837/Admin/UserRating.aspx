<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserRating.aspx.cs" Inherits="Admin_UserRating" %>

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
<body style="background-color:lavenderblush;">
    <form id="form1" runat="server">
        <asp:Label ID="lbl_head" runat="server" style="z-index: 1; position: absolute; top: 100px; left: 50%; width: 250px; height: 200px; font-size:32px; font-family:Gisha; color:black; text-align:center;" Text="דירוגי האתר"></asp:Label>
        <asp:Button ID="btn_Back" runat="server" style="font-size:30px; width:215px; z-index: 1; position: absolute; top: 70px; right: 80%; height: 64px;" Text="דף בית" CssClass="button" OnClick="btn_Back_Click" />
        <asp:gridview ID="grdrating" runat="server" style="z-index: 1; width: 650px; height: 190px; position: absolute; top: 266px; left: 300px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
           <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
           <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
           <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#F7F7F7" />
           <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
           <SortedDescendingCellStyle BackColor="#E5E5E5" />
           <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:gridview>
        <asp:Label ID="lbl_average" runat="server" style="z-index: 1; position: absolute; top: 200px; width: 150px; height: 105px; font-size:18px; font-family:Gisha; color:black; text-align:center; left: 1000px;" Visible="false"></asp:Label>

    </form>
</body>
</html>
