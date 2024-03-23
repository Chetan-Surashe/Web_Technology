<%@ page import="java.sql.*, java.util.List, java.util.ArrayList, java.util.Collections" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%! 
    // Function to get faculties from the database
    public List<String[]> getFaculties() throws SQLException {
        List<String[]> faculties = new ArrayList<>();
        String jdbcURL = "jdbc:mysql://localhost:3306/timetable";
        String dbUser = "root";
        String dbPassword = "Chetan@11";

        try {
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT faculty_name, subject FROM faculty");

            while (resultSet.next()) {
                String facultyName = resultSet.getString("faculty_name");
                String subject = resultSet.getString("subject");
                faculties.add(new String[]{facultyName, subject});
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            throw e;
        }
        return faculties;
    }
%>

<%
    // Initialize timetable with empty slots
    String[][] timetable = new String[6][8]; // Assuming 6 days and 8 time slots per day

    // Define lecture timings
    String[] lectureTimings = {"10:00 AM - 11:00 AM", "11:00 AM - 12:00 PM", "Lunch Break", "12:45 PM - 1:45 PM", "1:45 PM - 2:45 PM", "Short Recess", "3:00 PM - 4:00 PM", "4:00 PM - 5:00 PM (Practical)"};

    // Define days of the week
    String[] daysOfWeek = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

    // Add faculty information to the timetable
    for (int day = 0; day < 6; day++) {  // 0-5 represents Monday to Saturday
        // Shuffle the facultiesData list to randomize selection
        List<String[]> facultiesData = getFaculties();
        Collections.shuffle(facultiesData);

        // Loop through all 8 slots
        for (int slot = 0; slot < 8; slot++) {
            // Skip the break and lab timings
            String timing = lectureTimings[slot];
            if (!"Lunch Break".equals(timing) && !"Short Recess".equals(timing)) {
                // Assign faculty to the slot
                if (!facultiesData.isEmpty()) {
                    String[] faculty = facultiesData.remove(0);
                    timetable[day][slot] = faculty[0] + " (" + faculty[1] + ")";
                } else {
                    timetable[day][slot] = "";
                }
            } else {
                // Display blank for both "Lunch Break" and "Short Recess" slots
                timetable[day][slot] = "";

                // Empty cells for the remaining rows
                for (int i = 1; i < 8; i++) {
                    if (day + i < 6) {  // Check array bounds
                        timetable[day + i][slot] = ""; // Empty cells for the remaining rows
                    }
                }
            }
        }
    }
%>

<html>
<head>
    <title>Timetable Generator</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        /* Define different color combinations for each slot */
        td:nth-child(odd) {
            background-color: lavender; /* Lavender for odd slots */
        }

        td:nth-child(even) {
            background-color: white; /* White for even slots */
        }

        /* Define specific colors for "Lunch Break" and "Short Recess" slots */
        td:contains("Lunch Break") {
            background-color: lavender; /* Lavender for Lunch Break */
        }

        td:contains("Short Recess") {
            background-color: white; /* White for Short Recess */
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            // Add :contains selector support
            jQuery.expr[':'].contains = function (a, i, m) {
                return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
            };
        });
    </script>
</head>
<body>
    <table>
        <tr>
            <th>Day</th>
            <% for (String timing : lectureTimings) { %>
                <th><%= timing %></th>
            <% } %>
        </tr>
        <% for (int day = 0; day < 6; day++) { %>
            <tr>
                <td><%= daysOfWeek[day] %></td>
                <% for (int slot = 0; slot < 8; slot++) { %>
                    <td><%= timetable[day][slot] %></td>
                <% } %>
            </tr>
        <% } %>
    </table>
</body>
</html>
