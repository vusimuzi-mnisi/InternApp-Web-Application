<%-- 
    Document   : home
    Created on : 19 May 2024, 8:51:36 PM
    Author     : VUSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        .flex-wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .content {
            flex: 1;
        }
        .background-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            margin-top: 50px;
        }
        .content-inner {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
            padding-top: 150px;
        }
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
        }
        .social-icons a {
            color: white;
            margin: 0 10px;
            font-size: 24px;
        }
        h1 {
            font-size: 70px;
        }
        p{
            font-size: 25px;
        }
    </style>
</head>
<body>
<div class="flex-wrapper">
<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="admin_portal.jsp">Admin Portal</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            
            <li class="nav-item">
                <a class="nav-link" href="vacancies.jsp">Post Vacancies</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="summary.jsp">Summary</a>
            </li>
                
            <li class="nav-item">
                <a class="nav-link" href="Report1.jsp">Internships reports</a>
            </li>
                
            <li class="nav-item">
                <a class="nav-link" href="Report2.jsp">Roles  Report</a>
            </li>
            
                
            <li class="nav-item">
                <a class="nav-link" href="Report3.jsp">Applicants Report</a>
            </li>
                
            <li class="nav-item"> 
                <a class="nav-link" href="admin_menu.jsp">DML Operation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="assess_applications.jsp">Assess Applications</a>
            </li>    
              
           <li class="nav-item">
                <a class="nav-link" href="LogoutServlet">Logout</a>
            </li>
            
        </ul>
    </div>
</nav>

<!-- Content Section -->
<div class="container-fluid content">
        <div class="row">
            <div class="col-md-6 background-image">
                <img src="images\gif3.gif" alt="alt"/>
            </div>
            <div class="col-md-6 content-inner">
                <div>
                    <h1><b>WELCOME TO InternApp</b></h1>
                    <p>
                        Your go-to platform for connecting talented interns with exciting opportunities!<br>
                        Our intuitive platform streamlines the internship search process, matching ambitious<br>
                        students with dynamic companies across various industries.<br>
                        Join <b>InternApp</b> today and unlock your potential.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="text-center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <p>&copy; 2024 InternApp. All Rights Reserved.</p>
                    <div class="social-icons">
                        <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
                        <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>


