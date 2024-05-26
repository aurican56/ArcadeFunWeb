<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rating.aspx.cs" Inherits="User_Rating" %>

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
<body style="background-color:darkorange;">
        <link href="../Styles/NavBar.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div id="navbar">
            <a href="Home.aspx">בית</a>
            <a href="GameTypes.aspx">קטלוג ראשי</a>
            
            <a href="DifCatalog.aspx">קטלוג משני</a>
            <a href="Comments.aspx">צור קשר</a>
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
        <asp:Label ID="lbl_head" runat="server" style="z-index: 1; position: absolute; top: 100px; left: 50%; width: 250px; height: 200px; font-size:32px; font-family:Gisha; color:white; text-align:center;" Text="דירוג האתר"></asp:Label>
        <asp:Label ID="lbl_hello" runat="server" style="z-index: 1; position: absolute; top: 103px; left: 14%; width: 250px; height: 105px; font-size:18px; font-family:Gisha; color:white; text-align:center;" Text="שלום "></asp:Label>
        <asp:Panel ID="pnl" runat="server" style="z-index: 1; position: absolute; top: 400px; left: 30%; width: 500px; height: 500px;">
            <asp:RadioButtonList ID="rbl_rate" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="lbl_messange" runat="server" style="z-index: 1; position: absolute; top: 30px; width: 150px; height: 105px; font-size:18px; font-family:Gisha; color:white; text-align:center; left: 130px;" Visible="false" Text="דירוג בוצע בהצלחה"></asp:Label>
            <asp:Button ID="btnRate" runat="server" CssClass="button" style="z-index: 1; position: absolute; top: 236px; left: 13%;" Text="דירוג" OnClick="btn_rating" />
        </asp:Panel>
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
