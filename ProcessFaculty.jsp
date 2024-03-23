<%@ page import="java.sql.*, java.io.IOException" %>
<%
    try {
        // Define database connection parameters
        String url = "jdbc:mysql://localhost:3306/timetable";
        String user = "root"; // Replace with your actual DB username
        String pass = "Chetan@11"; // Replace with your actual DB password

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

        try (Connection conn = DriverManager.getConnection(url, user, pass)) {
            for (int i = 1; i <= 11; i++) {
                // Retrieve data from the submitted form
                String facultyName = request.getParameter("facultyName" + i);
                String subject = request.getParameter("subject" + i);

                // Insert data into the faculty table
                String insertQuery = "INSERT INTO faculty (faculty_name, subject) VALUES (?, ?)";
                try (PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
                    pstmt.setString(1, facultyName);
                    pstmt.setString(2, subject);
                    pstmt.executeUpdate();
                }
            }

            // Redirect to a success page
            response.sendRedirect("success.jsp");
        }
    } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException | IOException e) {
        // Handle exceptions
        e.printStackTrace();
        response.sendRedirect("error.html");
    }
%>
