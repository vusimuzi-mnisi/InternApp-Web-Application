<%@page import="java.sql.SQLException"%>
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
    <title>Internship Vacancies</title>
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
        }
        h1 {
            color: #9D4BFF;
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .total {
            text-align: center;
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #9D4BFF;
            border-color: #9D4BFF;
        }
        .btn-primary:hover {
            background-color: #7d3bb5;
            border-color: #7d3bb5;
        }
    </style>
</head>
<body>

<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">Internship Vacancies</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="intern_portal.jsp">Home</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Content Section -->
<div class="container">
    <h1>Internship Vacancies</h1>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Closing Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% 
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;
                try {
                    connection = DriverManager.getConnection("jdbc:derby://localhost:1527/internappdatabase", "root", "root");
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM internships_tbl";
                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>
                <tr>
                    <td><%= resultSet.getInt("id") %></td>
                    <td><%= resultSet.getString("title") %></td>
                    <td><%= resultSet.getString("description") %></td>
                    <td><%= resultSet.getDate("closing_date") %></td>
                    <td>
                        <form action="ApplyServlet" method="post">
                            <input type="hidden" name="internshipId" value="<%= resultSet.getInt("id") %>">
                            <button type="submit" class="btn btn-primary">Apply</button>
                        </form>
                    </td>
                </tr>
            <% 
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger' role='alert'>An error occurred while fetching data. Please try again later.</div>");
                } finally {
                    if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
                    if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
                    if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
