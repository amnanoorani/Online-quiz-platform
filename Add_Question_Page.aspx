<%@ Page Title="Add Question" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Add_Question_Page.aspx.cs" Inherits="QUIZGAMEUI.Add_Question_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>Add New Question</h2>
        <hr />

        <div class="form-group">
            <label>Question Text:</label>
            <asp:TextBox ID="txtQuestion" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="3"></asp:TextBox>
        </div>

        <table style="width:100%;" cellpadding="5">
            <tr>
                <td>Option A: <asp:TextBox ID="txtOptA" runat="server" CssClass="textbox"></asp:TextBox></td>
                <td>Option B: <asp:TextBox ID="txtOptB" runat="server" CssClass="textbox"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Option C: <asp:TextBox ID="txtOptC" runat="server" CssClass="textbox"></asp:TextBox></td>
                <td>Option D: <asp:TextBox ID="txtOptD" runat="server" CssClass="textbox"></asp:TextBox></td>
            </tr>
        </table>

        <div class="form-group" style="margin-top:15px;">
            <label>Correct Answer:</label>
            <asp:DropDownList ID="ddlCorrect" runat="server" CssClass="textbox">
                <asp:ListItem Text="-- Select Correct Option --" Value="0"></asp:ListItem>
                <asp:ListItem Text="Option A" Value="A"></asp:ListItem>
                <asp:ListItem Text="Option B" Value="B"></asp:ListItem>
                <asp:ListItem Text="Option C" Value="C"></asp:ListItem>
                <asp:ListItem Text="Option D" Value="D"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group" style="text-align:center;">
            <asp:Button ID="btnAdd" runat="server" Text="Save Question" CssClass="btn" OnClick="btnAdd_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear Form" CssClass="btn" style="background-color: #666;" />
        </div>

        <hr />
        <h3>Recently Added Questions</h3>
        <asp:GridView ID="gvQuestions" runat="server" CssClass="grid-view" AutoGenerateColumns="true">
        </asp:GridView>
    </div>
</asp:Content>
