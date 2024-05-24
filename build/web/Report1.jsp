<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users Report Page</title>
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
        .alert-popup {
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
    <a class="navbar-brand" href="#">Internships Report</a>
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
    <h1>Internships Report</h1>
    <form name="filterform" action="search2.jsp" method="get" onsubmit="return validateForm()">
        <table>
            <tr>
                <td>Title:</td>
                <td><input type="text" name="title" id="title" class="form-control" value="ICT"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Filter" class="btn btn-primary"></td>
            </tr>
        </table>
    </form>
    <div class="pdf-link">
        <a href="interns.pdf" class="btn btn-secondary">Report as PDF</a>
    </div>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- JavaScript Validation -->
<script>
    function validateForm() {
        var title = document.getElementById("title").value;
        if (title.trim() === '') {
            // Show popup alert
            $('#popupAlert').fadeIn();
            setTimeout(function() {
                $('#popupAlert').fadeOut();
            }, 3000); // Hide after 3 seconds
            return false;
        }
        return true;
    }
</script>

<!-- Popup Alert -->
<div id="popupAlert" class="alert-popup" role="alert">
    <strong>Error:</strong> Please enter a title.
</div>


</body>
</html>
