<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analysis_Report.aspx.cs" Inherits="Co_Po_Mapping_Project.Analysis_Report" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Analysis Reports</title>
    <link href="Main_Page.css" rel="stylesheet" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            background-image: url("login.jpg");
            background-size: cover;
            font-family: 'Poppins', sans-serif;
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

        .profile-section {
            text-align: center;
            padding-bottom: 20px;
            border-bottom: 1px solid white;
        }

        .profile-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
        }

        .profile-name {
            display: block;
            margin-top: 10px;
            font-size: 18px;
        }

        .menu ul {
            list-style: none;
            padding: 0;
        }

        .menu ul li {
            padding: 12px;
            margin: 10px 0;
            display: flex;
            align-items: center;
        }

        .menu ul li i {
            margin-right: 10px;
        }

        .menu ul li a {
            color: white;
            text-decoration: none;
        }

        .content {
            flex-grow: 1;
            padding: 30px;
            background: #f5f5f5;
            width:850px;
        }

        #main {
            text-align: center;
        }

        .report-list {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
            margin-top: 20px;
            text-align: left;
        }

        .report-item {
            margin: 10px 0;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <header>
            <div id="header">
                <h2>CO-PO Analysis Reports</h2>
            </div>
            <hr />
        </header>

        <div class="container">
            <!-- Sidebar Menu -->
            <aside class="sidebar">
                <div class="profile-section">
                    <img src="profile.png" alt="Profile" class="profile-img" />
                    <span class="profile-name">User</span>
                </div>

                <nav class="menu">
                    <ul>
                        <li><i class="fa-solid fa-house"></i> <a href="Main_Page.aspx">Home</a></li>
                        <li><i class="fa-solid fa-file-pdf"></i> <a href="DownloadExcelFile.aspx">Download Excel</a></li>
                        <li><i class="fa-solid fa-magnifying-glass"></i> <a href="MappingTool.aspx">Calulate CO-PO</a></li>
                        <li><i class="fa-solid fa-chart-bar"></i> <a href="Analaysis_Report.aspx">Analysis & Report</a></li>
                        <li><i class="fa-solid fa-phone"></i> <a href="Contact.aspx">Contact</a></li>
                        <li><i class="fa-solid fa-right-from-bracket"></i> <a href="LoginForm.aspx">Log out</a></li>
                    </ul>
                </nav>
            </aside>

            <!-- Main Content Area -->
            <main class="content">
                 <div>
            <h2>Generated Report</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <iframe id="pdfViewer" runat="server" width="100%" height="600px"></iframe>
        </div>
            </main>
        </div>
    </form>
</body>
</html>
