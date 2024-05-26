<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewGame.aspx.cs" Inherits="Admin_NewPackage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title><style>
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
                       .auto-style1 {
                           border-style: none;
                           border-color: inherit;
                           border-width: medium;
                           padding: 15px 25px;
                           font-size: 24px;
                           text-align: center;
                           cursor: pointer;
                           outline: none;
                           color: #fff;
                           border-radius: 50px;
                           box-shadow: 0 5px #999;
                           width: 266px;
                           font-family: Gisha;
                           font-weight: bold;
                           transition: all 0.5s;
                           z-index: 1;
                           position: absolute;
                           top: 670px;
                           right: 1178px;
                       }
                   </style>
</head>
<body style="background-color:lightgoldenrodyellow;">
    <form id="form1" runat="server">
        <asp:Label ID="lbl_head" runat="server" style="z-index: 1; position: absolute; top: 100px; left: 36%; width: 580px; height: 65px; font-size:50px; font-family:Gisha; color:royalblue; text-align:center; font-weight:bold;" Text="הוספת משחק וסוגי משחק"></asp:Label>
        <asp:Label ID="lblGname" runat="server" style="font-size:30px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 210px; right: 260px;" Text="שם משחק"></asp:Label>
        <asp:TextBox ID="txtGname" runat="server" style="z-index: 1; position: absolute; top: 210px; right: 445px; width:300px; font-size:30px;"></asp:TextBox>
        <asp:Label ID="lblPrice" runat="server" style="font-size:30px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 265px; right: 260px" Text="מחיר משחק"></asp:Label>
        <asp:TextBox ID="txtPrice" runat="server" style="z-index: 1; position: absolute; top: 265px; right: 445px; width:300px; font-size:30px;" TextMode="Number"></asp:TextBox>
        <asp:Label ID="lblGamefile" runat="server" style="font-size:30px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 320px; right: 260px" Text="קובץ משחק"></asp:Label>
        <asp:TextBox ID="txtfileName" runat="server" style="z-index: 1; position: absolute; top: 320px; right: 795px; width:225px; font-size:30px;"></asp:TextBox>
        <asp:Label ID="lblAdress" runat="server" style="font-size:30px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 375px; right: 260px" Text="לוגו משחק"></asp:Label>
        <asp:TextBox ID="txt_imgName" runat="server" style="z-index: 1; position: absolute; top: 375px; right: 795px; width:225px; font-size:30px;"></asp:TextBox>
        <asp:Button ID="btn_Insert" runat="server" style="font-size:30px; " Text="להורדת המדריך" CssClass="auto-style1" OnClick="btn_Insert_Click1"  />
        <asp:FileUpload ID="GameFileUpload" runat="server" style="z-index: 1; right: 445px; top: 320px; position: absolute; height:30px;"/>
        <asp:Button ID="btn_Back" runat="server" style="font-size:30px; width:215px; z-index: 1; position: absolute; top: 70px; right: 80%; height: 64px;" Text="דף בית" CssClass="button" OnClick="btn_Back_Click" />
        <asp:FileUpload ID="ImageFileUpload" runat="server" style="z-index: 1; right: 445px; top: 375px; position: absolute; height:30px;"/>
        <asp:Label ID="lblGameType" runat="server" style="font-size:30px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 430px; right: 260px" Text="סוג משחק"></asp:Label>
        <asp:DropDownList ID="ddlGameTypes" runat="server" style="z-index: 1; position: absolute; top: 430px; right: 445px; font-size:28px; width:270px; direction:rtl;" DataSourceID="SqlDataSource1" DataTextField="gameTypeName" DataValueField="GameTypeID" >
        </asp:DropDownList>
        <asp:Button ID="btnInsert" runat="server" style="font-size:30px; width:250px; z-index: 1; position: absolute; top: 586px; right: 471px" Text="הוספת משחק" CssClass="button" OnClick="btn_Insert_Click" />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString6 %>" ProviderName="<%$ ConnectionStrings:ConnectionString6.ProviderName %>" SelectCommand="SELECT [GameTypeID], [gameTypeName] FROM [tblGameType]"></asp:SqlDataSource>
        <asp:Label ID="lblDesc" runat="server" style="font-size:30px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 485px; right: 260px" Text="תיאור משחק"></asp:Label>
        <asp:TextBox ID="txtDesc" runat="server" style="z-index: 1; position: absolute; top: 485px; width:415px; font-size:30px; right: 445px;" TextMode="MultiLine"></asp:TextBox>
        <asp:Label ID="lblSucc" runat="server" style="font-weight:bold; font-size:30px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 201px; right: 975px;" Text="המשחק נוסף בהצלחה" Visible="False"></asp:Label>
        <asp:Label ID="lblAGameType" runat="server" style="font-size:30px; font-family:Gisha; color:#870058; z-index: 1; position: absolute; top: 330px; left: 440px" Text="שם סוג המשחק"></asp:Label>
        <asp:TextBox ID="txtGameType" runat="server" style="z-index: 1; position: absolute; top: 330px; width:300px; font-size:30px; left: 115px;"></asp:TextBox>
        <asp:Button ID="btnInsertType" runat="server" style="font-size:30px; width:315px; z-index: 1; position: absolute; top: 445px; left: 200px" Text="הוספת סוג משחק" CssClass="button" OnClick="btnInsertType_Click"/>
        <asp:Label ID="lblNotice" runat="server" style="font-weight:bold; font-size:30px; font-family:Gisha; direction:rtl; color:#870058; z-index: 1; position: absolute; top: 550px; right: 975px; width:650px;" Text="לתשומת לב המנהלים, כדי להעלות קובץ משחק עליכם להכניס את כל קבציו לארכיון .zip ולהעלות את הארכיון, לרשותכם מדריך"></asp:Label>

        

    </form>
</body>
</html>
