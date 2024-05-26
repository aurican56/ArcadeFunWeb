<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="User_LogIn" %>
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
<body style="background-color:#f58f29;">
    <form id="form1" runat="server">
        <div id="navbar">
            <a href="Home.aspx">בית</a>
            <a href="GameTypes.aspx">קטלוג</a>
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
        </div>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; position: absolute; top: 125px; left: 36.5%; width: 450px; height: 50px; font-size:45px; font-family:Gisha; color:black; text-align:center; font-weight:bold;" Text="התחברות משתמש"></asp:Label>
        <asp:Panel ID="pnl_login" runat="server" style="border-radius:18px; background-color:#bad29f; z-index: 1; width: 700px; height: 350px; position: absolute; top: 200px; left: 30%;">
            <asp:Label ID="Label2" runat="server" style="font-weight:bold; font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 10%; left: 65%" Text="שם משתמש"></asp:Label>
            <asp:TextBox ID="txt_uname" runat="server" style="z-index: 1; position: absolute; top: 11%; right: 40%; width:300px;"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" style="font-weight:bold; font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 25%; left: 65%" Text="סיסמה"></asp:Label>
            <asp:TextBox ID="txt_pass" runat="server" style="z-index: 1; position: absolute; top: 26%; right: 40%; width:300px;" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btn_login" runat="server" style="z-index: 1; position: absolute; top: 60%; right: 65%; direction: ltr;" Text="התחברות" CssClass="button" OnClick="btn_login_Click" />
            <asp:Label ID="lblSucc" runat="server" style="font-weight:bold; font-size:20px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 82.5%; right: 55%;" Visible="False"></asp:Label>
            <asp:Button ID="btn_signup" runat="server" style="z-index: 1; position: absolute; top: 60%; right: 15%; width: 275px;" Text="הרשמת משתמש חדש" CssClass="button" OnClick="btn_signup_Click" />
        </asp:Panel>
            <asp:Button ID="btnBack" runat="server" style="z-index: 1; position: absolute; top: 10%; left: 10%;" Text="דף הבית" CssClass="button" OnClick="btn_Back_Click" />


    </form>
 <script>
     window.addEventListener("beforeunload", function() {SetSession(document.getElementById("text_uname").textContent)});
     // When the user scrolls the page, execute myFunction
     window.onscroll = function () { sticksNavBar() };

     // Get the navbar
     var navbar = document.getElementById("navbar");

     // Get the offset position of the navbar
     var sticky = navbar.offsetTop;


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
     const beforeUnloadHandler = (event) => {
         //SetSession(document.getElementById("text_uname").textContent);
         // Recommended
         event.preventDefault();
         
     };


     function SetSession(x){
         sessionStorage.setItem("UserName", x);
     }
 </script>
</body>
</html>
