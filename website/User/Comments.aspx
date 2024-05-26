<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="User_Comments" %>

    <link href="../Styles/NavBar.css" rel="stylesheet" />
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
<body style="background-color:cadetblue;">
    <form id="form1" runat="server">
    <div id="navbar">
            <a href="Home.aspx">בית</a>
            <a href="GameTypes.aspx">קטלוג ראשי</a>
        
            <a href="DifCatalog.aspx">קטלוג משני</a>
            <a class="active" href="Comments.aspx">צור קשר</a>
            <a id="login" style="visibility:hidden;" href="LogIn.aspx">להתחברות</a>
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
        </div>
        <asp:Label ID="lbl_Head" runat="server" style="z-index: 1; position: absolute; top: 10%; left: 48%; font-size:40px; font-family:Gisha; color:black; text-align:center;" Text="צור קשר"></asp:Label>
        <asp:Label ID="lbl_mail" runat="server" style="font-size:28px; font-family:Gisha; color:black; z-index: 1; position: absolute; top: 35%; right: 35%" Text="מייל"></asp:Label>
        <asp:TextBox ID="txtmail" runat="server" style="z-index: 1; position: absolute; top: 35%; right: 45%; width:350px;" TextMode="Email"></asp:TextBox>
        <asp:Label ID="lbl_type" runat="server" style="font-size:28px; font-family:Gisha; color:black; z-index: 1; position: absolute; top: 42%; right: 35%" Text="סוג תגובה"></asp:Label>
        <asp:DropDownList ID="ddlType" runat="server" style="z-index: 1; position: absolute; top: 42%; right: 45%; width:350px;">
            <asp:ListItem>לבחור</asp:ListItem>
            <asp:ListItem>תלונה</asp:ListItem>
            <asp:ListItem>הצעת ייעול</asp:ListItem>
            <asp:ListItem>שאלה</asp:ListItem>
            <asp:ListItem>בקשה</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lbl_date" runat="server" style="font-size:28px; font-family:Gisha; color:black; z-index: 1; position: absolute; top: 55%; right: 35%" Text="תאריך"></asp:Label>
        <asp:TextBox ID="txtdate" runat="server" style="z-index: 1; position: absolute; top: 55%; right: 45%; width:350px;" Enabled="False" TextMode="DateTime"></asp:TextBox>
        <asp:Label ID="lbl_comment" runat="server" style="font-size:28px; font-family:Gisha; color:black; z-index: 1; position: absolute; top: 62%; right: 35%" Text="תגובה"></asp:Label>
        <asp:TextBox ID="txtcomment" runat="server" style="z-index: 1; position: absolute; top: 62%; right: 45%; width:350px; height:250px;" TextMode="MultiLine"></asp:TextBox>
        <asp:Button ID="btn_Submit" runat="server" style="z-index: 1; position: absolute; top: 75%; right: 65%;" Text="שלח" CssClass="button" OnClick="btn_Submit_Click" />
        <asp:Label ID="lbl_fin" runat="server" style="font-size:23px; font-family:Gisha; color:white; background-color:black; z-index: 1; position: absolute; top: 65%; right: 65%" Text="התגובה נקלטה בהצלחה" Visible="False"></asp:Label>
    
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
