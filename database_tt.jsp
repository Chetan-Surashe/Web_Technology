<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Registration Status</title>
    <script>
        function redirect() {
            // Redirect to login.html after 5 seconds
            setTimeout(function() {
                window.location.href = "Login.jsp";
            }, 5000);
        }
    </script>
</head>
<body>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Define database connection parameters
        String url = "jdbc:mysql://localhost:3306/timetable";
        String user = "root"; // Replace with your actual DB username
        String pass = "Chetan@11"; // Replace with your actual DB password

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

        conn = DriverManager.getConnection(url, user, pass);

        String insertQuery = "INSERT INTO users (username, password) VALUES (?, ?)";
        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Registration successful! Please wait...");
            // Call the JavaScript function for redirection
            out.println("<script>redirect();</script>");
        } else {
            out.println("Error registering the user.");
        }
    } catch (SQLException e) {
        out.println("Database error: " + e.getMessage());
        // Log the exception for debugging purposes
        e.printStackTrace();
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
        // Log the exception for debugging purposes
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            out.println("Error closing resources: " + e.getMessage());
            // Log the exception for debugging purposes
            e.printStackTrace();
        }
    }
%>

</body>
</html>
