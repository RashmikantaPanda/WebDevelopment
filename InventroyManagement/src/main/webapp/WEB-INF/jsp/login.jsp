<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

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
            <a class="navbar-brand fw-bold fs-3" href="/home">I M S</a>
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
                    <a class="btn btn-outline-dark btn-warning text-white"
                       href="registration" role="button">SignUp</a>
                </div>

            </div>
        </div>
    </nav>
</div>

<div class="container">
    <div class="row" id="login">
        <div class="card bg-white col-md-5 mx-auto my-5 px-3 py-3 shadow border">
            <div class="mb-2">
                <h4 class="text-center card-heade py-1 text-success fw-bold">USER LOGIN</h4>
            </div>

            <c:if test="${not empty failMsg}">
                <div class="row my-1">
                    <p class="text-danger text-center fs-6 mb-0">${failMsg}</p>
                </div>
                <c:remove var="failMsg" />
            </c:if>

            <div class="bg-white fw-bold">
                <div class="card-body">
                    <form class="" action="login_post" method="post">
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Email
                                ID</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" id="inputEmail3"
                                       name="email" required="required">
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="inputPassword3" class="col-sm-3 col-form-label">Password</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="inputPassword3"
                                       name="password" required="required">
                            </div>
                        </div>
                        <div class="text-center" id="signin-btn">
                            <button type="submit" class="btn btn-success btn-sm">Sign
                                in</button>
                        </div>

                        <div class="text-center mt-3" id="signup-text">
                            <a href="" class="text-decoration-none text-dark fs-6"
                               id="dontHaveAcc">Don't have account ?</a> <a
                                class="text-decoration-none fs-6" href="registration">SignUp</a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



</body>

</html>