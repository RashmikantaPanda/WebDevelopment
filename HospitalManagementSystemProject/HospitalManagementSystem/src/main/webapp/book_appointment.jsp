<%--
  Created by IntelliJ IDEA.
  User: RASHMIKANTA PANDA
  Date: 17-12-2023
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookAppointment</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="${pageContext.request.contextPath}/JS/logout.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

</head>

<body>
<%@ page import="java.io.IOException" %>
<%@ page import="org.oupp.hospital.dao.DoctorDao" %>
<%@ page import="java.util.List" %>
<c:if test="${ empty loggedIn}">
    <%
        try {
            response.sendRedirect("patient_login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    %>
</c:if>
<%
    DoctorDao doctorDao = new DoctorDao();
    List<String> doctors = doctorDao.getDoctorNames();
    session = request.getSession(false);
    session.setAttribute("doctors", doctors);
%>
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
                <ul class="navbar-nav  mb-2 mb-lg-0 fs-5 me-5 ms-4">
                    <li class="nav-item ms-lg-4">
                        <a class="nav-link" aria-current="page" href="patient_dashboard.jsp">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="patient/booknow">BookNow</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="patient/status">Appointments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutus.jsp">About</a>
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
                        <li>
                            <form class="" action="patient_edit.jsp" method="post">
                                <input type="text" name="id" value=${loggedInPatient.id} hidden>
                                <button class="dropdown-item border-0" type="submit"><i
                                        class="fa fa-pencil"></i>
                                    Edit</button>
                            </form>
                        </li>
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

<div class="container">
    <div class="row" id="login">
        <div class="col-md-6 mx-auto my-5">
            <div class="card mb-2">
                <h4 class="text-center card-header py-1 text-dark fw-bold">SCHEDULE APPOINTMENT</h4>
            </div>
            <div class="card bg-light">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/patient/bookAppointment" method="post">
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
                            <label for="patientName" class="col-sm-3 col-form-label">Patient Name</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" id="patientName" name="patientName"
                                       value="${loggedInPatient.name}">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="patientEmail" class="col-sm-3 col-form-label">Patient Email</label>
                            <div class="col-sm-9 ">
                                <input readonly type="text" class="form-control" id="patientEmail" name="patientEmail"
                                       value="${loggedInPatient.email}">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="diseaseName" class="col-sm-3 col-form-label">Disease Name</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" id="diseaseName" name="diseaseName" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="phone" class="col-sm-3 col-form-label">Phone No:</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" id="phone" name="phone"
                                       value="${loggedInPatient.phone}">
                            </div>
                        </div>


                        <div class="row mb-3">
                            <label for="doctorSelect" class="col-sm-3 col-form-label">Doctor</label>
                            <div class="col-sm-9">
                                <select class="form-select" id="doctorSelect" name="doctorName" required>
                                    <option value="" selected disabled>Select Doctor</option>
                                    <c:forEach var="doctor" items="${doctors}">
                                        <option value="${doctor}">${doctor}</option>
                                    </c:forEach>

                                </select>
                            </div>
                        </div>


                        <div class="row mb-4">
                            <label for="AppointmentDate" class="col-sm-3 col-form-label">Date :</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" id="AppointmentDate" name="date" required>
                            </div>
                        </div>


                        <div class="row mb-4">
                            <label for="AppointmentTime" class="col-sm-3 col-form-label">Time</label>
                            <div class="col-sm-9">
                                <input type="time" class="form-control" id="AppointmentTime" name="time" required>
                            </div>
                        </div>

                        <div class="row mb-4">
                            <label for="address" class="col-sm-3 col-form-label">Address</label>
                            <div class="col-sm-9">
                                <textarea type="text" class="form-control" id="address" name="address"
                                          placeholder="Enter your address"></textarea>
                            </div>
                        </div>

                        <div class="text-center" id="signin-btn">
                            <button type="reset" class="btn btn-danger me-2">Clear</button>
                            <button type="submit" class="btn btn-success ms-2">Book Now</button>
                        </div>

                        <div class="text-center mt-3" id="signup-text">
                            <a href="${pageContext.request.contextPath}/patient/status"
                               class="text-decoration-none text-dark" id="dontHaveAcc">View Your
                                Appointments</a>
                            <a class="text-decoration-none" id="needHelp" href="patient/status">Click Here</a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>