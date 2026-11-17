<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Registration_Page.aspx.cs" Inherits="QUIZGAMEUI.Registration_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2 style="text-align:center;">Create New Account</h2>
        <hr />

        <div class="form-group">
            <label>Full Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="textbox" placeholder="Enter Full Name"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label>Email ID:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" placeholder="Enter Email"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" TextMode="Password" placeholder="Create Password"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Confirm Password:</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="textbox" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
        </div>

        <div class="form-group" style="text-align:center;">
            <asp:Button ID="btnRegister" runat="server" Text="Register Now" CssClass="btn" Width="100%" OnClick="btnRegister_Click" />
        </div>

        <div style="text-align:center; margin-top:10px;">
            Already have an account? <a href="Login_Page.aspx">Login Here</a>
        </div>
    </div>
</asp:Content>
