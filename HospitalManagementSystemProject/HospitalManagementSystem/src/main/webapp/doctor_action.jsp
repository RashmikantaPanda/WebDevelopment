<%--
  Created by IntelliJ IDEA.
  User: RASHMIKANTA PANDA
  Date: 20-12-2023
  Time: 00:52
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<jsp:useBean id="loggedInDoctor" scope="request" type="org.oupp.hospital.model.Doctor"/>
<jsp:useBean id="loggedInD" scope="request" type="java.lang.Object"/>
<jsp:useBean id="doctorAppointments" scope="request" type="org.oupp.hospital.model.Appointment"/>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Action</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="./CSS/style.css">
    <script src="${pageContext.request.contextPath}/JS/logout.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


</head>

<body>
<%@ page import="java.io.IOException" %>
<c:if test="${ empty loggedInD}">
    <%
        try {
            session.setAttribute("failMsg", "Login to take actions");
            response.sendRedirect("doctor_login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    %>
</c:if>
<div class="navigation-bar">
    <nav class="px-lg-5  navbar navbar-expand-lg navbar-dark bg-green">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold fs-3" href="doctor_dashboard.jsp">HMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0 fs-5 me-5 ms-lg-4">
                    <li class="nav-item ms-lg-4">
                        <a class="nav-link " aria-current="page" href="doctor_dashboard.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="">Action</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
                <div class="dropdown user-dropdown ms-auto">
                    <button class="btn btn-warning dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        ${loggedInDoctor.name}
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
                <button type="button" class="btn btn-danger " onclick="doctorLogout()">YES</button>
            </div>
        </div>
    </div>
</div>
<%----%>


<div class="">
    <div class="container ">
        <div class="card bg-light  ">
            <h4 class="my-2 mx-auto fw-bold">HOSPITAL MANAGEMENT SYSTEM</h4>
            <h5 class="my-2 mx-auto text-danger">DOCTORS PAGE</h5>
        </div>
    </div>

</div>


<div class="container" style="overflow-x:auto;">

    <div class="text-center bg-info text-light my-2 fs-4 ">Appointment Status</div>
    <c:if test="${empty doctorAppointments}">
        <p class="bg-danger text-light">No appointments found.</p>
    </c:if>

    <c:if test="${not empty doctorAppointments}">

        <div class="float-end">
            <form action="#" method="get">
                <div class="mt-2">
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required>
                    <span class="input-group-btn">
                    <button type="submit" class="btn btn-default"></button>
                </span>
                </div>
            </form>
        </div>
        <div class="search-msg mt-2">
            <p class="fs-6"></p>
        </div>
        <div class="table-responsive col-12 ">

            <table class="table table-list-search table-striped table-warning text-center table-bordered table-hover">
                <thead>
                <tr class="table-success">
                    <th class="">#SL NO</th>
                    <th>Name</th>
                    <th>Disease</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                    <th>Remark</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody class="overflow-scroll">
                <c:forEach var="appointment" items="${doctorAppointments}" varStatus="loop">
                    <tr>
                        <td class="fw-bold">${loop.index + 1}</td>
                        <td>${appointment.patientName}</td>
                        <td>${appointment.disease}</td>
                        <td>${appointment.date}</td>
                        <td>${appointment.time}</td>
                        <c:choose>
                            <c:when test="${appointment.status eq 'pending'}">
                                <td class="text-danger">${appointment.status}</td>
                            </c:when>
                            <c:otherwise>
                                <td class="text-success">${appointment.status}</td>
                            </c:otherwise>
                        </c:choose>

                        <td hidden>${appointment.remark}</td>
                            <%--to achieve search functionality--%>

                        <form class="bg-transparent m-0" action="${pageContext.request.contextPath}/update/action"
                              method="post">

                            <div class="d-flex justify-content-center">
                                <input type="hidden" name="appointmentId" value="${appointment.id}">
                                <c:if test="${appointment.status  eq 'pending'}">
                                    <td style="max-width: 200px">
                                        <label>
                                            <input class="form-control overflow-scroll " value="${appointment.remark}"
                                                   name="remark">
                                        </label>
                                    </td>
                                    <td>
                                        <button class="btn btn-success btn-sm mx-2 " type="submit">Done</button>
                                    </td>
                                </c:if>


                                <c:if test="${appointment.status ne 'pending'}">
                                    <td  style="max-width: 200px">
                                        <label>
                                            <input disabled class="form-control overflow-scroll" readonly
                                                   value="${appointment.remark}">
                                        </label>
                                    </td>
                                    <td>
                                        <button class="btn btn-dark btn-sm mx-2" disabled type="submit">Done</button>
                                    </td>
                                </c:if>
                            </div>
                        </form>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

</div>

</body>
<script>

    $(document).ready(function () {
        var activeSystemClass = $('.list-group-item.active');

        //something is entered in search form
        $('#system-search').keyup(function () {
            var that = this;
            // affect all table rows on in systems table
            var tableBody = $('.table-list-search tbody');
            var searchMsg = $('.search-msg p');
            var tableRowsClass = $('.table-list-search tbody tr');
            $('.search-sf').remove();
            tableRowsClass.each(function (i, val) {

                //Lower text for case insensitive
                var rowText = $(val).text().toLowerCase();
                var inputText = $(that).val().toLowerCase();
                if (inputText != '') {
                    $('.search-query-sf').remove();
                    searchMsg.prepend('<p class="search-query-sf mt-3">Searching for: "'
                        + $(that).val()
                        + '"</p>');
                } else {
                    $('.search-query-sf').remove();
                }

                if (rowText.indexOf(inputText) == -1) {
                    //hide rows
                    tableRowsClass.eq(i).hide();

                } else {
                    $('.search-sf').remove();
                    tableRowsClass.eq(i).show();
                }
            });
            //all tr elements are hidden
            if (tableRowsClass.children(':visible').length == 0) {
                tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="10">No entries found.</td></tr>');
            }
        });
    });
</script>
</html>
