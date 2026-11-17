using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace QUIZGAMEUI
{
    public partial class Login_Page : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["QuizDBConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT UserID, FullName, UserRole FROM Users WHERE Email = @Email AND Password = @Pass";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Pass", txtPassword.Text);

                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        // Store user info in Session
                        Session["UserID"] = dr["UserID"].ToString();
                        Session["UserName"] = dr["FullName"].ToString();
                        Session["UserRole"] = dr["UserRole"].ToString();
                        string role = dr["UserRole"].ToString();

                        if (role == "Admin")
                        {
                            Response.Redirect("Admin_Dashboard.aspx");
                        }
                        else
                        {
                            Response.Redirect("Start_Quiz_Game_Page.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Email or Password!');</script>");
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
