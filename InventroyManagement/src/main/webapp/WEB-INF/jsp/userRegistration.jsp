<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../static/CSS/style.css">
</head>
<body>

<div class="navigation-bar">
    <nav class="px-lg-5  navbar navbar-expand-lg navbar-dark bg-green">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold fs-3" href="/">I M S</a>
            <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-5 me-5 ">
                    <li class="nav-item "><a class="nav-link active"
                                             aria-current="page"
                                             href="${pageContext.request.contextPath}/home">Home</a></li>
                </ul>
                <div class="d-flex">
                    <a class="btn btn-outline-dark btn-info text-white me-2"
                       href="login" role="button">Sign In</a>
                </div>
            </div>
        </div>
    </nav>
</div>

<div class="container">
    <div class="row" id="login">
        <div class="col-md-8 mx-auto my-2">
            <div class="card mb-2">
                <h4 class="text-center card-header py-1 text-dark fw-bold">USER
                    REGISTRATION</h4>
            </div>
            <c:if test="${not empty failMsg}">
                <div class="row">
                    <p class="text-danger text-center fs-6 text-capitalize">${failMsg}</p>
                </div>
                <c:remove var="failMsg" />
            </c:if>
            <div class="card fw-bold shadow">
                <div class="card-body">
                    <form class="" action="registration" method="post">
                        <label for="inputEmail3"
                               class="col-sm-4 col-form-label text-warning">Personal
                            Details</label>
                        <hr class="mt-0">
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
                            <button type="submit" class="btn btn-success btn-sm ">Register</button>
                        </div>

                        <div class="text-center mt-3" id="signup-text">
                            <a href="" class="text-decoration-none text-dark fs-6 "
                               id="dontHaveAcc">Already have account ?</a> <a
                                class="text-decoration-none fs-6" id="needHelp" href="login">Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>

</html>