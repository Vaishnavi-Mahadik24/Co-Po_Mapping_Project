<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRecord.aspx.cs" Inherits="Co_Po_Mapping_Project.UserRecords" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Records</title>
    <link href="Main_Page.css" rel="stylesheet" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        body {
            background-image: url('login.jpg');
            background-size: cover;
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
            width: 850px;
            height: 480px;
        }

        .table-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin: auto;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #222;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="header">
                <h2>User Records - CO-PO Mapping</h2>
            </div>
            <hr />
        </header>

        <div class="container">
            <aside class="sidebar">
                <div class="profile-section">
                    <img src="profile.png" alt="Profile" class="profile-img" />
                    <span class="profile-name">Admin</span>
                </div>
                <nav class="menu">
                    <ul>
                        <li><i class="fa-solid fa-house"></i> <a href="admin_page.aspx">Home</a></li>
                        <li><i class="fa-solid fa-file-excel"></i> <a href="UploadExcel.aspx">Upload Excel</a></li>
                        <li><i class="fa-solid fa-users"></i> <a href="UserRecords.aspx">User Records</a></li>
                        <li><i class="fa-solid fa-right-from-bracket"></i> <a href="LoginForm.aspx">Log out</a></li>
                    </ul>
                </nav>
            </aside>

            <main class="content">
                <section class="table-container">
                    <h2>List of Users</h2>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table">
                        <Columns>
                            
                            <asp:BoundField DataField="UserName" HeaderText="User Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Department" HeaderText="Department" />
                        </Columns>
                    </asp:GridView>
                </section>
            </main>
        </div>
    </form>
</body>
</html>
