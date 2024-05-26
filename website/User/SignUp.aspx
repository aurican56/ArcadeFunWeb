<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="User_SignUp" %>

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
<body style="background-color:lightgoldenrodyellow;">
            <link href="../Styles/NavBar.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div id="navbar">
            <a href="Home.aspx">בית</a>
            <a href="GameTypes.aspx">קטלוג ראשי</a>
            <a href="DifCatalog.aspx">קטלוג משני</a>
            <a href="Comments.aspx">צור קשר</a>
            <a  id="menu" style="visibility:hidden; padding: 0.34vmax 1vmax;" onclick="menuPress()">
                <div class="container" id="hamburger">
                    <div class="bar1"></div>
                    <div class="bar2"></div>
                    <div class="bar3"></div>
                </div>
            </a>
            
        </div>
        <div  class="dropdown-content" id="myDropdown">
            <a href="Library.aspx">ספרייה</a>
            <a href="Cart.aspx">עגלה</a>
            <a onclick="m">התנתקות</a>
        </div>
         <asp:Label ID="lbl_signup" runat="server" style="z-index: 1; position: absolute; top: 150px; left: 36%; width: 450px; height: 105px; font-size:50px; font-family:Gisha; color:royalblue; text-align:center; font-weight:bold;" Text="הרשמת משתמש"></asp:Label>
        <asp:Label ID="lblfname" runat="server" style="font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 35%; right: 14%" Text="שם פרטי"></asp:Label>
        <asp:TextBox ID="txtfname" runat="server" style="z-index: 1; position: absolute; top: 35%; right: 20%; width:300px;"></asp:TextBox>
        <asp:Label ID="lbllname" runat="server" style="font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 40%; right: 14%" Text="שם משפחה"></asp:Label>
        <asp:TextBox ID="txtlname" runat="server" style="z-index: 1; position: absolute; top: 40%; right: 20%; width:300px;"></asp:TextBox>
        <asp:Label ID="lblAdress" runat="server" style="font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 45%; right: 14%" Text="כתובת"></asp:Label>
        <asp:TextBox ID="txtAdress" runat="server" style="z-index: 1; position: absolute; top: 45%; right: 20%; width:300px;"></asp:TextBox>
        <asp:Label ID="lblCity" runat="server" style="font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 50%; right: 14%" Text="עיר"></asp:Label>
        <asp:DropDownList ID="ddlCity" runat="server" style="z-index: 1; position: absolute; top: 50%; right: 20%; width:300px;" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityID"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT [CityID], [CityName] FROM [tblUsersCities]"></asp:SqlDataSource>
        <asp:Label ID="lblGender" runat="server" style="font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 60%; right: 15%" Text="מין"></asp:Label>
        <asp:RadioButtonList ID="rblGender" runat="server" style="direction:rtl; z-index: 1; height: 26px; position: absolute; top: 60%; right: 25%;" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Gender" DataValueField="GenderID"></asp:RadioButtonList>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [GenderID], [Gender] FROM [tblUsersGender]"></asp:SqlDataSource>
        <asp:Label ID="lblPhone" runat="server" style="font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 35%; right: 55%" Text="טלפון"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server" style="z-index: 1; position: absolute; top: 35%; right: 60%; width:300px;" TextMode="Phone"></asp:TextBox>
        <asp:DropDownList ID="ddlPr" runat="server" style="z-index: 1; position: absolute; top: 35%; right: 78%; width:60px;">
            <asp:ListItem>050</asp:ListItem>
            <asp:ListItem>051</asp:ListItem>
            <asp:ListItem>052</asp:ListItem>
            <asp:ListItem>053</asp:ListItem>
            <asp:ListItem>054</asp:ListItem>
            <asp:ListItem>055</asp:ListItem>
            <asp:ListItem>056</asp:ListItem>
            <asp:ListItem>058</asp:ListItem>
            <asp:ListItem>059</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblmail" runat="server" style="font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 40%; right: 55%" Text="מייל"></asp:Label>
        <asp:TextBox ID="txtmail" runat="server" style="z-index: 1; position: absolute; top: 40%; right: 60%; width:300px;" TextMode="Email"></asp:TextBox>
        <asp:Label ID="lblUser" runat="server" style="font-size:19.25px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 45%; right: 54%" Text="שם משתמש"></asp:Label>
        <asp:TextBox ID="txtUser" runat="server" style="z-index: 1; position: absolute; top: 45%; right: 60%; width:300px;"></asp:TextBox>
        <asp:Label ID="lblfail" runat="server" style="font-size:19.25px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 45%; right: 82%;" Visible="false" Text="שם משתמש תפוס"></asp:Label>
        <asp:Label ID="lblPass" runat="server" style="font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 50%; right: 55%" Text="סיסמה"></asp:Label>
        <asp:TextBox ID="txtPass" runat="server" style="z-index: 1; position: absolute; top: 50%; right: 60%; width:300px;"></asp:TextBox>
        <asp:Button ID="btn_login" runat="server" style="width:250px; z-index: 1; position: absolute; top: 75%; right: 40%" Text="לחץ כאן להתחברות" CssClass="button" OnClick="btn_login_Click" />
        <asp:Button ID="btn_Register" runat="server" style="z-index: 1; position: absolute; top: 75%; right: 55%" Text="הרשם" CssClass="button" OnClick="btn_Reg_Click" />
        <asp:Label ID="lblSucc" runat="server" style="font-weight:bold; font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 82.5%; right: 45%" Visible="false" Text="הרישום נקלט בהצלחה במערכת"></asp:Label>
        <asp:Button ID="btnBack" runat="server" style="z-index: 1; position: absolute; top: 10%; left: 10%;" Text="דף הבית" CssClass="button" OnClick="btn_Back_Click" />
    </form>
    <script>
        window.onload = function () { LoggedIn() }
        // When the user scrolls the page, execute myFunction
        window.onscroll = function () { sticksNavBar() };

        // Get the navbar
        var navbar = document.getElementById("navbar");

        // Get the offset position of the navbar
        var sticky = navbar.offsetTop;

        function LoggedIn() {
            if (sessionStorage.getItem("UserName") != null) {
                document.getElementById("lbl_hello").textContent = "שלום " + sessionStorage.getItem("UserName");
                document.getElementById("menu").style.visibility = "visible";
                document.getElementById("navbar").removeChild(document.getElementById("login"));
            }
            else {
                document.getElementById("login").style.visibility = "visible";
                document.getElementById("navbar").removeChild(document.getElementById("menu"))
            }

        }

        function sticksNavBar() {
            if (window.pageYOffset >= sticky) {
                navbar.classList.add("sticky")
            } else {
                navbar.classList.remove("sticky");
            }
        }

        function sticksMenu() {
            if (window.pageYOffset >= navbar.getBoundingClientRect().bottom && document.getElementById("myDropdown").classList.contains("show")) {
                document.getElementById("myDropdown").classList.add("sticks");
            } else {
                document.getElementById("myDropdown").classList.remove("sticks");
            }
        }

        function menuPress() {
            document.getElementById("hamburger").classList.toggle("change");
            document.getElementById("myDropdown").style.top = navbar.getBoundingClientRect().bottom;
            document.getElementById("myDropdown").classList.toggle("show");

        }

        function resize() {
            document.getElementById("myDropdown").style.top = navbar.getBoundingClientRect().bottom;
        }
        window.onresize = resize;
    </script>
</body>
</html>
