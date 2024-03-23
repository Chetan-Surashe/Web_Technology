<%@ page import="java.sql.*, java.io.IOException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
    <style>
        :root {
            --primary-color: #0b6aaa;
            --background-color: aquamarine; /* Set your desired background color here */
            --box-shadow-color: rgba(0, 0, 0, 0.2);
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: var(--background-color);
            margin: 0; /* Add this line to remove default body margin */
        }

        .wrapper {
            width: 400px;
            background-color: white; /* Set the form background color here */
            box-shadow: 0 0 10px var(--box-shadow-color);
            border-radius: 10px;
            padding: 30px;
            text-align: center;
        }

        .wrapper h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: var(--primary-color);
        }

        .btn {
            width: 80%;
            height: 45px;
            background: var(--primary-color);
            border: none;
            border-radius: 20px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background: #095686; /* Change color on hover if desired */
        }

        .pleaseWait {
            margin-top: 20px;
            display: none;
        }
    </style>
    <script>
        function showPleaseWait() {
            document.getElementById("pleaseWait").style.display = "block";
            setTimeout(function() {
                window.location.href = "generator.jsp"; // Replace with your actual generator.jsp file
            }, 5000); // 5000 milliseconds = 5 seconds
        }
    </script>
</head>

<body>
    <div class="wrapper">
        <h1>Faculty Information Added Successfully</h1>
        <button onclick="showPleaseWait()" class="btn">Generate Timetable</button>
        <div id="pleaseWait" class="pleaseWait">Please wait...</div>
    </div>
</body>

</html>
