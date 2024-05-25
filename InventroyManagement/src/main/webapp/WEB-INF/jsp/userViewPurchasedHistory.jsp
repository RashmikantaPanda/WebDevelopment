<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History</title>
    <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet">
</head>
<body>
<div>
    <%@include file="./pages/user/loggedInUserNavbar.jsp"%>
</div>
<div class="">
    <%@include file="./pages/user/purchasedHistory.jsp"%>
</div>
</body>
</html>
<tbody>