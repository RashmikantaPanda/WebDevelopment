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
<div class="container mt-4">
    <a href="/admin/dashboard">
        <button class="btn btn-primary btn-sm" onclick=history.back()>Back</button>
    </a>
</div>
<div class="h-100">
    <div class="mx-4">
        <div class="row" id="login">
            <div class="col-md-6 mx-auto my-5">
                <div class="card mb-2">
                    <h4 class="text-center card-header py-1 text-dark fw-bold">EDIT
                        CATEGORY</h4>
                </div>
                <div class="card bg-light shadow">
                    <div class="card-body">
                        <form class="fw-bold" action="save_edit_category" method="post">
                            <input type="hidden" class="form-control" name="id"
                                   value="${editCategory.id }">

                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-4 col-form-label">Category
                                    Name :</label>
                                <div class="col-sm-8 ">
                                    <input type="text" class="form-control" name="categoryName"
                                           value="${editCategory.categoryName }">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-4 col-form-label">Category
                                    Code :</label>
                                <div class="col-sm-8 ">
                                    <input type="text" class="form-control" name="categoryCode"
                                           value="${editCategory.categoryCode }">
                                </div>
                            </div>

                            <div class="text-center" id="signin-btn">
                                <button type="submit" class="btn btn-success">SAVE
                                    CATEGORY</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="text-center ms-auto">
    <a href="view_category" class="btn btn-primary"> View Categories</a>
</div>

</body>
</html>