<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PanelCatalog.aspx.cs" Inherits="User_PanelCatalog" %>

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
    font-size:15px;
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
<body style="background-color:azure">
        <link href="../Styles/NavBar.css" rel="stylesheet" />
    <form id="form1" runat="server">
         <div id="navbar">
            <a href="Home.aspx">בית</a>
            <a class="active" href="GameTypes.aspx">קטלוג ראשי</a>
             
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
        <asp:Label ID="lbldes" runat="server" style="z-index: 1; position: absolute; top: 6.75%; right: 606px; width: 185px; direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Text=""></asp:Label>
        <asp:Label ID="lbl_Head" runat="server" style="z-index: 1; position: absolute; top: 8%; left: 48%; font-size:40px; font-family:Gisha; color:black; text-align:center;" Text="קטלוג ראשי"></asp:Label>
        <asp:Button ID="btnBack" runat="server" style="z-index: 1; position: absolute; top: 7.5%; left: 10%;" Text="דף הבית" CssClass="button" OnClick="btn_Back_Click" />

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
