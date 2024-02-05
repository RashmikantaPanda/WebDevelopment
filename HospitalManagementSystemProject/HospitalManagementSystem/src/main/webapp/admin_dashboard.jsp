<%--
  Created by IntelliJ IDEA.
  User: RASHMIKANTA PANDA
  Date: 17-12-2023
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AdminDashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="${pageContext.request.contextPath}/JS/logout.js"></script>

    <link rel="stylesheet" href="./CSS/style.css">



</head>

<body>

<%@ page import="java.io.IOException" %>
<c:if test="${ empty loggedInA}">
    <%
        try {
            session.setAttribute("failMsg","Login to view dashboard");
            response.sendRedirect("admin_login.jsp");
        } catch (IOException e ) {
            System.out.println(e.getMessage());
        }
    %>
</c:if>
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
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="doctor_registration.jsp">Add octors</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="">View Recordes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="">Contact</a>
                    </li>
                </ul>

                <div class="dropdown">
                    <button class="btn btn-warning dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        ${loggedInAdmin.name}
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#"><i class="fa fa-pencil"></i> Edit</a></li>
                        <li><button class="dropdown-item text-danger"  data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-sign-out text-dark"></i>
                            Logout</button></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>

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
                <button type="button" class="btn btn-danger " onclick="adminLogout()">YES</button>
            </div>
        </div>
    </div>
</div>


<div style="min-height: 92vh; background-color: bisque">
    <div class="container pt-3">
        <div class="card bg-light  ">
            <h2 class="mx-auto my-2">HOSPITAL MANAGEMENT SYSTEM</h2>
            <h5 class="mx-auto  text-danger">ADMIN HOME</h5>
        </div>
    </div>
    <div class="container ">
        <div class="row mx-auto mt-5 justify-content-center">
            <div class="col-lg-3 col-sm-12 col-md-6 my-5 text-center">
                <a href="${pageContext.request.contextPath}/allDoctors" class="text-decoration-none">
                    <div class="card">
                        <img src="./Images/doctorImage2.webp" height="200px" width="400px" class="card-img-top"
                             alt="...">
                        <div class="card-body bg-danger text-light">
                            <h5 class="card-title text-lg-center fs-5 fw-bold">Doctors</h5>
                            <div class="d-flex align-items-center">

                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-5">
                <a href="${pageContext.request.contextPath}/allPatients" class="text-decoration-none">
                    <div class="card">
                        <img src="./Images/patientImage1.jpg" height="200px" width="400px" class="card-img-top"
                             alt="...">
                        <div class="card-body bg-info text-dark">
                            <h5 class="card-title text-lg-center fs-5 fw-bold">Patients</h5>
                            <div class="d-flex align-items-center">

                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-5">
                <a href="${pageContext.request.contextPath}/allAppointments" class="text-decoration-none">
                    <div class="card">
                        <img src="./Images/Patient-appointment-Image1.svg" height="200px" width="400px"
                             class="card-img-top"
                             alt="...">
                        <div class="card-body bg-primary text-light">
                            <h5 class="card-title text-lg-center fs-5 fw-bold">Appointments</h5>
                            <div class="d-flex align-items-center">

                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-5">
                <a href="" class="text-decoration-none">
                    <div class="card">
                        <img src="./Images/customer-care-Image1.jpg" height="200px" width="400px" class="card-img-top"
                             alt="...">
                        <div class="card-body bg-dark text-light">
                            <h5 class="card-title text-lg-center fs-5 fw-bold">Customer Support</h5>
                            <div class="d-flex align-items-center">

                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>

</body>

</html>