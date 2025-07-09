<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Co_Po_Mapping_Project.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <link href="Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="header">
                <h2>Co-Po Mapping - Reset Password</h2>
            </div>
            <hr />
        </header>
        <div class="login">
            <h1>Forgot Password</h1>
            <br />
            <asp:Label ID="lblEmail" runat="server" Text="Enter your registered email:"></asp:Label>
            <br />
            <asp:TextBox ID="txtEmail" runat="server" class="loginInput"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="* Required" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br /><br />
            <asp:Button ID="btnReset" runat="server" Text="Reset Password" OnClick="btnReset_Click" />
            <br /><br />
            <a href="LoginForm.aspx">Back to Login</a>
        </div>
    </form>
</body>
</html>
