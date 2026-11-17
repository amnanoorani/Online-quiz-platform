using System;

namespace QUIZGAMEUI
{
    public partial class Result_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FinalScore"] != null)
            {
                lblScore.Text = Session["FinalScore"].ToString() + " / 10";
            }
        }
    }
}
