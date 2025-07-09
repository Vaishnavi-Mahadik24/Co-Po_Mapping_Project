<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="Co_Po_Mapping_Project.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <link href="Register.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
         <header>
             <div id="header">
                 <h2>Co-Po Mapping</h2>
             </div>
             <hr />
        </header>
        <div class="Register">
            <h1>Register Form</h1>
            <br />
            <asp:Label ID="Name" runat="server" Text="UserName"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="rfvUserName" runat="server"
                ControlToValidate="TextBox1"
                ErrorMessage="*"
                ForeColor="Red"></asp:RequiredFieldValidator>

            <br />
            <br />
            <asp:Label ID="Email" runat="server" Text="Email Id"></asp:Label><br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                ControlToValidate="TextBox2"
                ErrorMessage="*"
                ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;
            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="revEmail" runat="server"
                ControlToValidate="TextBox2"
                ErrorMessage="Invalid Email Format!"
                ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$"
                ForeColor="Red"></asp:RegularExpressionValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />

            <asp:Label ID="Depart_Name" runat="server" Text="Department Name"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="rfvDepartment" runat="server"
                ControlToValidate="TextBox3"
                ErrorMessage="*"
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Pass" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                ControlToValidate="TextBox4"
                ErrorMessage="*"
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="ConfirmPass" runat="server" Text="Confirm Password"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                ControlToValidate="TextBox5"
                ErrorMessage="*"
                ForeColor="Red"></asp:RequiredFieldValidator><br />
            <asp:CompareValidator ID="cvPasswordMatch" runat="server"
                ControlToValidate="TextBox5"
                ControlToCompare="TextBox4"
                ErrorMessage="Passwords do not match!"
                ForeColor="Red"></asp:CompareValidator>

            <br />
            <br />
            <asp:Label ID="Mobile" runat="server" Text="Mobile No"></asp:Label><br />
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
                ControlToValidate="TextBox6"
                ErrorMessage="*"
                ForeColor="Red"></asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="revMobile" runat="server"
                ControlToValidate="TextBox6"
                ErrorMessage="Enter a valid 10-digit mobile number!"
                ValidationExpression="^\d{10}$"
                ForeColor="Red"></asp:RegularExpressionValidator>
            <br />
            <br />
            <script type="text/javascript">
                function validatePasswords() {
                    var Password = document.getElementById('<%= TextBox4.ClientID %>').value;
                    var Confirm_Password = document.getElementById('<%= TextBox5.ClientID %>').value;

                    if (Password !== Confirm_Password) {
                        alert("Passwords do not match!");
                        return false;
                    }
                    return true;
                }
            </script>
            <asp:Button ID="btn_Submit" runat="server" Text="Register" OnClick="btn_Submit_Click" />
            <br />
            <br />
            <a href="LoginForm.aspx">Already register ? Sign In Here</a>
        </div>
    </form>
</body>
</html>
