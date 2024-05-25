<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management System</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .jumbotron {
            /*background-color: #343a40;*/
            background-color: #ab8e28;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="">
    <%@include file="./pages/user/loggedInUserNavbar.jsp"%>
</div>
<div class="py-3 text-center">
    <h4>Dashboard</h4>
</div>

<div>
    <div class="container overflow-hidden">

        <h2 class="text-center mt-3">PROFILE</h2>

        <div class="row gx-5 my-4">

            <div class="col">

                <div class="p-3 border bg-light">${loggedInUser.firstName}
                    ${loggedInUser.lastName}</div>

            </div>

            <div class="col">

                <div class="p-3 border bg-light">${loggedInUser.email}</div>

            </div>

        </div>

        <div class="row gx-5 my-4">
            <div class="col">
                <div class="p-3 border bg-light">${loggedInUser.phone}</div>
            </div>

            <div class="col">
                <div class="p-3 border bg-light">${loggedInUser.address.city},${loggedInUser.address.state}
                </div>
            </div>
        </div>
    </div>

    <div class="container">

        <div class="text-center my-5">
            <a href="view_purchased_history" class="btn bg-success text-light">Purchase
                History</a>
        </div>

        <div class="text-center my-5">
            <a href="view_all_products" class="btn bg-info text-light">Show More</a>
        </div>

    </div>
</div>
</body>
</html>
