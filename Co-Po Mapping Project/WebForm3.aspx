<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analysis_Report.aspx.cs" Inherits="Co_Po_Mapping_Project.Analysis_Report" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Analysis Report</title>
    <link href="Main_Page.css" rel="stylesheet" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            background: #f5f5f5;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background: #222;
            color: white;
            padding: 20px;
            height: 100vh;
        }

        .content {
            flex-grow: 1;
            padding: 30px;
            background: white;
        }

        h2 {
            text-align: center;
        }

        .report-section {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .btn {
            background: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

        .btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <aside class="sidebar">
                <h2>Navigation</h2>
                <ul>
                    <li><a href="admin_page.aspx"><i class="fa-solid fa-house"></i> Home</a></li>
                    <li><a href="UploadExcel.aspx"><i class="fa-solid fa-file-excel"></i> Upload Excel</a></li>
                    <li><a href="UserRecord.aspx"><i class="fa-solid fa-file-excel"></i> User Record</a></li>
                    <li><a href="LoginForm.aspx"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>
                </ul>
            </aside>

            <main class="content">
                <h2>Analysis Report</h2>
                <section class="report-section">
                    <asp:Label ID="lblReportStatus" runat="server" Text="Latest CO-PO Report is ready." ForeColor="Green"></asp:Label>
                    <br /><br />
                    <asp:HyperLink ID="lnkDownloadReport" runat="server" CssClass="btn" Target="_blank">Download CO-PO Report</asp:HyperLink>
                </section>
            </main>
        </div>
    </form>
</body>
</html>
