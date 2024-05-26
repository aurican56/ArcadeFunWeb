<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UsersByCity.aspx.cs" Inherits="Admin_UsersByCity" %>

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
       <asp:Label ID="lbl_des" runat="server" style="z-index: 1; position: absolute; top: 100px; left: 37%; width: 585px; height: 105px; font-size:50px; font-family:Gisha; color:royalblue; text-align:center; font-weight:bold;" Text="פרטי משתמש על פי עיר"></asp:Label>
       <asp:dropdownlist ID="ddlCity" runat="server" style="z-index: 1; position: absolute; top: 265px; right: 250px; height: 25px" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityID" AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged"></asp:dropdownlist>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT [CityID], [CityName] FROM [tblUsersCities]"></asp:SqlDataSource>
       <asp:gridview ID="grddetails" runat="server" style="z-index: 1; width: 650px; height: 190px; position: absolute; top: 266px; left: 383px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
           <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
           <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
           <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#F7F7F7" />
           <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
           <SortedDescendingCellStyle BackColor="#E5E5E5" />
           <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:gridview>
       <asp:Label ID="Label4" runat="server" style="z-index: 1; position: absolute; top: 210px; left: 785px; width: 450px; direction: rtl; font-family: Gisha; color: #870058; font-weight:bold; height: 30px; font-size:25px;" Text="מספר המשתמשים"></asp:Label>
       <asp:Button ID="btnBack" runat="server" style="z-index: 1; position: absolute; top: 6%; left: 10%;" Text="דף הבית" CssClass="button" OnClick="btn_Back_Click" />

    </form>
</body>
</html>
