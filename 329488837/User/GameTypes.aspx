<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GameTypes.aspx.cs" Inherits="User_GameTypes" %>

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
.imgbtn{
    z-index: 1; 
    position: absolute;
    width: 300px; 
    height: 400px;
}
.lbl{
    z-index: 1; 
    position: absolute; 
    width: 150px;
    direction: rtl; 
    font-family: Gisha; 
    color: #870058; 
    font-weight:bold;
}
</style>
<body style="background-color:antiquewhite;">
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
