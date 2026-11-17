<%@ Page Title="Quiz Result" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Result_Page.aspx.cs" Inherits="QUIZGAMEUI.Result_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center; padding: 40px;">
        <h2>Quiz Completed!</h2>
        <hr />
        
        <div style="margin: 30px 0;">
            <p style="font-size: 1.5em;">Your Final Score:</p>
            <asp:Label ID="lblScore" runat="server" Text="8 / 10" Font-Bold="true" Font-Size="XX-Large" ForeColor="#003366"></asp:Label>
        </div>

        <div style="margin: 20px 0;">
            <asp:Label ID="lblFeedback" runat="server" Text="Great job! You have a solid understanding of the topics." Font-Italic="true"></asp:Label>
        </div>

        <div style="margin-top:40px;">
            <asp:Button ID="btnTryAgain" runat="server" Text="Take Another Quiz" CssClass="btn" PostBackUrl="Start_Quiz_Game_Page.aspx" />
            <asp:Button ID="btnViewAnswers" runat="server" Text="Review Answers" CssClass="btn" style="background-color: #666; margin-left: 10px;" />
        </div>
    </div>
</asp:Content>
