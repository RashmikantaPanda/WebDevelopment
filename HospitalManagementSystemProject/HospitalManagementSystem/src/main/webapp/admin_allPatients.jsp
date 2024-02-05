<%--
  Created by IntelliJ IDEA.
  User: USER 111
  Date: 23-12-2023
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Patients</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="${pageContext.request.contextPath}/JS/logout.js"></script>

    <link rel="stylesheet" href="./CSS/style.css">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>


</head>

<body>
<%@ page import="java.io.IOException" %>
<c:if test="${ empty loggedInA}">
    <%
        try {
            session.setAttribute("failMsg", "Login to view doctors");
            response.sendRedirect("admin_login.jsp");
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    %>
</c:if>
<div class="navigation-bar">
    <nav class="px-lg-5  navbar navbar-expand-lg navbar-dark bg-green">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold fs-3" href="admin_dashboard.jsp">HMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav  mb-2 mb-lg-0 fs-5 me-5 ms-4">
                    <li class="nav-item ">
                        <a class="nav-link active" aria-current="page" href="admin_dashboard.jsp">Home</a>
                    </li>

                </ul>


                <div class="dropdown user-dropdown ms-auto">
                    <button class="btn btn-warning dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        ${loggedInAdmin.name}
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


<div class="card mx-3 mt-5 mb-3 bg-light">
    <div class="mx-4">
        <div class="row" id="reigstration">
            <div class="col-md-3  mx-auto my-5">
                <div class="card mb-2">
                    <h4 class="text-center card-header py-1 text-dark fw-bold">PATIENT REGISTRATION</h4>
                </div>
                <div class="card bg-light">
                    <div class="card-body">
                        <form class="" action="${pageContext.request.contextPath}/admin/addPatient" method="post">
                            <div class="row mb-3">
                                <label for="inputDName" class="col-sm-5 col-form-label">Patient Name:</label>
                                <div class="col-sm-7 ">
                                    <input type="text" class="form-control" id="inputDName" name="name" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmailD" class="col-sm-5 col-form-label">Email Id:</label>
                                <div class="col-sm-7 ">
                                    <input type="email" class="form-control" id="inputEmailD" name="email" required
                                           placeholder="Enter your email">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="phone" class="col-sm-5 col-form-label">Phone No:</label>
                                <div class="col-sm-7 ">
                                    <input type="text" class="form-control" id="phone" name="phone">
                                </div>
                            </div>

                            <div class="row mb-4">
                                <label for="inputPassword" class="col-sm-5 col-form-label">Password :</label>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control" id="inputPassword" name="password">
                                </div>
                            </div>

                            <div class="text-center" id="signin-btn">
                                <button type="reset" class="btn btn-danger me-4">CLEAR</button>
                                <button type="submit" class="btn btn-success">ADD Patient</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>


            <div class="col-md-9 my-5">
                <div class="card mb-2">
                    <h4 class="text-center card-header py-1 text-dark fw-bold">PATIENT DETAILS</h4>
                </div>
                <div class="card bg-light">
                    <div class="card-body">

                        <c:if test="${not empty succMsgP}">
                            <div class="row my-0">
                                <p class="text-success text-center fs-6">${succMsgP}</p></div>
                            <c:remove var="succMsgD"/>
                        </c:if>
                        <c:if test="${not empty failMsgP}">
                            <div class="row my-0">
                                <p class="text-danger text-center fs-6">${failMsgP}</p></div>
                            <c:remove var="failMsgD"/>
                        </c:if>

                        <table class="table table-bordered table-hover table-striped table-primary fs-6">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Patient Name</th>
                                <th scope="col">Email Id</th>
                                <th scope="col">Phone No</th>
                                <th scope="col">Password</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="patient" items="${allPatients}" varStatus="loop">
                                <tr>
                                    <td class="fw-bold">${loop.index + 1}</td>
                                    <td>${patient.name}</td>
                                    <td>${patient.email}</td>
                                    <td>${patient.phone}</td>
                                        <%--                                    <td class="">${patient.password}</td>--%>
                                    <td class="col-2">
                                        <div class="input-group">
                                            <input type="password" class="form-control" value="${patient.password}"
                                                   id="passwordInput${loop.index}" readonly>
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-secondary" type="button"
                                                        id="togglePassword${loop.index}">
                                                    <i class="fa fa-eye-slash" aria-hidden="true"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="ms-3 d-flex">
                                            <form action="admin_editPatient.jsp" method="post">
                                                <input type="text" hidden value="${patient.id}" name="id">
                                                <button type="submit" class="btn btn-primary btn-sm me-2">Edit</button>
                                            </form>
                                            <div>
                                                <!-- Modal Within Delete Button-->
                                                <form action="admin/delete/patient" method="post">
                                                    <input type="text" hidden name="patientId" value="${patient.id}">
                                                    <button type="button" class="btn btn-danger btn-sm"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#deletePatientModal${patient.id}">
                                                        Delete
                                                    </button>

                                                    <div class="modal fade" id="deletePatientModal${patient.id}"
                                                         tabindex="-1"
                                                         aria-labelledby="deletePatientModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="deletePatientModal">
                                                                        Are you sure to delete?</h5>
                                                                    <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal"
                                                                            aria-label="Close"></button>
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-bs-dismiss="modal">No
                                                                    </button>
                                                                        <%--                                                                    <input type="text" hidden name="id" value="${doctor.id}">--%>
                                                                    <button type="submit" class="btn btn-danger">Yes
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                    <%--Modal End (Delete Patient)--%>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
<script>
    $(document).ready(function () {
        <c:forEach var="patient" items="${allPatients}" varStatus="loop">
        $("#togglePassword${loop.index}").on("click", function () {
            var passwordInput = $("#passwordInput${loop.index}");
            var icon = $("#togglePassword${loop.index} i");

            if (passwordInput.attr("type") === "password") {
                passwordInput.attr("type", "text");
                icon.removeClass("fa-eye-slash");
                icon.addClass("fa-eye");
            } else {
                passwordInput.attr("type", "password");
                icon.removeClass("fa-eye");
                icon.addClass("fa-eye-slash");
            }
        });
        </c:forEach>
    });
</script>

</html>