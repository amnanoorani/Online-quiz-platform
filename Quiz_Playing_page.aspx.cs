using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace QUIZGAMEUI
{
    public partial class Quiz_Playing_page : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["QuizDBConn"].ConnectionString;

        // We use Properties to store the current question index and score in ViewState
        int CurrentQuestionIndex
        {
            get { return ViewState["Index"] != null ? (int)ViewState["Index"] : 0; }
            set { ViewState["Index"] = value; }
        }
        int Score
        {
            get { return ViewState["Score"] != null ? (int)ViewState["Score"] : 0; }
            set { ViewState["Score"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadQuestions();
                ShowQuestion();
            }
        }

        void LoadQuestions()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 10 * FROM Questions ORDER BY NEWID()", conn); // Get 10 random questions
                DataTable dt = new DataTable();
                da.Fill(dt);
                Session["Questions"] = dt; // Store questions in Session
            }
        }

        void ShowQuestion()
        {
            DataTable dt = (DataTable)Session["Questions"];
            if (dt != null && CurrentQuestionIndex < dt.Rows.Count)
            {
                DataRow row = dt.Rows[CurrentQuestionIndex];
                lblQuestionNum.Text = "Question " + (CurrentQuestionIndex + 1) + " of " + dt.Rows.Count;
                lblQuestionText.Text = row["QuestionText"].ToString();
                rbOptA.Text = " " + row["OptionA"].ToString();
                rbOptB.Text = " " + row["OptionB"].ToString();
                rbOptC.Text = " " + row["OptionC"].ToString();
                rbOptD.Text = " " + row["OptionD"].ToString();

                // Clear selection
                rbOptA.Checked = rbOptB.Checked = rbOptC.Checked = rbOptD.Checked = false;
            }
            else
            {
                SaveScoreAndFinish();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["Questions"];
            DataRow row = dt.Rows[CurrentQuestionIndex];
            string correct = row["CorrectOption"].ToString();
            string selected = "";

            if (rbOptA.Checked) selected = "A";
            else if (rbOptB.Checked) selected = "B";
            else if (rbOptC.Checked) selected = "C";
            else if (rbOptD.Checked) selected = "D";

            if (selected == correct) Score++;

            CurrentQuestionIndex++;
            ShowQuestion();
        }

        void SaveScoreAndFinish()
        {
            // Save to database
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Scores (UserID, ScoreValue) VALUES (@uid, @score)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@uid", Session["UserID"]);
                cmd.Parameters.AddWithValue("@score", Score);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Redirect to result page
            Session["FinalScore"] = Score;
            Response.Redirect("Result_Page.aspx");
        }
    }
}
