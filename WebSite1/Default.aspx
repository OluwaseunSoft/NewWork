<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>  
    <asp:FileUpload ID="FileUpload1" runat="server" />

    <asp:Button Text="Upload" OnClick="Batch_Update" runat="server" />
        <asp:Label ID="Label1" runat="server" Visible="false" Text="Notification" ></asp:Label>
    </div>
    </form>
</body>
</html>
