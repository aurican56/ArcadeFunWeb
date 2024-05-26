<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="Admin_UserDetailsByUserName" %>

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
  position:absolute;
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
.pnl{
    border-radius:18px; 
    border-color:#0cabf0; 
    border-style:double; 
    z-index: 1; 
    width: 850px; 
    height: 700px;
    position: absolute;
}
.lbl{
    z-index: 1;
    position: absolute; 
    direction: rtl; 
    font-family: Gisha; 
    color: #870058; 
    font-weight:bold;
}
.txt{
    z-index: 1; 
    position: absolute; 
    left: 585px; 
    width: 210px; 
    height: 30px;
}
.ddl{
    z-index: 1; 
    position: absolute; 
    top: 510px; 
    left: 590px; 
    width: 210px; 
    height: 30px; 
    font-family: Gisha; 
    font-weight: 200; 
    font-size: larger;
}
.img{
    z-index: 1; 
    position: absolute; 
    top: 75px; 
    left: 35px; 
    max-width: 500px; 
    max-height: 400px;
}
</style>
</head>
<body style="background-color:burlywood;">
    <form id="form1" runat="server">
        <asp:Label ID="lbl_des" runat="server" style="z-index: 1; position: absolute; top: 100px; left: 37%; width: 585px; height: 105px; font-size:50px; font-family:Gisha; color:royalblue; text-align:center; font-weight:bold;" Text="פרטי משתמש"></asp:Label>


        <asp:DropDownList ID="ddl_userdetails" OnLoad="ddl_userdetails_Load" runat="server" style="z-index: 1; left: 60%; top: 250px; position: absolute; height: 40px; width: 100px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="User_Name" DataValueField="UserID" OnSelectedIndexChanged="ddlDetails_SelectedIndexChanged">
        </asp:DropDownList>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [UserID], [User_Name] FROM [tblUsers]"></asp:SqlDataSource>

        <asp:GridView ID="grdDetails" runat="server" style="z-index: 1; left: 55%; top: 400px; position: absolute; " BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:Panel ID="pnlUser" runat="server" style="z-index: 1; left: 20%; top: 25%; position: absolute; height: 435px; width: 400px; background-color:coral;" Visible ="false">
            <asp:Label ID="lbl_fName" runat="server" style="z-index: 1; position: absolute; top: 50px; right: 12.5%; font-size:20px; direction:rtl;" Text="שם פרטי"></asp:Label>
            <asp:Label ID="lbl_lName" runat="server" style="z-index: 1; position: absolute; top: 125px; right: 12.5%; font-size:20px; direction:rtl;" Text="שם משפחה"></asp:Label>
            <asp:Label ID="lbl_Sex" runat="server" style="z-index: 1; position: absolute; top: 200px; right: 12.5%; font-size:20px; direction:rtl;" Text="מין"></asp:Label>
            <asp:Label ID="lbl_address" runat="server" style="z-index: 1; position: absolute; top: 275px; right: 12.5%; font-size:20px; direction:rtl;" Text="כתובת"></asp:Label>
            <asp:Label ID="lbl_phoneNum" runat="server" style="z-index: 1; position: absolute; top: 350px; right: 12.5%; font-size:20px; direction:rtl;" Text="מספר טלפון"></asp:Label>
            
            <asp:TextBox ID="txt_fName" runat="server" style="position:absolute; top: 50px; left:10%; font-size:20px; direction:rtl; width:150px;"></asp:TextBox>
            <asp:TextBox ID="txt_lName" runat="server" style="position:absolute; top: 125px; left:10%; font-size:20px; direction:rtl; width:150px;"></asp:TextBox>
            <asp:TextBox ID="txt_Sex" runat="server" style="position:absolute; top: 200px; left:10%; font-size:20px; direction:rtl; width:150px;"></asp:TextBox>
            <asp:TextBox ID="txt_address" runat="server" style="position:absolute; top: 275px; left:10%; font-size:20px; direction:rtl; width:150px;"></asp:TextBox>
            <asp:TextBox ID="txt_phoneNum" runat="server" style="position:absolute; top: 350px; left:10%; font-size:20px; direction:rtl; width:150px;"></asp:TextBox>
            

        </asp:Panel>
        <asp:Label ID="lblNum" runat="server" style="z-index: 1; position: absolute; top: 175px; left: 10%; font-size:20px; direction:rtl;" Text=""></asp:Label>
               <asp:Button ID="btnBack" runat="server" style="z-index: 1; position: absolute; top: 6%; left: 10%;" Text="דף הבית" CssClass="button" OnClick="btn_Back_Click" />


                <asp:Button ID="btnUpd" runat="server" CssClass="button" style="z-index: 1; position: absolute; top: 810px; right: 30%; height: 65px" Visible="false" Text="שינוי הנקודות" OnClick="btnUpd_Click" />
                <asp:Label ID="lbl_Points" runat="server" style="z-index: 1; position: absolute; top: 709px; right: 25%; font-size:20px; direction:rtl;" Text="מספר נקודות נוכחי" Visible ="false"></asp:Label>
                <asp:TextBox ID="txt_Points" runat="server" style="position:absolute; top: 706px; left:56%; font-size:20px; direction:rtl; width:150px;" Visible="false" Enabled="false"></asp:TextBox>
                <asp:Label ID="lblChange" runat="server" style="z-index: 1; position: absolute; top: 750px; right: 25%; font-size:20px; direction:rtl;" Visible="false" Text="הכנס מספר נקודות חדש"></asp:Label>
                <asp:TextBox ID="txtNewPoints" runat="server" style="position:absolute; top: 750px; left:56%; font-size:20px; direction:rtl; width:150px;" Visible="false"></asp:TextBox>
    </form>
</body>
</html>
