<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="User_Cart" %>
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
<body  style="background-color: deepskyblue">
    
    <form id="form1" runat="server">
        
        <asp:Button ID="btnBack" runat="server" style="z-index: 1; position: absolute; top: 10%; left: 10%;" Text="דף הבית" CssClass="button" OnClick="btn_Back_Click" />
             <asp:Label ID="lbl_des" runat="server" style="z-index: 1; position: absolute; top: 65px; left: 42%; width: 500px; height: 105px; font-size:50px; font-family:Gisha; color:royalblue; text-align:center; font-weight:bolder; margin-top: 0px;" Text="הסל שלי"></asp:Label>
     <asp:Label ID="Label1" runat="server" style="z-index: 1; position: absolute; top: 150px; right: 150px; width: 85px; direction: rtl; font-family: Gisha; font-size:22px; color: #870058; font-weight:bold;" Text="שלח ל"></asp:Label>
     <asp:gridview ID="grdDetailsCart" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" style="z-index: 1; width: 645px; height: 250px; position: absolute; top: 475px; left: 40%" OnRowDeleting="grdDetailsCart_RowDeleting">
            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="Delete" ShowHeader="True" Text="מחק">
                <ControlStyle CssClass="button" />
                <ItemStyle Height="20px" Width="20px" Wrap="True" />
                </asp:ButtonField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
     </asp:gridview>
     <asp:Label ID="Label2" runat="server" style="z-index: 1; position: absolute; top: 760px; right: 235px; width: 150px; direction: rtl; font-family: Gisha; font-size:17px; color: #870058; font-weight:bold;" Text="מספר פריטים"></asp:Label>
     <asp:TextBox ID="txtNum" runat="server" style="z-index: 1; position: absolute; top: 750px; right:385px; width: 150px; height: 30px" Enabled="False"></asp:TextBox>
     <asp:Label ID="Label3" runat="server" style="z-index: 1; position: absolute; top: 835px; right: 235px; width: 150px; direction: rtl; font-family: Gisha; font-size:17px; color: #870058; font-weight:bold;" Text="סהכ לתשלום"></asp:Label>
     <asp:TextBox ID="txtTotal" runat="server" style="z-index: 1; position: absolute; top: 825px; right: 385px; width: 150px; height: 30px" Enabled="False"></asp:TextBox>
     <asp:Label ID="lblPost" runat="server" style="z-index: 1; position: absolute; top: 910px; right: 235px; width: 150px; direction: rtl; font-family: Gisha; font-size:17px; color: #870058; font-weight:bold;" Visible="false"></asp:Label>
     <asp:TextBox ID="txtDate" runat="server" style="z-index: 1; position: absolute; top: 150px; left: 600px; width: 150px; height: 30px" Enabled="False"></asp:TextBox>
     <asp:Button ID="btnPnl" runat="server" CssClass="button" style="z-index: 1; position: absolute; top: 365px; right: 610px; height: 65px" Text="לתשלום" OnClick="btnPnl_Click" />
     <asp:gridview ID="grdDetailsUser" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" style="z-index: 1; width: 425px; height: 120px; position: absolute; top: 185px; right: 150px">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
     </asp:gridview>
        <asp:Label ID="lblCover" runat="server" style=" z-index: 2; position: absolute; height: 100%; width: 100%; opacity:0.6; background-color:lightgray;" Visible ="false" />
        <asp:Panel ID="pnlPoints" runat="server" style="border-radius:18px; border-color:#000; background-color:white; border-style:double; z-index: 3; width: 660px; height: 544px; position: absolute; top: 341px; left: 34%;" Visible="false">
            <asp:Label ID="lblPoints" runat="server" style="direction: rtl; font-family: Gisha; font-size:22px; font-weight:bold; color: #870058; font-weight:bold; z-index: 3; position: absolute; top: 50px; right: 20px; width: 620px; height: 76px;"></asp:Label>
            <asp:Button ID="btnUsePoints" runat="server" CssClass="button" Text="ניצול הנקודות בקניה זו" style=" z-index: 3; position: absolute; top: 250px; right: 150px; height: 70px; width: 400px;" OnClick="btnUsePoints_Click" />
            <asp:Button ID="btnSavePoints" runat="server" CssClass="button" Text="אגירת נקודות בקניה הנוכחית" style=" z-index: 3; position: absolute; top: 375px; right: 150px; height: 70px; width: 400px;" OnClick="btnSavePoints_Click" />
        </asp:Panel>
        
     <asp:Panel ID="pnlCredit" runat="server" style="border-radius:18px; border-color:#000; border-style:double; z-index: 1; width: 625px; height: 625px; position: absolute; top: 225px; left: 2%;">
            <asp:Label ID="Label4" runat="server" style="z-index: 1; position: absolute; top: 100px; right: 150px; width: 135px; direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Text="תעודת זהות"></asp:Label>
            <asp:TextBox ID="txtId" runat="server" style="z-index: 1; position: absolute; top: 90px; right: 300px; width: 209px; height: 30px" TextMode="Number" ></asp:TextBox>
            <asp:Label ID="Label5" runat="server" style="z-index: 1; position: absolute; top: 150px; right: 150px; width: 135px; direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Text="מספר כרטיס"></asp:Label>
            <asp:TextBox ID="txtCardNum" runat="server" style="z-index: 1; position: absolute; top: 140px; right: 300px; width: 209px; height: 30px;" TextMode="Number"></asp:TextBox>
            <asp:Label ID="Label9" runat="server" style="z-index: 1; position: absolute; top: 200px; right: 160px; width: 60px; direction: ltr; font-family: Gisha; color: #870058; font-weight:bold;" Text="CVV"></asp:Label>
            <asp:TextBox ID="txtCVV" runat="server" style="z-index: 1; position: absolute; top: 190px; right: 300px; width: 209px; height: 30px" TextMode="Number" ></asp:TextBox>
         

            <asp:Label ID="Label6" runat="server" style="z-index: 1; position: absolute; top: 350px; right: 150px; width: 80px; direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Text="תוקף"></asp:Label>
            <asp:DropDownList ID="ddlYear" runat="server" style="z-index: 1; position: absolute; top: 350px; right: 225px; width: 105px; height: 30px; font-family: Gisha; font-weight: bold; font-size:x-large;">
                <asp:ListItem>2024</asp:ListItem>
                <asp:ListItem>2025</asp:ListItem>
                <asp:ListItem>2026</asp:ListItem>
                <asp:ListItem>2027</asp:ListItem>
                <asp:ListItem>2028</asp:ListItem>
                <asp:ListItem>2029</asp:ListItem>
                <asp:ListItem>2030</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label7" runat="server" style="z-index: 1; position: absolute; top: 350px; right: 370px; width: 80px; direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Text="חודש"></asp:Label>
            <asp:DropDownList ID="ddlMonth" runat="server" style="z-index: 1; position: absolute; top: 350px; right: 445px; width: 105px; height: 30px; font-family: Gisha; font-weight: 200; font-size: x-large">
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>                
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label8" runat="server" style="z-index: 1; position: absolute; top: 425px; right: 150px; width: 80px; direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Text="חברה"></asp:Label>
            <asp:DropDownList ID="ddlComp" runat="server" style="z-index: 1; position: absolute; top: 425px; right: 235px; width: 295px; height: 30px; font-family: Gisha; font-weight: 200; font-size: x-large;">
                <asp:ListItem>Visa</asp:ListItem>
                <asp:ListItem>MasterCard</asp:ListItem>
                <asp:ListItem>Diners</asp:ListItem>
                <asp:ListItem>American Express</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnPay" runat="server" CssClass="button" style="z-index: 1; position: absolute; top: 500px; right: 45px; height: 65px" Text="סיום הזמנה" OnClick="btnPay_Click" />
            <asp:Label ID="lbl_succ" runat="server" style="z-index: 1; position: absolute; top: 600px; right: 300px;" Text="ההזמנה זוהתה בהצלחה" Visible="false"></asp:Label>
     </asp:Panel>
            <asp:Button ID="btnRec" runat="server" CssClass="button" style="z-index: 1; position: absolute; top: 225px; right: 610px; height: 65px" Visible="false" Text="לחשבונית" OnClick="btnRec_Click" />
    </form>
    
        
</body>
</html>
