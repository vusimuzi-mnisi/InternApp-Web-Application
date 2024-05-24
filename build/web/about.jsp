<%-- 
    Document   : About
    Created on : 07 May 2024, 11:42:35 AM
    Author     : charles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }
        .about-section {
            padding: 60px 0;
        }
        .about-section h1,
        .about-section h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #9D4BFF;
        }
        .about-section h1 {
            font-size: 48px;
        }
        .about-section h2 {
            font-size: 36px;
        }
        .about-section p {
            font-size: 18px;
            line-height: 1.8;
            margin-bottom: 30px;
            text-align: center;
        }
        .team-member {
            text-align: center;
            margin-bottom: 30px;
        }
        .team-member img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            margin-bottom: 15px;
            transition: transform 0.3s;
        }
        .team-member img:hover {
            transform: scale(1.1);
        }
        .team-member h5 {
            margin-top: 15px;
            margin-bottom: 5px;
            font-size: 18px;
        }
        .team-member p {
            font-size: 16px;
            color: gray;
        }
        .bg-light {
            background-color: #f8f9fa!important;
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">InternApp</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.html">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.jsp">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            
        </ul>
    </div>
</nav>
    <!-- About Us Section -->
    <div class="container about-section">
        <h1>About Us</h1>
        <p>Welcome to InternApp, your go-to platform for connecting talented interns with exciting opportunities. Our mission is to bridge the gap between education and employment by providing students with the tools and resources they need to launch their careers.</p>
    </div>

    <!-- Mission Section -->
    <div class="container about-section bg-light">
        <h2>Our Mission</h2>
        <p>At InternApp, our mission is to empower students and recent graduates by connecting them with meaningful internship opportunities. We believe that internships are a crucial step in career development, and we strive to make the process as seamless and rewarding as possible.</p>
    </div>

    <!-- Vision Section -->
    <div class="container about-section">
        <h2>Our Vision</h2>
        <p>Our vision is to be the leading platform for internships, known for our commitment to quality, innovation, and impact. We aim to create a world where every student has the opportunity to gain valuable work experience and build a successful career.</p>
    </div>

    <!-- History Section -->
    <div class="container about-section bg-light">
        <h2>Our History</h2>
        <p>Founded in 2024, InternApp was created out of a passion for helping students succeed. We have grown to become a trusted partner for both students and employers, facilitating thousands of internships across various industries.</p>
    </div>

    <!-- Team Section -->
    <div class="container about-section">
        <h2>Meet Our Team</h2>
        <div class="row">
            <div class="col-md-4 team-member">
                <img src="images/team-member1.jpg" alt="alt">
                <h5>Charles Sigxakuma</h5>
                <p>Developer</p>
            </div>
            <div class="col-md-4 team-member">
                <img src="images/vusi.jpg" alt="alt">
                <h5>Vusimuzi Mnisi</h5>
                <p>Developer</p>
            </div>
            <div class="col-md-4 team-member">
                <img src="images/team-member1.jpg" alt="alt">
                <h5>Freddy Fakude</h5>
                <p>Developer</p>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 InternApp. All Rights Reserved.</p>
        <div class="social-icons">
            <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
        </div>
    </footer>

    <!-- Bootstrap JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>
</html>
