<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login_Page.aspx.cs" Inherits="QUIZGAMEUI.Login_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2 style="text-align:center;">User Login</h2>
        <hr />
        
        <div class="form-group">
            <label>Email ID:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" placeholder="Enter Email"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
        </div>

        <div class="form-group" style="text-align:center;">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" Width="100%" OnClick="btnLogin_Click" />
        </div>

        <div style="text-align:center; margin-top:10px;">
            Don't have an account? <a href="Registration_Page.aspx">Register Here</a>
        </div>
    </div>
</asp:Content>
