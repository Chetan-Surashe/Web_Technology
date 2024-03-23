<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Information</title>
    <style>
        body {
            background-color: aquamarine;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .wrapper {
            width: 400px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 30px;
            text-align: center;
        }

        .wrapper h1 {
            font-size: 36px;
        }

        .input-box {
            position: relative;
            margin: 20px 0;
        }

        .input-box input {
            width: 80%;
            height: 40px;
            border: 1px solid #ccc;
            border-radius: 20px;
            padding: 10px 40px 10px 30px;
            font-size: 16px;
            outline: none;
        }

        .btn {
            width: 100%;
            height: 45px;
            background: #0b6aaa;
            border: none;
            border-radius: 20px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <form action="ProcessFaculty.jsp" method="POST">
            <h1>Faculty Information</h1>

            <%@ page import="java.util.ArrayList" %>
            <%
                int numberOfFaculty = 11; // Set the desired number of faculty inputs

                for (int i = 1; i <= numberOfFaculty; i++) {
            %>
                <div class="input-box">
                    <input type="text" name="facultyName<%= i %>" placeholder="Faculty Name" required>
                    <input type="text" name="subject<%= i %>" placeholder="Subject" required>
                </div>
            <%
                }
            %>

            <!-- Add more faculty sections as needed -->

            <button type="submit" class="btn">Submit</button>
        </form>
    </div>
</body>

</html>
