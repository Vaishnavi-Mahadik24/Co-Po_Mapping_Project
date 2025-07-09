<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Co_Po_Mapping_Project.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--<style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 50px;
            border:solid black 2px;
        }
        .auto-style4 {
            width: 83px;
        }
        .auto-style5 {
            height: 79px;
        }
        .auto-style6 {
            height: 49px;
        }
        .auto-style7 {
            height: 79px;
            width: 453px;
        }
        .auto-style8 {
            width: 453px;
        }
        .auto-style10 {
            width: 453px;
            height: 77px;
        }
        .auto-style11 {
            height: 77px;
        }
        .auto-style13 {
            width: 95px;
        }
        .auto-style14 {
            height: 77px;
            width: 313px;
        }
    </style>-->
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <table class="auto-style1">
                <tr>
 <th colspan="5" class="has-text-centered title is-6">
 Department of Information Technology &amp; CKT College , Panvel<br>
 </th>
</tr>
<tr>
 <th colspan="5" class="has-text-centered title is-7">
  Course Outcome (CO) – Program Outcome (PO) – Program Specific Outcome (PSO) Mapping
 </th>
</tr>
<tr>
 <td colspan="1" class="auto-style6">
  Course Code
     :
     <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
 </td>
 <td colspan="1" class="auto-style6">
  Course Name&nbsp; :
     <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
 </td>
 <td contenteditable="true" class="auto-style6">
 </td>
</tr>
<tr>
 <td class="auto-style7">
  Semester
     :
         <select id="semesterselect0" class="auto-style4" name="D4">
             <option value="1">1</option>
             <option value="2">2</option>
             <option value="3">3</option>
             <option value="4">4</option>
             <option value="5">5</option>
             <option value="6">6</option>
         </select>
       </td>
 <td colspan="2" class="auto-style5">
  Branch
         <select id="branchselect" name="D2">
             <option value="Applied Electronics and Instrumentation Engineering">Software Quality assurance</option>
             <option value="Electronics and Communication Engineering">Electronics and Communication Engineering</option>
         </select></td>
 <td colspan="2" class="auto-style5">
     <p id="branchtext" class="is-hidden"></p>
     <div id="branch" name="selector" class="select is-success is-dark is-fullwidth">
         &nbsp;</div>
 </td>
</tr>
<tr>
 <td class="auto-style10">
  Credits
     :
         <select id="creditsselect0" class="auto-style13" name="D5">
             <option value="1">1</option>
             <option value="2">2</option>
             <option value="3">3</option>
             <option value="4">4</option>
             <option value="5">5</option>
             <option value="6">6</option>
         </select></td>
 <td class="auto-style14">
     <p id="ltptext" class="is-hidden">Academic Year
         <select id="academicYearselect" name="D1">
             <option value="2020 - 2021">2024 - 2025</option>
             <option value="2021 - 2022">2021 - 2022</option>
             <option value="2022 - 2023">2022 - 2023</option>
             <option value="2023 - 2024">2023 - 2024</option>
             <option value="2024 - 2025">2024 - 2025</option>
             <option value="2026 - 2027">2027 - 2028</option>
             <option value="2028 - 2029">2028 - 2029</option>
         </select></p>
     <!--<div id="ltp" name="selector" class="select is-success is-dark is-fullwidth">
         &nbsp;</div>-->
 </td>
 <!--<td class="auto-style11">
  &nbsp;</td>
 <td class="auto-style11">
     <p id="academicYeartext" class="is-hidden"></p>
     <div id="academicYear" name="selector" class="select is-success is-dark is-fullwidth">
         &nbsp;</div>
 </td>-->
</tr>
<tr>
 <td class="auto-style8">
     &nbsp;</td>
 <td colspan="4" contenteditable="true" class="has-background-success-primary">
 </td>
</tr>
<tr>
 <td colspan="3">
  Name of the Faculty&nbsp;&nbsp; <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
 </td>
 <td colspan="2" id="faculty_name" contenteditable="true" class="has-background-success-primary">
 </td>
</tr>
            </table>
            <br />
            
            <br />
            <asp:GridView ID="GridView1" runat="server" Height="206px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="615px">
            </asp:GridView>
            <br />
            
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
