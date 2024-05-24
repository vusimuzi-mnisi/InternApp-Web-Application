<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            padding-top: 56px; /* Adjust as needed */
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            text-align: center;
        }
        h1 {
            color: #6c757d;
            margin-bottom: 20px;
        }
        p {
            color: #6c757d;
            font-size: 18px;
            margin-bottom: 20px;
        }
        ol {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        .container a {
            display: block;
            padding: 10px;
            background-color: #9D4BFF;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        li a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">Menu Page</a>
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
    <h1>Menu</h1>
    <p>Please select one of the following options:</p>
    <ol>
        <li><a href="edit_Internship.jsp">Click here to update details</a></li>
        <li><a href="view_Internships.jsp">Click here to view all</a></li>
        <li><a href="remove_Internship.jsp">Click here to remove details</a></li>
    </ol>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
