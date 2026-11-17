using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace QUIZGAMEUI
{
    public partial class Registration_Page : System.Web.UI.Page
    {
        // Get connection string from Web.config
        string connStr = ConfigurationManager.ConnectionStrings["QuizDBConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO Users (FullName, Email, Password, UserRole) VALUES (@Name, @Email, @Pass, @Role)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Pass", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@Role", "Student"); // Default role

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Write("<script>alert('Registration Successful! Please Login.'); window.location='Login_Page.aspx';</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
