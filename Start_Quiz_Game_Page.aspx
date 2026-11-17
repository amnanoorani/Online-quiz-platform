<%@ Page Title="Start Quiz" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Start_Quiz_Game_Page.aspx.cs" Inherits="QUIZGAMEUI.Start_Quiz_Game_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center;">
        <h2>Welcome to Quiz Master Pro</h2>
        <p>Test your knowledge and compete with others.</p>
        <hr />

        <div style="margin: 40px auto; max-width: 600px; text-align: left; background-color: #f9f9f9; padding: 20px; border: 1px solid #ccc;">
            <h3>Instructions:</h3>
            <ul>
                <li>There are 10 questions in total.</li>
                <li>Each question has a time limit of 30 seconds.</li>
                <li>You cannot go back to the previous question.</li>
                <li>Your final score will be displayed at the end.</li>
            </ul>
        </div>

        <div style="margin-top:20px;">
            <asp:Button ID="btnStart" runat="server" Text="START QUIZ NOW" CssClass="btn" Font-Size="Large" Padding="15px 40px" PostBackUrl="Quiz_Playing_page.aspx" />
        </div>
    </div>
</asp:Content>
