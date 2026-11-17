-- Quiz Master Pro: database script
-- Run this on the QuizDB.mdf database (see "How to Run" in README.md).

CREATE TABLE Users (
    UserID    INT IDENTITY(1,1) PRIMARY KEY,
    FullName  NVARCHAR(100) NOT NULL,
    Email     NVARCHAR(100) NOT NULL UNIQUE,
    Password  NVARCHAR(100) NOT NULL,
    UserRole  NVARCHAR(20)  NOT NULL      -- 'Admin' or 'Student'
);

CREATE TABLE Questions (
    QuestionID     INT IDENTITY(1,1) PRIMARY KEY,
    QuestionText   NVARCHAR(500) NOT NULL,
    OptionA        NVARCHAR(200) NOT NULL,
    OptionB        NVARCHAR(200) NOT NULL,
    OptionC        NVARCHAR(200) NOT NULL,
    OptionD        NVARCHAR(200) NOT NULL,
    CorrectOption  CHAR(1)       NOT NULL  -- 'A', 'B', 'C' or 'D'
);

CREATE TABLE Scores (
    ScoreID     INT IDENTITY(1,1) PRIMARY KEY,
    UserID      INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    ScoreValue  INT NOT NULL,
    DateTaken   DATETIME NOT NULL DEFAULT GETDATE()
);

-- Demo admin account (for local testing only)
INSERT INTO Users (FullName, Email, Password, UserRole)
VALUES ('Administrator', 'admin@quiz.com', 'admin123', 'Admin');

-- Sample questions (the quiz picks 10 random questions each time)
INSERT INTO Questions (QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectOption) VALUES
('What is the main advantage of using a Master Page in ASP.NET?', 'Faster database connection', 'Consistent look and feel across pages', 'It replaces the need for CSS', 'It is required for SQL Server', 'B'),
('Which file extension is used for an ASP.NET Web Forms page?', '.asp', '.aspx', '.cshtml', '.php', 'B'),
('Which control is used to display data in a table format?', 'Label', 'GridView', 'Button', 'HyperLink', 'B'),
('Where is the database connection string usually stored in an ASP.NET project?', 'Site.Master', 'style.css', 'Web.config', 'Default.aspx', 'C'),
('What do SqlCommand parameters help to prevent?', 'SQL injection', 'Slow queries', 'Broken CSS', 'Missing pages', 'A'),
('Which object keeps a user''s data across multiple pages during their visit?', 'Session', 'ViewState', 'Page_Load', 'Label', 'A'),
('Which SQL keyword is used to sort the results of a query?', 'GROUP BY', 'ORDER BY', 'WHERE', 'JOIN', 'B'),
('Which event is commonly used to run code when a web form is loaded?', 'Page_Load', 'Button_Click', 'GridView_Sorted', 'Session_End', 'A'),
('Which tag creates a server-side textbox in an .aspx page?', '<input type="text">', '<asp:TextBox runat="server">', '<textbox>', '<text>', 'B'),
('What does the IsPostBack property check?', 'Whether the user is logged in', 'Whether the page is loading for the first time or after a form submit', 'Whether the database is connected', 'Whether the browser is Chrome', 'B'),
('Which SQL statement is used to add a new row to a table?', 'SELECT', 'UPDATE', 'INSERT', 'DELETE', 'C'),
('What does ROW_NUMBER() OVER (ORDER BY ...) give us in a query?', 'A rank number for each row', 'The total number of tables', 'The size of the database', 'The current date', 'A');