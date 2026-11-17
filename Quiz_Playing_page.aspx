<%@ Page Title="Play Quiz" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Quiz_Playing_page.aspx.cs" Inherits="QUIZGAMEUI.Quiz_Playing_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .option-item { margin: 10px 0; padding: 10px; border: 1px solid #ccc; background-color: #f9f9f9; cursor: pointer; }
        .option-item:hover { background-color: #eef; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: #f0f4f8; padding: 20px; border-radius: 5px;">
        <div style="display:flex; justify-content: space-between; margin-bottom: 20px;">
            <asp:Label ID="lblQuestionNum" runat="server" Text="Question 1 of 10" Font-Bold="true"></asp:Label>
            <asp:Label ID="lblTimer" runat="server" Text="Time Left: 00:30" ForeColor="Red" Font-Bold="true"></asp:Label>
        </div>

        <div style="font-size: 1.2em; margin-bottom: 20px;">
            <asp:Label ID="lblQuestionText" runat="server" Text="What is the main advantage of using a Master Page in ASP.NET?"></asp:Label>
        </div>

        <div class="options-container">
            <div class="option-item">
                <asp:RadioButton ID="rbOptA" runat="server" GroupName="quizOptions" Text=" Faster database connection" />
            </div>
            <div class="option-item">
                <asp:RadioButton ID="rbOptB" runat="server" GroupName="quizOptions" Text=" Consistent look and feel across pages" />
            </div>
            <div class="option-item">
                <asp:RadioButton ID="rbOptC" runat="server" GroupName="quizOptions" Text=" It replaces the need for CSS" />
            </div>
            <div class="option-item">
                <asp:RadioButton ID="rbOptD" runat="server" GroupName="quizOptions" Text=" It is required for SQL Server" />
            </div>
        </div>

        <div style="text-align:right; margin-top:20px;">
            <asp:Button ID="btnNext" runat="server" Text="Next Question &rarr;" CssClass="btn" OnClick="btnNext_Click" />

        </div>
    </div>
</asp:Content>
