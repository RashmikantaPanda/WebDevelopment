<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
</head>
<body>
<div class="container">
    <div class="row" id="login">
        <div class="col-md-8 mx-auto my-2">
            <div class=" mb-2">
                <h4 class="text-center card-header py-1 text-dark fw-bold">USER
                    REGISTRATION</h4>
            </div>
            <c:if test="${not empty failMsg}">
                <div class="row">
                    <p class="text-danger text-center fs-6 text-capitalize">${failMsg}</p>
                </div>
                <c:remove var="failMsg" />
            </c:if>
            <div class="card bg-light fw-bold">
                <div class="card-body">
                    <form class="" action="new_user_registration" method="post">
                        <label for="inputEmail3"
                               class="col-sm-4 col-form-label text-warning">Personal
                            Details</label>
                        <hr>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">FirstName</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control"
                                       placeholder="e.g Rashmikanta" name="firstName">
                            </div>
                            <label for="inputEmail3" class="col-sm-2 col-form-label">LastName</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" placeholder="e.g Panda"
                                       name="lastName">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" name="email"
                                       required="required">
                            </div>
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-4 ">
                                <input type="password" class="form-control" name="password">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Phone</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" name="phone">
                            </div>
                            <!-- <label for="inputEmail3" class="col-sm-2 col-form-label">Address</label>
                        <div class="col-sm-4 ">
                            <input type="text" class="form-control">
                        </div> -->
                        </div>
                        <!-- Address div Started -->
                        <div class="row mb-4 my-4">
                            <label for="inputPassword3"
                                   class="col-sm-2 col-form-label text-danger">Address</label>
                            <hr>
                            <div class="container me-3">
                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">City</label>
                                    <div class="col-sm-4 ">
                                        <input type="text" class="form-control" name="city">
                                    </div>
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">State</label>
                                    <div class="col-sm-4 ">
                                        <input type="text" class="form-control" name="state">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">Country</label>
                                    <div class="col-sm-4 ">
                                        <input type="text" class="form-control" name="country">
                                    </div>
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">Pincode</label>
                                    <div class="col-sm-4 ">
                                        <input type="text" class="form-control" name="pincode">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Address div ended  -->
                        <div class="text-center" id="signin-btn">
                            <a class="btn btn-danger" id="needHelp"
                               href="/admin/view_users">BACK</a>
                            <button type="submit" class="btn btn-success mx-2">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>