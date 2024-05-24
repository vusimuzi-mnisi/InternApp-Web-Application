<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Details</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #e2e2e2;
            padding-top: 56px; 
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
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
        .social-icons a {
            color: white;
            margin: 0 10px;
            font-size: 24px;
        }
    </style>
</head>
<body>

<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">View Details</a>
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
    <h1>User Details</h1>
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <% 
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {

                    String jdbcUrl = "jdbc:derby://localhost:1527/Internappdatabase";
                    String username = "root";
                    String password = "root";
                    conn = DriverManager.getConnection(jdbcUrl, username, password);

                    String sql = "SELECT name, surname, email, gender FROM applicants_tbl WHERE id = ?";
                    pstmt = conn.prepareStatement(sql);
                    
                    pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
            %>
                        <p>Name: <%= rs.getString("name") %></p>
                        <p>Surname: <%= rs.getString("surname") %></p>
                        <p>Email: <%= rs.getString("email") %></p>
                        <p>Gender: <%= rs.getString("gender") %></p>
            <% 
                    } else {
            %>
                        <p>No user found with the given ID.</p>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Font Awesome -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>
</html>
