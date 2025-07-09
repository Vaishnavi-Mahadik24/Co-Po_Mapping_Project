<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MappingTool.aspx.cs" Inherits="Co_Po_Mapping_Project.MappingTool" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CO-PO Mapping Tool</title>

    <!-- Bootstrap for UI Enhancement -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

    <style>
        body {
            background-image: url('login.jpg');
            background-size: cover;
            font-family: 'Poppins', sans-serif;
        }

        .container-box {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid black;
            text-align: center;
        }

        .header-section {
            background: black;
            color: white;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
        }

        .dropdown-select {
            width: 100%;
            padding: 5px;
            border-radius: 5px;
        }

        .highlight {
            background-color: yellow !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="header-section">
                <h2>CO-PO Mapping</h2>
            </div>

            <div class="container-box">
                <table class="table table-bordered">
    <tr>
        <th colspan="3">Department</th>
        <td colspan="5">
            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="dropdown-select">
                <asp:ListItem Text="Information Technology" Value="IT"></asp:ListItem>
                <asp:ListItem Text="Computer Science" Value="CS"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvDepartment" runat="server" ControlToValidate="ddlDepartment"
                InitialValue="" ErrorMessage="Department is required." ForeColor="Red" Display="Dynamic" />
        </td>
        <th colspan="2">Semester No</th>
        <td colspan="2">
            <asp:TextBox ID="txtSemester" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvSemester" runat="server" ControlToValidate="txtSemester"
                ErrorMessage="Semester No is required." ForeColor="Red" Display="Dynamic" />
        </td>
        <th colspan="2">Threshold Value [External]</th>
        <td colspan="1" class="highlight">
            <asp:TextBox ID="txtThresholdExternal" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvThresholdExternal" runat="server" ControlToValidate="txtThresholdExternal"
                ErrorMessage="External threshold is required." ForeColor="Red" Display="Dynamic" />
        </td>
    </tr>

    <tr>
        <th colspan="3">Teacher Name</th>
        <td colspan="5">
            <asp:TextBox ID="txtTeacherName" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTeacherName" runat="server" ControlToValidate="txtTeacherName"
                ErrorMessage="Teacher Name is required." ForeColor="Red" Display="Dynamic" />
        </td>
        <th colspan="2">Course Code</th>
        <td colspan="2">
            <asp:TextBox ID="txtCourseCode" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCourseCode" runat="server" ControlToValidate="txtCourseCode"
                ErrorMessage="Course Code is required." ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator 
    ID="revCourseCode" 
    runat="server" 
    ControlToValidate="txtCourseCode"
    ErrorMessage="Course Code must be exactly 7 characters, containing only uppercase letters and numbers." 
    ValidationExpression="^[A-Z0-9]{7}$" 
    ForeColor="Red" 
    Display="Dynamic" />

        </td>
        <th colspan="2">Threshold Value [Internal]</th>
        <td colspan="1" class="highlight">
            <asp:TextBox ID="txtThresholdInternal" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvThresholdInternal" runat="server" ControlToValidate="txtThresholdInternal"
                ErrorMessage="Internal threshold is required." ForeColor="Red" Display="Dynamic" />
        </td>
    </tr>

    <tr>
        <th colspan="3">Course Name</th>
        <td colspan="5">
            <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCourseName" runat="server" ControlToValidate="txtCourseName"
                ErrorMessage="Course Name is required." ForeColor="Red" Display="Dynamic" />
        </td>
        <th colspan="2">Class</th>
        <td colspan="2">
            <asp:TextBox ID="txtClass" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvClass" runat="server" ControlToValidate="txtClass"
                ErrorMessage="Class is required." ForeColor="Red" Display="Dynamic" />
        </td>
        <th colspan="2">Year</th>
        <td colspan="1" class="highlight">
            <asp:TextBox ID="txtYear" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="txtYear"
                ErrorMessage="Year is required." ForeColor="Red" Display="Dynamic" />
        </td>
    </tr>
</table>


                

            <div class="container-box">
                <h4 class="text-center mt-4">Course Outcomes (COs)</h4>
                <table class="table table-bordered">
                    <tr>
                        <th>CO#</th>
                        <th>Course Outcome Description</th>
                    </tr>
                    <tr>
                        <th>CO1</th>
                        <td>
                            <asp:TextBox ID="txtCO1" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCO1" runat="server" ControlToValidate="txtCO1"
                                ErrorMessage="CO1 is required." ForeColor="Red" Display="Dynamic" />
                            
                        </td>
                    </tr>
                    <tr>
                        <th>CO2</th>
                        <td>
                            <asp:TextBox ID="txtCO2" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCO2" runat="server" ControlToValidate="txtCO2"
                                ErrorMessage="CO2 is required." ForeColor="Red" Display="Dynamic" />
                            
                        </td>
                    </tr>
                    <tr>
                        <th>CO3</th>
                        <td>
                            <asp:TextBox ID="txtCO3" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCO3" runat="server" ControlToValidate="txtCO3"
                                ErrorMessage="CO3 is required." ForeColor="Red" Display="Dynamic" />
                           
                        </td>
                    </tr>
                    <tr>
                        <th>CO4</th>
                        <td>
                            <asp:TextBox ID="txtCO4" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCO4" runat="server" ControlToValidate="txtCO4"
                                ErrorMessage="CO4 is required." ForeColor="Red" Display="Dynamic" />
                            
                        </td>
                    </tr>
                    <tr>
                        <th>CO5</th>
                        <td>
                            <asp:TextBox ID="txtCO5" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th>CO6</th>
                        <td>
                            <asp:TextBox ID="txtCO6" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                </table>

                <div class="text-center mt-3">
                    <asp:Button ID="btnGoToNextPage" runat="server" Text="Go to Next Page" CssClass="btn btn-success" OnClick="btnGoToNextPage_Click" />
                    <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btn btn-secondary" OnClick="btnGoToHome_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>

