<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Co_Po_Mapping_Project.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <link href="Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="header">
                <h2>Co-Po Mapping</h2>
            </div>
            <hr />
        </header>
        <div class="login">
             <h1>LOGIN  </h1>
             <br />
             <asp:Label ID="Name1" runat="server"  Text="UserName"></asp:Label>
             <br />
     
         
             <asp:TextBox ID="TextBox1" runat="server" class="loginInput" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfvUserName" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="*" 
                ForeColor="Red"></asp:RequiredFieldValidator>
             <br />
             
             <br />
             
             <br />
             <asp:Label ID="Pass" runat="server" Text="Password"></asp:Label>
             <br />
             <asp:TextBox ID="TextBox3" runat="server" class="loginInput" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="*" 
                ForeColor="Red"></asp:RequiredFieldValidator>
             <br /><br />
               <a href="ForgotPassword.aspx">Forgot Password ??</a>
               <br />
             <br />
            
             <asp:Button ID="Button" runat="server" Text="Log In" OnClick="Button_Click" />
                &nbsp;<br />
             <br />
             <br />
            <a href="RegistrationForm.aspx">Don't Have account ? Sign Up here</a>
        </div>
        
    </form>
    <script type="text/javascript">
    window.history.forward();
    function preventBack() {
        window.history.forward();
    }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
</script>

</body>
</html>