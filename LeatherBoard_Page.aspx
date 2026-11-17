<%@ Page Title="Leaderboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="LeatherBoard_Page.aspx.cs" Inherits="QUIZGAMEUI.LeatherBoard_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2 style="text-align:center;">🏆 Student Rankings</h2>
        <p style="text-align:center;">Top performers based on recent quiz scores.</p>
        <hr />

        <div style="margin-top:20px;">
            <asp:GridView ID="gvLeaderboard" runat="server" CssClass="grid-view" AutoGenerateColumns="False" EmptyDataText="No records found.">
                <Columns>
                    <asp:BoundField DataField="Rank" HeaderText="Rank" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="Score" HeaderText="Score" />
                    <asp:BoundField DataField="DateTaken" HeaderText="Date Taken" DataFormatString="{0:d}" />
                </Columns>
            </asp:GridView>
        </div>

        <div style="text-align:center; margin-top:20px;">
            <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard" CssClass="btn" PostBackUrl="Start_Quiz_Game_Page.aspx" />
        </div>
    </div>
</asp:Content>
