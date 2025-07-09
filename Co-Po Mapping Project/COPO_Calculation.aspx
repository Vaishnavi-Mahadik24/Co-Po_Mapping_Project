<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COPO_Calculation.aspx.cs" Inherits="Co_Po_Mapping_Project.COPO_Calculation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CO-PO Mapping Tool</title>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="header-section">
                <h2>CO-PO Mapping</h2>
            </div>

            <div class="container-box">
    <h4 class="text-center">Upload Student Marks Excel File</h4>
    <div class="row">
        <div class="col-md-8">
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
        </div>
        <div class="col-md-4">
            <asp:Button ID="btnUpload" runat="server" Text="Upload & Process" CssClass="btn btn-primary" OnClick="btnUpload_Click" />
        </div>
    </div>

    <!-- Fix: Add lblMessage -->
    <br />
    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
</div>


                <table class="table table-bordered mt-3">
                    <thead>
                        <tr>
                            <th rowspan="2">Seat Number</th>
                            <th colspan="5">External Marks (Max: 12)</th>
                            <th colspan="2">Internal Marks (Max: 20)</th>
                        </tr>
                        <tr>
                            <th>CO1</th>
                            <th>CO2</th>
                            <th>CO3</th>
                            <th>CO4</th>
                            <th>CO5</th>
                            <th>CO1</th>
                            <th>CO2</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptCoPoScores" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("SeatNumber") %></td>
                                    <td><%# Eval("External_CO1") %></td>
                                    <td><%# Eval("External_CO2") %></td>
                                    <td><%# Eval("External_CO3") %></td>
                                    <td><%# Eval("External_CO4") %></td>
                                    <td><%# Eval("External_CO5") %></td>
                                    <td><%# Eval("Internal_CO1") %></td>
                                    <td><%# Eval("Internal_CO2") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <div class="text-center mt-3">
                <asp:Button ID="btnShowSummary" runat="server" Text="Show Detailed Summary" CssClass="btn btn-success mt-3" OnClick="btnShowSummary_Click" />
            </div>
        </div>
    </form>
</body>
</html>
