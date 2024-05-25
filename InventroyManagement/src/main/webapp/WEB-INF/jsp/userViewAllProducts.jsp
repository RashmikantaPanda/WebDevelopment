<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.css" />
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
    <style>
        .product-table {
            vertical-align: middle;
        }

        .products {
            margin-top: 40px;
        }
    </style>
    <title>Products</title>
</head>
<body>
<div class="navbar mt-4">
    <%@include file="./pages/user/loggedInUserNavbar.jsp"%>
</div>
<div class="products">
    <%@include file="./pages/user/viewAllProducts.jsp"%>
</div>
</body>
</html>