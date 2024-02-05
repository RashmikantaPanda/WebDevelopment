<%--
  Created by IntelliJ IDEA.
  User: RASHMIKANTA PANDA
  Date: 17-12-2023
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./CSS/style.css">


</head>

<body>

<div class="navigation-bar">
    <nav class="px-lg-5  navbar navbar-expand-lg navbar-dark bg-green">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold fs-3" href="index.jsp">HMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-5 me-5 ">
                    <li class="nav-item ">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    </li>

                </ul>

                <div class="d-flex">
                    <a class="btn btn-outline-dark btn-info text-white me-2" href="patient_login.jsp" role="button">Sign
                        In</a>
                </div>

            </div>
        </div>
    </nav>
</div>

<div class="container">
    <div class="row" id="login">
        <div class="col-md-5 mx-auto my-5">
            <div class="card mb-2">
                <h4 class="text-center card-header py-1 text-dark fw-bold">USER REGISTRATION</h4>
            </div>
            <div class="card bg-light fw-bolder">
                <div class="card-body">
                    <form class="" action="${pageContext.request.contextPath}/patient/register" method="post">
                        <c:if test="${not empty succMsg}">
                            <div class="row my-2">
                                <p class="text-success text-center fs-5">${succMsg}</p></div>
                            <c:remove var="succMsg"/>
                        </c:if>
                        <c:if test="${not empty failMsg}">
                            <div class="row my-2">
                                <p class="text-danger text-center fs-5">${failMsg}</p></div>
                            <c:remove var="failMsg"/>
                        </c:if>
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Username</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Email</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" name="email" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Phone</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" name="phone">
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label class="col-sm-4 col-form-label">Password</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control"  name="password" required>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label class="col-sm-4 col-form-label">Confirm Password</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control"  name="confirmPassword" required>
                            </div>
                        </div>

                        <div class="text-center" id="signin-btn">
                            <button type="reset" class="btn btn-danger me-3 ">Clear</button>
                            <button type="submit" class="btn btn-success ">Register</button>
                        </div>

                        <div class="text-center mt-3" id="signup-text">
                            <a href="" class="text-decoration-none text-dark " id="dontHaveAcc">Already have account
                                ?</a>
                            <a class="text-decoration-none " id="needHelp" href="patient_login.jsp">Login</a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>

</html>
