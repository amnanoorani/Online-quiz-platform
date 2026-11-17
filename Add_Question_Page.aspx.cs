using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace QUIZGAMEUI
{
    public partial class Add_Question_Page : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["QuizDBConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Security Check
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Login_Page.aspx");
            }

            if (!IsPostBack)
            {
                BindGridView();
            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO Questions (QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectOption) " +
                                   "VALUES (@q, @a, @b, @c, @d, @corr)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@q", txtQuestion.Text);
                    cmd.Parameters.AddWithValue("@a", txtOptA.Text);
                    cmd.Parameters.AddWithValue("@b", txtOptB.Text);
                    cmd.Parameters.AddWithValue("@c", txtOptC.Text);
                    cmd.Parameters.AddWithValue("@d", txtOptD.Text);
                    cmd.Parameters.AddWithValue("@corr", ddlCorrect.SelectedValue);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    // Clear fields
                    txtQuestion.Text = txtOptA.Text = txtOptB.Text = txtOptC.Text = txtOptD.Text = "";
                    ddlCorrect.SelectedIndex = 0;

                    BindGridView(); // Refresh the list
                    Response.Write("<script>alert('Question Added Successfully!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        // This is the GridView method from Lecture 7
        void BindGridView()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Questions", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvQuestions.DataSource = dt;
                gvQuestions.DataBind();
            }
        }
    }
}
