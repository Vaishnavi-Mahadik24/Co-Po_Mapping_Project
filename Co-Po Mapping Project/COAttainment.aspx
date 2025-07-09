<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COAttainment.aspx.cs" Inherits="Co_Po_Mapping_Project.COAttainment" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>CO Attainment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .table-container {
            width: 60%;
            margin: auto;
            margin-top: 30px;
            font-size: 18px;
        }
        .table {
            border: 2px solid black;
            text-align: center;
        }
        .highlight {
            background-color: yellow;
            font-weight: bold;
        }
        .green-highlight {
            background-color: lightgreen;
            font-weight: bold;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="table-container">
            <h3 class="text-center">CO Attainment By Direct Method</h3>
            <table class="table table-bordered">
                <tr>
                    <th></th>
                    <th>External</th>
                    <th>Internal</th>
                </tr>
                <tr>
                    <td>CO Att.</td>
                    <td><asp:Label ID="lblCOAttExternal" runat="server" Text="1.6667"></asp:Label></td>
                    <td><asp:Label ID="lblCOAttInternal" runat="server" Text="3"></asp:Label></td>
                </tr>
                <tr>
                    <td>Weight</td>
                    <td><asp:Label ID="lblWeightExternal" runat="server" Text="60%"></asp:Label></td>
                    <td><asp:Label ID="lblWeightInternal" runat="server" Text="40%"></asp:Label></td>
                </tr>
                <tr>
                    <td>% of Att.</td>
                    <td><asp:Label ID="lblPercentExternal" runat="server" Text="1"></asp:Label></td>
                    <td><asp:Label ID="lblPercentInternal" runat="server" Text="1.2"></asp:Label></td>
                </tr>
                <tr>
                    <td>Final CO Attainment</td>
                    <td colspan="2"><asp:Label ID="lblFinalCOAttainment" runat="server" CssClass="highlight" Text="2.2"></asp:Label></td>
                </tr>
                <tr>
                    <td>Target Level</td>
                    <td colspan="2"><asp:Label ID="lblTargetLevel" runat="server" CssClass="highlight" Text="2"></asp:Label></td>
                </tr>
                <tr>
                    <td>Achievement of Target CO</td>
                    <td colspan="2"><asp:Label ID="lblAchievement" runat="server" CssClass="green-highlight" Text="Target Achieved"></asp:Label></td>
                </tr>
            </table>

            <div class="footer">
                <p>Course Teacher | Head Of the Department | Principal</p>
            </div>

           
        </div>
    </form>
</body>
</html>
