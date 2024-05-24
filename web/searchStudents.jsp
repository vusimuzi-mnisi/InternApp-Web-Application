<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Applicants Report Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #e2e2e2;
            padding-top: 56px; /* Adjust as needed */
        }
        .container {
            background-color: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            text-align: center;
        }
        h1 {
            color: #9D4BFF;
            margin-bottom: 30px;
        }
        table {
            margin: 0 auto; /* Center the table */
            width: 80%; /* Adjust as needed */
            border-collapse: collapse;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ddd;
        }
        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">Applicants Report Page</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="admin_portal.jsp">Home</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Content Section -->
<div class="container">
    <h1>Get Gender Applicants Details Report</h1>
    <% 
        String gender = request.getParameter("gender");
        
        if(gender.length() > 2) {
            out.println("<p class='error-message'>Gender cannot exceed 2 characters in length.</p>");
        } else {
    %>
    <table class="table">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>EMAIL</th>
            </tr>
        </thead>
        <tbody>
            <%
                int studentCount = 0;
                try {
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/internappdatabase", "root", "root");
                    Statement ps = connection.createStatement();
                    
                    String sql = "SELECT * FROM students_tbl WHERE gender='" + gender + "'";
                    ResultSet rs = ps.executeQuery(sql);
                    while(rs.next()) {
                        studentCount++;
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("firstname") %></td>
                <td><%= rs.getString("email") %></td>
            </tr>
            <%
                    }
                    rs.close();
                    
                    String countSql = "SELECT COUNT(*) AS total FROM students_tbl WHERE gender='" + gender + "'";
                    rs = ps.executeQuery(countSql);
                    if(rs.next()) {
                        studentCount = rs.getInt("total");
                    }
                    rs.close();
                    ps.close();
                    connection.close();
                    
                } catch(Exception e) {
                    out.println("<p class='error-message'>An error occurred: " + e.getMessage() + "</p>");
                }
            %>
        </tbody>
    </table>
    <h2>Total Students per Gender: <%= studentCount %></h2>
    <% } %>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
