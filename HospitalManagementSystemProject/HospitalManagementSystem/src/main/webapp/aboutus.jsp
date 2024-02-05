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
    <title>About Us</title>

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
                        <a class="nav-link active" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contactus.jsp">Contact</a>
                    </li>
                </ul>

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
                    <br>
                    Expert Healthcare Professionals: Our team of skilled doctors, nurses, and support staff is
                    dedicated to ensuring your health and comfort.
                    Cutting-edge Facilities: We invest in the latest medical technologies and facilities to provide
                    accurate diagnoses and effective treatments.
                    Patient-Centered Care: Your health and happiness are our top priorities. We strive to create a
                    warm and welcoming environment for all our patients.
                    Community Engagement: We actively participate in community outreach programs and initiatives to
                    promote health awareness and education.
                    Services We Offer:

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

</body>

</html>
