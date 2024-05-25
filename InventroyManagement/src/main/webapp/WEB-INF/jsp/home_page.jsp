<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management System</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/CSS/style.css">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .jumbotron {
            background-color: #ab8e28;
            color: #fff;
            height: 92vh;
        }
    </style>
</head>
<body>
<!--Navbar -->
<div>
    <%@include file="./pages/navbar.jsp"%>
</div>

<div class="jumbotron text-center py-5 ">

    <h1 class="display-4">Inventory Management System</h1>
    <p class="lead">Efficiently manage your inventory with ease.</p>
    <hr class="my-4">
    <p>Track products, manage stock, and streamline operations.</p>
    <a class="btn btn-primary btn-lg mb-5" href="user/login" role="button">Get
        Started</a>


</div>

</body>
</html>
