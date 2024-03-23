<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="wrapper">
        <form action="Forgot.jsp" method="POST">
            <h1>Forgot Password</h1>
            <div class="input-box">
                <i class='bx bxs-user'></i>
                <input type="text" name="username" placeholder="Enter your username" required>
            </div>
            <button type="submit" class="btn">Submit</button>
            <div class="register-link">
                <p>Remembered your password? <a href="login.jsp">Login</a></p>
            </div>
        </form>
        
        <%@ page import="java.io.PrintWriter" %>
        <%@ page import="java.util.logging.Level" %>
        <%@ page import="java.util.logging.Logger" %>
        <%@ page import="java.util.logging.FileHandler" %>
        <%@ page import="java.util.logging.SimpleFormatter" %>

        <%!
            private final static Logger LOGGER = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
        %>

        <%
            String username = request.getParameter("username");

            // Validate the username (you might want to add more thorough validation)
            if (username != null && !username.isEmpty()) {
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet resultSet = null;

                try {
                    // Define database connection parameters
                    String url = "jdbc:mysql://localhost:3306/timetable";
                    String user = "root"; // Replace with your actual DB username
                    String pass = "Chetan@11"; // Replace with your actual DB password

                    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

                    conn = DriverManager.getConnection(url, user, pass);

                    String query = "SELECT * FROM users WHERE username = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, username);

                    resultSet = pstmt.executeQuery();

                    if (resultSet.next()) {
                        // User found, send password reset information (not implemented in this example)
                        out.println("<html><body><p>Password reset information sent to " + username + ".</p></body></html>");
                    } else {
                        // User not found
                        out.println("<html><body><p>User with username " + username + " not found.</p></body></html>");
                    }
                } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
                    // Handle exceptions
                    out.println("<html><body><p>An error occurred. Please try again later.</p></body></html>");
                    LOGGER.log(Level.SEVERE, "Exception occurred", e);
                } finally {
                    try {
                        if (resultSet != null) {
                            resultSet.close();
                        }
                        if (pstmt != null) {
                            pstmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (SQLException e) {
                        // Handle exceptions
                        LOGGER.log(Level.SEVERE, "Exception occurred while closing resources", e);
                    }
                }
            }
        %>
    </div>
</body>
</html>
