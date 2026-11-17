using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace QUIZGAMEUI
{
    public partial class LeatherBoard_Page : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["QuizDBConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindLeaderboard();
            }
        }

        void BindLeaderboard()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // We join Users and Scores table to show the Name instead of just UserID
                string query = "SELECT ROW_NUMBER() OVER (ORDER BY s.ScoreValue DESC) AS Rank, " +
                               "u.FullName AS StudentName, s.ScoreValue AS Score, s.DateTaken " +
                               "FROM Scores s JOIN Users u ON s.UserID = u.UserID " +
                               "ORDER BY s.ScoreValue DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvLeaderboard.DataSource = dt;
                gvLeaderboard.DataBind();
            }
        }
    }
}
