<%--
  Created by IntelliJ IDEA.
  User: RASHMIKANTA PANDA
  Date: 21-12-2023
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Doctors</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                    <h4 class="text-center card-header py-1 text-dark fw-bold">DOCTOR REGISTRATION</h4>
                </div>
                <div class="card bg-light">
                    <div class="card-body">
                        <form class="" action="${pageContext.request.contextPath}/admin/addDoctor" method="post">
                            <div class="row mb-3">
                                <label for="inputDName" class="col-sm-5 col-form-label">Doctor Name:</label>
                                <div class="col-sm-7 ">
                                    <input type="text" class="form-control" id="inputDName" name="name" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmailD" class="col-sm-5 col-form-label">Email Id:</label>
                                <div class="col-sm-7 ">
                                    <input type="email" class="form-control" id="inputEmailD" required
                                           placeholder="Enter email" name="email">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="qualificationSelect"
                                       class="col-sm-5 col-form-label">Qualification</label>
                                <div class="col-sm-7">
                                    <select class="form-select" id="qualificationSelect" name="Qualification">
                                        <option value="" selected disabled>Select Qualification</option>
                                        <option value="MD">MD (Doctor of Medicine)</option>
                                        <option value="DO">DO (Doctor of Osteopathic Medicine)</option>
                                        <option value="MBBS">MBBS (Bachelor of Medicine, Bachelor of Surgery)
                                        </option>
                                        <option value="MS">MS (Master of Surgery)</option>
                                        <option value="DNB">DNB (Diplomate of National Board)</option>
                                        <option value="PhD">PhD (Doctor of Philosophy)</option>

                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="specializationSelect"
                                       class="col-sm-5 col-form-label pe-1">Specialization</label>
                                <div class="col-sm-7">
                                    <select class="form-select" id="specializationSelect" name="specialization">
                                        <option value="" selected disabled>Select Specialization</option>
                                        <option value="Cardiologist">Cardiologist</option>
                                        <option value="Dermatologist">Dermatologist</option>
                                        <option value="Endocrinologist">Endocrinologist</option>
                                        <option value="Gastroenterologist">Gastroenterologist</option>
                                        <option value="Neurologist">Neurologist</option>
                                        <option value="Orthopedic Surgeon">Orthopedic Surgeon</option>
                                        <option value="Pediatrician">Pediatrician</option>
                                        <option value="Psychiatrist">Psychiatrist</option>
                                    </select>
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
                                    <input type="password" class="form-control" id="inputPassword" name="password"
                                           required>
                                </div>
                            </div>

                            <div class="text-center" id="signin-btn">
                                <button type="reset" class="btn btn-danger me-4">CLEAR</button>
                                <button type="submit" class="btn btn-success">ADD DOCTOR</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>


            <div class="col-md-9 my-5">
                <div class="card mb-2">
                    <h4 class="text-center card-header py-1 text-dark fw-bold">DOCTOR DETAILS</h4>
                </div>
                <div class="card bg-light">
                    <div class="card-body">
                        <c:if test="${not empty succMsgD}">
                            <div class="row my-0">
                                <p class="text-success text-center fs-6">${succMsgD}</p></div>
                            <c:remove var="succMsgD"/>
                        </c:if>
                        <c:if test="${not empty failMsgD}">
                            <div class="row my-0">
                                <p class="text-danger text-center fs-6">${failMsgD}</p></div>
                            <c:remove var="failMsgD"/>
                        </c:if>

                        <table class="table table-bordered table-hover table-striped table-success fs-6">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Doctor Name</th>
                                <th scope="col">Email Id</th>
                                <th scope="col">Phone No</th>
                                <th scope="col">Specialization</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="doctor" items="${allDoctors}" varStatus="loop">
                                <tr>
                                    <td class="fw-bold">${loop.index + 1}</td>
                                    <td>${doctor.name}</td>
                                    <td>${doctor.email}</td>
                                    <td>${doctor.phone}</td>
                                    <td>${doctor.specialization}</td>
                                    <td>
                                        <div class="ms-3 d-flex">
                                            <form action="admin_editDoctor.jsp" method="post">
                                                <input type="text" hidden value="${doctor.id}" name="id">
                                                <button type="submit" class="btn btn-primary btn-sm me-2">Edit</button>
                                            </form>
                                            <div>
                                                <!-- Modal Within Delete Button-->
                                                <form action="admin/delete/doctor" method="post">
                                                    <input type="text" hidden name="doctorId" value="${doctor.id}">
                                                    <button type="button" class="btn btn-danger btn-sm"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#deleteDoctorModal${doctor.id}">
                                                        Delete
                                                    </button>

                                                    <div class="modal fade" id="deleteDoctorModal${doctor.id}"
                                                         tabindex="-1"
                                                         aria-labelledby="deleteDoctorModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="deleteDoctorModalLabel">
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
                                                    <%--Modal End (Delete Doctor)--%>
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

</html>