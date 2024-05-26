<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Receipt.aspx.cs" Inherits="User_Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            z-index: 1;
            position: absolute;
            top: 356px;
            right: 404px;
            width: 150px;
            height: 20px;
        }
        .auto-style2 {
            z-index: 1;
            position: absolute;
            top: 310px;
            right: 26%;
        }
        .auto-style3 {
            z-index: 1;
            position: absolute;
            top: 269px;
            right: 26%;
            width: 150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
    <asp:Label ID="lbl_des" runat="server" style="z-index: 1; position: absolute; top: 65px; left: 42%; width: 500px; height: 105px; font-size:50px; font-family:Gisha; color:royalblue; text-align:center; font-weight:bolder; margin-top: 0px;" Text="קבלה"></asp:Label>
    <asp:Label ID="lbl_Norder" runat="server" style="direction: rtl; font-family: Gisha; font-size:17px; color: #870058; font-weight:bold;" Text="" CssClass="auto-style3"></asp:Label>
    <asp:Label ID="lbl_credit" runat="server" style="direction: rtl; font-family: Gisha; font-size:17px; color: #870058; font-weight:bold;" CssClass="auto-style2"></asp:Label>
    <asp:Label ID="lbl_Amount" runat="server" style="z-index: 1; position: absolute; top: 400px; right: 405px; width: 150px; direction: rtl; font-family: Gisha; font-size:17px; color: #870058; font-weight:bold;" Text=""></asp:Label>
    <asp:Label ID="lbl_Sum" runat="server" style="direction: rtl; font-family: Gisha; font-size:17px; color: #870058; font-weight:bold;" Text="" CssClass="auto-style1"></asp:Label>
    <asp:GridView ID="grd_books" runat="server" style="z-index: 1; width: 450px; position: absolute; top: 445px; right: 25%;" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:Button ID="btnPrint" runat="server" CssClass="button" style="z-index: 1; position: absolute; top: 325px; right: 1020px; height: 65px" Text="הדפסה" OnClientClick="printW()"/>

    </form>
   
</body>
    <script>
        function printW() {
            window.print();
        }
    </script>
</html>
