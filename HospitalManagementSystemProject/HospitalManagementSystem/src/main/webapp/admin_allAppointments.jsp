<%--
  Created by IntelliJ IDEA.
  User: USER 111
  Date: 23-12-2023
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
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
    <title>All Appointments</title>

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
        <div class="mx-5 my-5">
            <div class="card mb-2">
                <h4 class="text-center card-header py-1 text-dark fw-bold">APPOINTMENT DETAILS</h4>
            </div>
            <div class="card bg-white">
                <div class="card-body">
                    <table class="table table-bordered table-hover table-striped table-warning fs-6">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Patient Name</th>
                            <th scope="col">Disease</th>
                            <th scope="col">Doctor</th>
                            <th scope="col">Date</th>
                            <th scope="col">Time</th>
                            <th scope="col">Status</th>
                            <th scope="col">Remark</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="appointment" items="${allAppointments}" varStatus="loop">
                            <tr>
                                <td class="fw-bold">${loop.index + 1}</td>
                                <td>${appointment.patientName}</td>
                                <td>${appointment.disease}</td>
                                <td>${appointment.doctorName}</td>
                                <td>${appointment.date}</td>
                                <td>${appointment.time}</td>
                                <c:if test="${appointment.status eq 'pending'}">
                                    <td class="text-danger ">${appointment.status}</td>
                                </c:if>
                                <c:if test="${appointment.status ne 'pending'}">
                                    <td class="text-success fs-6 ">${appointment.status}</td>
                                </c:if>
                                <td class="col-2"><textarea class="form-control" readonly>${appointment.remark}</textarea></td>
                                <td>
                                    <div class="ms-3">
                                        <button type="button" class="btn btn-primary btn-sm">Edit</button>
                                        <button type="button" class="btn btn-danger btn-sm">Delete</button>
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

</body>
</html>