using System;

namespace QUIZGAMEUI
{
    public partial class Admin_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Security Check: If not an Admin, redirect to Login
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Login_Page.aspx");
            }
        }
    }
}
