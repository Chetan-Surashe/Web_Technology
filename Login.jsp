<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // JDBC Database Connection
    String jdbcURL = "jdbc:mysql://localhost:3306/timetable";
    String dbUser = "root";
    String dbPassword = "Chetan@11";

    try {
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Check credentials using a prepared statement to prevent SQL injection
        String query = "SELECT * FROM users WHERE username=? AND password=?";
   
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            // Successful login
            out.println("Login successful! Welcome, " + username);
            out.println("Please wait...");

            // Delay for 5 seconds (5000 milliseconds)
            Thread.sleep(5000);

            // Redirect to Faculty.jsp
            response.sendRedirect("Faculty.jsp");
        } else {
            // Failed login
            out.println("Invalid username or password. Please try again.");
        }

        connection.close();
    } catch (SQLException e) {
        out.println("SQL Exception: " + e.getMessage());
        e.printStackTrace();
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
        e.printStackTrace();
    }
%>
