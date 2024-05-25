<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<div class="d-flex">
    <div class="ps-2 mt-4">
        <button class="btn btn-primary btn-sm" onclick=history.back()>
            Back</button>
    </div>
    <div class="col-md-5 mx-auto mt-4 shadow">
        <div class="mb-2">
            <h4 class="text-center card-headers py-1 text-dark fw-bold">CATEGORY
                DETAILS</h4>
        </div>
        <div>
            <c:if test="${not empty categoryAddedMsg}">
                <div class="row">
                    <p class="text-success text-center fs-5">${categoryAddedMsg}</p>
                </div>
                <c:remove var="categoryAddedMsg" />
            </c:if>

            <div class="card card-body ">
                <table
                        class="table table-bordered table-hover table-striped table-warning">
                    <thead>
                    <tr class="text-center">
                        <th scope="col">#</th>
                        <th scope="col">Category Name</th>
                        <th scope="col">Category Code</th>
                        <th scope="col">Actions</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${allCategories}" varStatus="loop">

                        <tr class="text-center">
                            <th scope="row">${loop.index+1}</th>
                            <td>${item.categoryName}</td>
                            <td>${item.categoryCode}</td>
                            <td>
                                <a href="edit_category?id=${item.id}" class="btn btn-danger btn-sm ">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>