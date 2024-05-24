<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Role Report Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        function validateForm() {
            var role = document.forms["filterform"]["role"].value;
            if (!isNaN(role.trim())) { // Check if the input is a number
                showErrorPopup("Role must be text, not numbers.");
                return false;
            }
            return true;
        }

        function showErrorPopup(message) {
            var popup = document.getElementById("popupAlert");
            popup.innerText = message;
            popup.style.display = "block";
            setTimeout(function() {
                popup.style.display = "none";
            }, 3000); // Hide after 3 seconds
        }
    </script>
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
        form {
            margin-top: 20px;
        }
        form table {
            margin: 0 auto; /* Center the table */
        }
        form table input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        form table input[type="submit"] {
            background-color: #9D4BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        form table input[type="submit"]:hover {
            background-color: #7a2eaa;
        }
        .pdf-link {
            margin-top: 10px;
        }
        /* Custom Styles for Popup */
        #popupAlert {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 9999;
            background-color: #dc3545; /* Red color for error */
            color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>

<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">User Role Report</a>
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
    <h1>User Role Report</h1>
    <form name="filterform" action="search.jsp" method="get" onsubmit="return validateForm()">
        <div class="form-group row">
            <label for="role" class="col-sm-2 col-form-label">Role:</label>
            <div class="col-sm-10">
                <input type="text" name="role" class="form-control" id="role" placeholder="Enter role">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                <input type="submit" value="Filter" class="btn btn-primary">
            </div>
        </div>
    </form>
    <div class="pdf-link">
        <a href="Users.pdf" class="btn btn-secondary">Grab a Report as PDF</a>
    </div>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
