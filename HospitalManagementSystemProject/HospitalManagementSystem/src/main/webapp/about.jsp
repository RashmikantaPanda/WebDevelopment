<%--
  Created by IntelliJ IDEA.
  User: RASHMIKANTA PANDA
  Date: 17-12-2023
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>

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
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-5 me-5">
                    <li class="nav-item ">
                        <a class="nav-link " aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="">About</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>


                </ul>

                <div class="dropdown">
                    <button class="btn btn-warning dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        Login
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="patient_login.jsp">Patient</a></li>
                        <li><a class="dropdown-item" href="doctor_login.jsp">Doctor</a></li>
                        <li><a class="dropdown-item" href="admin_login.jsp">Admin</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>

<div class="">
    <div class="container mt-3">
        <div class="card bg-light">
            <h4 class="display-6 mx-auto ">HOSPITAL MANAGEMENT SYSTEM</h4>
        </div>
        <div class="mx-auto">
            <div class="bg-light">
                <div class="about px-5 py-3 mt-5">
                    <h1>About Us</h1>
                    <P>We are committed to providing exceptional healthcare services with a focus on patient well-being
                        and satisfaction. Our state-of-the-art facilities, dedicated medical professionals, and
                        patient-centric approach make us a reliable healthcare partner for individuals and families.

                        Our Mission:
                        <b>To deliver high-quality, compassionate healthcare services</b> that promote the well-being of
                        our community and exceed the expectations of our patients.
                        <br>
                    <div class="container">
                        <ul class="list-group mt-4">
                            <li class="list-group-item">Comprehensive Medical Check-ups</li>
                            <li class="list-group-item">Specialized Treatment Programs</li>
                            <li class="list-group-item">Emergency and Critical Care</li>
                            <li class="list-group-item">Advanced Diagnostics</li>
                            <li class="list-group-item">Surgical Services</li>
                            <li class="list-group-item">Maternity and Pediatric Care</li>
                        </ul>

                        <p class="mt-4 fw-bold">Our Commitment to Excellence:</p>
                        <p>We adhere to the highest standards of medical excellence, ethics, and patient safety. Our
                            commitment to continuous improvement ensures that we evolve with the changing needs of our
                            community.</p>
                    </div>


                    </P>

                </div>
            </div>
        </div>

    </div>

</div>


</body>

</html>
