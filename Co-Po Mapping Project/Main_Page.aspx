<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main_Page.aspx.cs" Inherits="Co_Po_Mapping_Project.Main_Page" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Page</title>
    <link href="Main_Page.css" rel="stylesheet" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />


    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        /* Container to hold sidebar and main content */
.container {
    display: flex;
    height: 100vh;
}
body{
    background-image:url("login.jpg");
    background-size:cover;

}

/* Sidebar (Dashboard) */
.sidebar {
    width: 250px;
    background: #222;
    color: white;
    padding: 20px;
    height: 100vh;
    height:550px;
}

/* Profile Section */
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

/* Sidebar Menu */
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

/* Main Content */
.content {
    flex-grow: 1;
    padding: 30px;
    background: #f5f5f5;
    width:850px;
    height:530px;
}
#main{
    text-align:center;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- HEADER SECTION -->
        <header>
            <div id="header">
                <h2>CO-PO Mapping</h2>
            </div>
            <hr />
        </header>

        <div class="container">
            <!-- DASHBOARD (Sidebar Menu) -->
            <aside class="sidebar">
                <div class="profile-section">
                    <img src="profile.png" alt="Profile" class="profile-img" />
                    <span class="profile-name">
                        <asp:Label ID="lblUsername" runat="server" Text="User"></asp:Label>
                    </span>
                </div>

                <nav class="menu">
                    <ul>
                        <li><i class="fa-solid fa-house"></i> <a href="Main_Page.aspx">Home</a></li>
                        <li><i class="fa-solid fa-file-pdf"></i> <a href="DownloadExcelFile.aspx">Download Excel File</a></li>
                        <li><i class="fa-solid fa-magnifying-glass"></i> <a href="MappingTool.aspx">Calculate CO-PO</a></li>
                        <li><i class="fa-solid fa-chart-bar"></i> <a href="Analysis_Report.aspx">Analysis & Report</a></li>
                                           
                        <li><i class="fa-solid fa-phone"></i> <a href="Contact.aspx">Contact</a></li>
                        <li><i class="fa-solid fa-right-from-bracket"></i> <a href="LoginForm.aspx">Log out</a></li>
                    </ul>
                </nav>
            </aside>

            <!-- MAIN CONTENT AREA -->
            <main class="content">
                <section>
                    <h2 id="main">Welcome to CO-PO Mapping System</h2>
                    <p>Use the dashboard to navigate and manage CO-PO Mapping efficiently.</p>
                </section>
            </main>
        </div>
    </form>
</body>
</html>
