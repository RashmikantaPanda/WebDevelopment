<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sell History</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="../static/CSS/sidenav.css">
</head>
<body>
<div>
    <%@include file="./pages/admin/adminNavbar.jsp" %>
</div>
<div class="pb-5">
    <%@include file="./pages/admin/adminSidenav.jsp" %>
</div>
<div class="i=pruduct-sell-history">
    <%@include file="./pages/admin/adminViewSellHistoryPage.jsp" %>
</div>
</body>
</html>
