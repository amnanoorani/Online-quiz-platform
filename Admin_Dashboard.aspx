<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Admin_Dashboard.aspx.cs" Inherits="QUIZGAMEUI.Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center;">
        <h2>Admin Control Panel</h2>
        <p>Welcome, Administrator. Manage your quiz application from here.</p>
        <hr />

        <div style="margin-top:20px;">
            <table align="center" cellpadding="10" style="width:100%;">
                <tr>
                    <td style="width:50%; border: 1px solid #ccc; background-color: #f9f9f9;">
                        <h3>Question Bank</h3>
                        <p>Add, edit or delete quiz questions.</p>
                        <asp:Button ID="btnAddQuestions" runat="server" Text="Manage Questions" CssClass="btn" PostBackUrl="Add_Question_Page.aspx" />
                    </td>
                    <td style="width:50%; border: 1px solid #ccc; background-color: #f9f9f9;">
                        <h3>Quiz Statistics</h3>
                        <p>View student performance and rankings.</p>
                        <asp:Button ID="btnViewStats" runat="server" Text="View Leaderboard" CssClass="btn" PostBackUrl="LeatherBoard_Page.aspx" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
