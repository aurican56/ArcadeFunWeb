<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Library.aspx.cs" Inherits="User_Library" %>

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
  border-radius: 30px;
  box-shadow: 0 5px #999;
  width:140px;
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
    border-radius:8px; 
    border-color:#0cabf0; 
    border-style:double; 
    z-index: 1; 
    width: 475px; 
    height: 200px;
    position: absolute;
}
.lbl{
    z-index: 1;
    position: absolute;
    left: 245px;
    font-family: Gisha; 
    color: #870058; 
    font-weight:bold;
}
.txt{
    z-index: 1; 
    position: absolute; 
    left: 175px; 
    width: 150px; 
    height: 25px;
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
    top: 15px; 
    left: 15px; 
    max-width: 225px; 
    max-height: 175px;
}
</style>
</head>
<body style="background-color:beige">    
    <link href="../Styles/NavBar.css" rel="stylesheet" />
    <div id="navbar">
            <a href="Home.aspx">בית</a>
            <a href="GameTypes.aspx">קטלוג</a>
        
            <a href="DifCatalog.aspx">קטלוג משני</a>
            <a  href="Comments.aspx">צור קשר</a>
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
            <a class="active" href="Library.aspx">ספרייה</a>
            <a href="Cart.aspx">עגלה</a>
        </div>
    <form id="form1" runat="server">
        <asp:Label ID="lbl_hello" runat="server" style="z-index: 0; position: absolute; top: 10vmax; left: 14vmax; width: 14vmax; height: 6vmax; font-size:3vmax; font-family:Gisha; color:black; text-align:center;" Text="שלום אורח"></asp:Label>
        <iframe runat="server" id="game" style="width: 950px; height:800px; border:hidden;"></iframe>

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
