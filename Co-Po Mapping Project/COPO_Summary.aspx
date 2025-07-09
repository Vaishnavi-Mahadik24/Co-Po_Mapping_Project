<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COPO_Summary.aspx.cs" Inherits="Co_Po_Mapping_Project.COPO_Summary" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CO-PO Summary</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <style>
        body {

           background-image: url('login.jpg');
            background-size: cover;
            font-family: 'Poppins', sans-serif;
        }
        .container-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
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
        th {
            background: #e0e0e0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="header-section">
                <h2>External Evaluation</h2>
            </div>
            <div class="container-box">
                <table class="table table-bordered" style="width: 100%;">
                    <thead>
                        <tr>
                            <th colspan="7">TARGET LEVEL</th>
                        </tr>
                       <tr>
                           
                           <tr>
                               <th>Level 3</th>
                               <th>70</th>
                               <th>Percentage of student to get 50% marks</th>
                           </tr>
                            <tr>
                                <th>Level 2</th>
                                <th>60</th>
                                <th>Percentage of student to get 50% marks</th>
                            </tr>
                            <tr>
                                <th>Level 1</th>
                                <th>50</th>
                                <th>Percentage of student to get 50% marks</th>
                            </tr>
                        </tr>
                        </table>
                    </thead>
                <br /><hr />
                <table class="table table-bordered" style="width: 100%;">
                    <tbody>
                        <tr>
                            <td>Course Outcome</td>
                            <td>CO1</td>
                            <td>CO2</td>
                            <td>CO3</td>
                            <td>CO4</td>
                            <td>CO5</td>
                            <td>CO6</td>
                        </tr>
                        <tr>
                            <td>Number of Students Attempted</td>
                            <td><asp:Label ID="lblCO1Attempted" runat="server" /></td>
                            <td><asp:Label ID="lblCO2Attempted" runat="server" /></td>
                            <td><asp:Label ID="lblCO3Attempted" runat="server" /></td>
                            <td><asp:Label ID="lblCO4Attempted" runat="server" /></td>
                            <td><asp:Label ID="lblCO5Attempted" runat="server" /></td>
                            <td><asp:Label ID="lblCO6Attempted" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>Number of students got more than 50</td>
                            <td><asp:Label ID="lblCO1Above50" runat="server" /></td>
                            <td><asp:Label ID="lblCO2Above50" runat="server" /></td>
                            <td><asp:Label ID="lblCO3Above50" runat="server" /></td>
                            <td><asp:Label ID="lblCO4Above50" runat="server" /></td>
                            <td><asp:Label ID="lblCO5Above50" runat="server" /></td>
                            <td><asp:Label ID="lblCO6Above50" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>Percentage of students got more than 50</td>
                            <td><asp:Label ID="lblCO1Percent" runat="server" /></td>
                            <td><asp:Label ID="lblCO2Percent" runat="server" /></td>
                            <td><asp:Label ID="lblCO3Percent" runat="server" /></td>
                            <td><asp:Label ID="lblCO4Percent" runat="server" /></td>
                            <td><asp:Label ID="lblCO5Percent" runat="server" /></td>
                            <td><asp:Label ID="lblCO6Percent" runat="server" /></td>
                        </tr>
                        <tr>
    <td>Target Level Achieved</td>
    <td><asp:Label ID="lblCO1Level" runat="server" /></td>
    <td><asp:Label ID="lblCO2Level" runat="server" /></td>
    <td><asp:Label ID="lblCO3Level" runat="server" /></td>
    <td><asp:Label ID="lblCO4Level" runat="server" /></td>
    <td><asp:Label ID="lblCO5Level" runat="server" /></td>
</tr>
<tr>
    <td>CO Attainment [External]</td>
    <td colspan="6"><asp:Label ID="lblCOAttainmentExternal" runat="server" /></td>
</tr>

    <tr>
        <td>Target Level Achieved </td>
    <td colspan="6"><asp:Label ID="lblTargetLevelAchieved" runat="server" ForeColor="Blue"></asp:Label></td>
    
</tr>
                        




                    </tbody>
                </table>
            </div>
            
        <div class="text-center mt-4">
    <asp:Button 
    ID="btnGeneratePDF" 
    runat="server" 
    Text="Generate PDF Report" 
    CssClass="btn btn-primary mx-2"  
    OnClick="btnGeneratePDF_Click" />


    <asp:Button 
        ID="Button1" 
        runat="server" 
        Text="Home" 
        CssClass="btn btn-secondary mx-2"  
        OnClick="Button1_Click" />
</div>

            </div>

            
    </form>
</body>
</html>
