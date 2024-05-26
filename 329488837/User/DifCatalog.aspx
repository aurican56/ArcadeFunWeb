<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DifCatalog.aspx.cs" Inherits="User_DifCatalog" %>

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

<body  style="background-color: lightgrey">
    <link href="../Styles/NavBar.css" rel="stylesheet" />
    <form id="form1" runat="server">
    <div id="navbar">
            <a href="Home.aspx">בית</a>
            <a href="GameTypes.aspx">קטלוג ראשי</a>
        
            <a class="active" href="DifCatalog.aspx">קטלוג משני</a>
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
        <asp:Label ID="lbl_Head" runat="server" style="z-index: 1; position: absolute; top: 10%; left: 48%; font-size:40px; font-family:Gisha; color:black; text-align:center;" Text="קטלוג 2"></asp:Label>
        <asp:Button ID="btnBack" runat="server" style="z-index: 1; position: absolute; top: 10%; right: 10%;" Text="דף הבית" CssClass="button" OnClick="btn_Back_Click" />


    <asp:GridView ID="grd_games" runat="server" style="z-index: 1; width: 450px; position: absolute; top: 250px; right: 2.5%" OnRowCommand="grd_games_RowCommand">
        <Columns>
            <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="button" CommandName="Select" HeaderText="בחירה" ShowHeader="True" Text="בחר" />
            <asp:TemplateField HeaderText="Picture">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("gameImg","{0}")%>' Style="position: static; width:125px; height:200px;" />
                </ItemTemplate>
                    <ItemStyle/>
            </asp:TemplateField>
  </Columns> 
        </asp:GridView>
    <asp:Panel ID="pnl_game" runat="server" style="border-radius:18px; border-color:#000; border-style:double; z-index: 1; width: 750px; height: 700px; position: absolute; top: 150px; left: 2%;" Visible="false">
        <asp:Image ID="GameImg" runat="server" style="z-index: 1; position: absolute; top: 75px; left: 35px; max-width: 500px; max-height: 400px;" />
        <asp:Label ID="Label1" runat="server" style="z-index: 1; position: absolute; top: 80px; right: 35px; direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Text="קוד משחק"></asp:Label>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; position: absolute; top: 210px; right: 35px;  direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Text="שם המשחק"></asp:Label>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; position: absolute; top: 340px; right: 35px;  direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Text="מחיר "></asp:Label>
        <asp:Label ID="Label4" runat="server" style="z-index: 1; position: absolute; top: 470px; right: 35px;  direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Text="סוג המשחק"></asp:Label>       
        <asp:TextBox ID="txtGameCode" runat="server" style="z-index: 1; position: absolute; top: 125px; right: 75px; width: 125px; height: 31px" Enabled="False"></asp:TextBox>
        <asp:TextBox ID="txtGameName" runat="server" style="z-index: 1; position: absolute; top: 255px; right: 75px; width: 125px; height: 30px" Enabled="False"></asp:TextBox>
        <asp:TextBox ID="txtPrice" runat="server" style="z-index: 1; position: absolute; top: 385px; right: 75px; width: 125px; height: 31px" Enabled="False"></asp:TextBox>
        <asp:TextBox ID="txtgameType" runat="server" style="z-index: 1; position: absolute; top: 515px; right: 75px; width: 125px; height: 31px" Enabled="False"></asp:TextBox>
        <asp:Button ID="btnAdd" runat="server" CssClass="button" style="z-index: 1; position: absolute; top: 575px; left: 280px; height: 65px;" Text="הוספה לסל" OnClick="btnAdd_Click" />
        <asp:Button ID="btnEnd" runat="server" CssClass="button" style="z-index: 1; position: absolute; top: 575px; left: 70px; height: 65px" Text="סיום הזמנה" OnClick="btnEnd_Click"/>
        <asp:Label ID="lbl_succ" runat="server" style="z-index: 1; position: absolute; top: 660px; left: 165px; direction: rtl; font-family: Gisha; color: #870058; font-weight:bold;" Visible="false"></asp:Label>
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
