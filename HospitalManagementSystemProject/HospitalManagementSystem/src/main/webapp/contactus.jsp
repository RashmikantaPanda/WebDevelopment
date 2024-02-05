<%--
  Created by IntelliJ IDEA.
  User: RASHMIKANTA PANDA
  Date: 18-12-2023
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="./CSS/style.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="${pageContext.request.contextPath}/JS/logout.js"></script>

</head>

<body>
<%@ page import="java.io.IOException" %>
<c:if test="${ empty loggedIn}">
    <%
        try {
            response.sendRedirect("patient_login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    %>
</c:if>
<div class="navigation-bar">
    <nav class="px-lg-5  navbar navbar-expand-lg navbar-dark bg-green">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold fs-3" href="patient_dashboard.jsp">HMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0 fs-5 me-5 ms-4">
                    <li class="nav-item ms-lg-4">
                        <a class="nav-link" aria-current="page" href="patient_dashboard.jsp">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="patient/booknow">BookNow</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="patient/status">Appointments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutus.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="">Contact</a>
                    </li>


                </ul>

                <!-- <div class="d-flex">
                        <a class="btn btn-outline-dark btn-info text-white me-2" href="signin.jsp" role="button">Sign In</a>
                        <a class="btn btn-outline-dark btn-warning text-white" href="signup.jsp" role="button">Sign Up</a>
                    </div> -->
                <div class="dropdown user-dropdown ms-auto">
                    <button class="btn btn-warning dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        ${loggedInPatient.name}
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#"><i class="fa fa-pencil"></i> Edit</a></li>
                        <li>
                            <button class="dropdown-item text-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal"><i class="fa fa-sign-out text-dark"></i>
                                Logout
                            </button>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </nav>
</div>

<%----%>
<!-- Modal for log out -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Do you want to logged out ?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                <button type="button" class="btn btn-danger " onclick="logout()">YES</button>
            </div>
        </div>
    </div>
</div>
<%----%>

<div class="container mt-3">
    <div class="card bg-light  ">
        <h4 class="display-6 mx-auto">HOSPITAL MANAGEMENT SYSTEM</h4>
    </div>
    <div class="mx-auto  bg-light px-4 col-sm-12 col-lg-12 mt-4 py-4">
        <div class="">
            <div class="contact  sm-px-2 lg-px-4 sm-my-2 lg-my-5">
                <h1>Contact Form</h1>
                <form id="contact_form" name="contact_form" method="post">
                    <div class="mb-5 row">
                        <div class="col">
                            <label>First Name</label>
                            <input type="text" required maxlength="50" class="form-control" id="first_name"
                                   name="first_name">
                        </div>
                        <div class="col">
                            <label>Last Name</label>
                            <input type="text" required maxlength="50" class="form-control" id="last_name"
                                   name="last_name">
                        </div>
                    </div>
                    <div class="mb-5 row">
                        <div class="col">
                            <label for="email_addr">Email address</label>
                            <input type="email" required maxlength="50" class="form-control" id="email_addr"
                                   name="email"
                                   placeholder="name@example.com">
                        </div>
                        <div class="col">
                            <label for="phone_input">Phone</label>
                            <input type="tel" required maxlength="50" class="form-control" id="phone_input"
                                   name="Phone"
                                   placeholder="Phone">
                        </div>
                    </div>
                    <div class="mb-5">
                        <label for="message">Message</label>
                        <textarea class="form-control" id="message" name="message" rows="5"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary px-4 btn-lg">Send</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>