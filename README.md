# Quiz Master Pro

Quiz Master Pro is an online quiz web application built with ASP.NET Web Forms and SQL Server. Students can register, log in and take a 10-question quiz, and then see their score and their position on the leaderboard. An admin can log in to add new questions to the question bank.

I made this project to practice ASP.NET Web Forms, Master Pages, session handling and working with a SQL Server database using ADO.NET.

## Tech Stack

| Part | Technology |
|------|------------|
| Language | C# |
| Framework | ASP.NET Web Forms (.NET Framework 4.8) |
| Database | SQL Server LocalDB (`QuizDB.mdf`) |
| Data access | ADO.NET (`SqlConnection`, `SqlCommand`, `SqlDataAdapter`) |
| IDE | Visual Studio |
| Styling | HTML and CSS (`style.css`) |

## Features

**Student**
- Register a new account and log in
- Take a quiz of 10 random questions picked from the question bank
- Each question has four options (A, B, C, D) and the student cannot go back to the previous question
- See the final score on the result page
- View the leaderboard with rank, student name, score and date

**Admin**
- Log in with an admin account
- Add new questions with four options and the correct answer
- See the list of questions already added
- Open the leaderboard from the admin dashboard

## Pages

| Page | What it does |
|------|--------------|
| `Start_Quiz_Game_Page.aspx` | Home page with the quiz instructions |
| `Registration_Page.aspx` | Create a new student account |
| `Login_Page.aspx` | Login for students and admin |
| `Quiz_Playing_page.aspx` | Shows one question at a time |
| `Result_Page.aspx` | Shows the final score |
| `LeatherBoard_Page.aspx` | Shows the ranking of all attempts |
| `Admin_Dashboard.aspx` | Admin home page |
| `Add_Question_Page.aspx` | Admin page to add questions |
| `Site.Master` | Master page with the header, menu and footer |

## Database

The database has three tables. You can see them in `schema.sql`.

- **Users**: UserID, FullName, Email, Password, UserRole (`Admin` or `Student`)
- **Questions**: QuestionID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectOption
- **Scores**: ScoreID, UserID (linked to Users), ScoreValue, DateTaken

## How the Quiz Works

1. After login, the user's ID, name and role are saved in the session.
2. When the quiz starts, 10 random questions are loaded with `SELECT TOP 10 * FROM Questions ORDER BY NEWID()` and kept in the session.
3. The current question number and the score are kept in ViewState.
4. After the last question, the score is saved in the `Scores` table and the user is sent to the result page.

## How to Run

You need Visual Studio with the **ASP.NET and web development** workload (this includes SQL Server LocalDB).

1. Download or clone this repository.
2. Open Visual Studio and go to **File, then Open, then Web Site**. Select the project folder.
3. Create the database file:
   - In Solution Explorer, right-click the `App_Data` folder.
   - Choose **Add, then New Item, then SQL Server Database**.
   - Name it exactly `QuizDB.mdf` and click Add.
4. Create the tables:
   - Double-click `QuizDB.mdf` to open it in Server Explorer.
   - Right-click the database and choose **New Query**.
   - Open `schema.sql`, copy everything into the query window and click **Execute**.
5. Press `Ctrl + F5` to run the project. The connection string in `Web.config` already points to `App_Data\QuizDB.mdf`, so nothing needs to be changed.

**Demo admin login (for local testing only):**
Email: `admin@quiz.com`
Password: `admin123`

Students can create their own accounts from the Register page. The Register page always creates a student, so an admin account has to be inserted directly in the database (the script already adds one).

## Known Limitations

These are the problems I know about and want to improve:

- **Passwords are saved as plain text.** They should be hashed before saving.
- **The 30-second timer is not working.** The instructions and the quiz page show a time limit, but the countdown is not implemented yet.
- **The quiz can be opened without logging in.** In that case saving the score fails because there is no user ID in the session.
- **The leaderboard shows every attempt.** It does not show only the best score of each student.
- **The result page always shows "/ 10".** It should use the real number of questions.
- **Admin can only add questions.** The dashboard text says add, edit or delete, but edit and delete are not built yet.
- **Error messages are shown directly in alert boxes.** This can show technical details and should be handled more safely.

## Future Improvements

- Hash passwords
- Add the countdown timer for each question
- Require login before starting the quiz
- Show only the best score of each student on the leaderboard
- Add edit and delete for questions
- Show correct answers at the end of the quiz

## Author

Amna Bibi
BSCS Student, PMAS Arid Agricultural University Rawalpindi