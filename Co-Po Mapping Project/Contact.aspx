<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Co_Po_Mapping_Project.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        /* Page Layout */
        body {
            background-image: url('login.jpg');
            background-size: cover;
            font-family: 'Poppins', sans-serif;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
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

        /* Main Content */
        .content {
            flex-grow: 1;
            padding: 30px;
            background: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .contact-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
            max-width: 600px;
            width: 100%;
            text-align: center;
        }

        .header-section {
            background: black;
            color: white;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
        }
        
        h2 {
            font-family: 'Poppins';
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
    <div id="header">
        <h2>CO-PO Mapping</h2>
    </div>
    <hr />
</header>
        
        <div class="container">
            <!-- Sidebar -->
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
                        <li><i class="fa-solid fa-file-pdf"></i> <a href="DownloadExcelFile.aspx">Download Excel</a></li>
                        <li><i class="fa-solid fa-magnifying-glass"></i> <a href="MappingTool.aspx">Calculate CO-PO</a></li>
                        <li><i class="fa-solid fa-chart-bar"></i> <a href="Analysis_Report.aspx">Analysis & Report</a></li>
                        <li><i class="fa-solid fa-phone"></i> <a href="Contact.aspx">Contact</a></li>
                        <li><i class="fa-solid fa-right-from-bracket"></i> <a href="LoginForm.aspx">Log out</a></li>
                    </ul>
                </nav>
            </aside>

            <!-- Main Content -->
            <main class="content">
                <section class="contact-section">
                    <h2>Contact Us</h2>
                    <p>Feel free to reach out if you have any questions!</p>

                    <div class="mb-3 text-start">
                        <label class="form-label">Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                            ErrorMessage="Name is required!" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="mb-3 text-start">
                        <label class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email is required!" ForeColor="Red" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Invalid email format!" ForeColor="Red"
                            ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$" Display="Dynamic" />
                    </div>

                    <div class="mb-3 text-start">
                        <label class="form-label">Message</label>
                        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
                            ErrorMessage="Message is required!" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="text-center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-secondary mx-2" OnClick="btnBack_Click" />
                    </div>

                    <div class="mt-3 text-center">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
                    </div>
                </section>
            </main>
        </div>
    </form>
</body>
</html>
