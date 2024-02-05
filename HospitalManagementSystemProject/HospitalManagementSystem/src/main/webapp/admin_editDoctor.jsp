<%--
  Created by IntelliJ IDEA.
  User: RASHMIKANTA PANDA
  Date: 23-12-2023
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Doctor</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./CSS/style.css">


</head>

<body>

<%@ page import="java.io.IOException" %>
<%@ page import="org.oupp.hospital.model.Doctor" %>
<%@ page import="org.oupp.hospital.dao.DoctorDao" %>
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
            <a class="navbar-brand fw-bold fs-3" href="index.jsp">HMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-5 me-5 ">
                    <li class="nav-item ">
                        <a class="nav-link active" aria-current="page" href="admin_dashboard.jsp">Home</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</div>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    DoctorDao doctorDao=new DoctorDao();
    Doctor doctor= doctorDao.getDoctorById(id);
    System.out.println(doctor.getName());
%>

<div class="container">
    <div class="row" id="login">
        <div class="col-md-6 mx-auto my-5">
            <div class="card mb-2">
                <h4 class="text-center card-header py-1 text-dark fw-bold">EDIT DOCTOR</h4>
            </div>
            <div class="card bg-light">
                <div class="card-body">
                    <form class="fw-bold" action="${pageContext.request.contextPath}/doctor/edit" method="post">
                        <div class="row mb-3 mt-4" hidden>
                            <label for="doctorName" class="col-sm-3 col-form-label">Doctor ID:</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" id="doctorId" name="id"  value="<%= doctor.getId()%>" required>
                            </div>
                        </div>

                        <div class="row mb-3 mt-4">
                            <label for="doctorName" class="col-sm-3 col-form-label">Doctor Name:</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" id="doctorName" name="name"  value="<%= doctor.getName()%>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="emailId" class="col-sm-3 col-form-label">Email Id:</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" id="emailId" name="email"  value=<%= doctor.getEmail()%>  required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="phoneno" class="col-sm-3 col-form-label">Phone No:</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" id="phoneno" name="phone" value=<%= doctor.getPhone()%> required>
                            </div>
                        </div>


                        <div class="row mb-3">
                            <label for="specializationSelect" class="col-sm-3 col-form-label">Specialization</label>
                            <div class="col-sm-9">
                                <select class="form-select" id="specializationSelect" name="specialization" required>
                                    <option value=<%= doctor.getSpecialization()%> selected ><%= doctor.getSpecialization()%></option>
                                    <option value="Cardiologist">Cardiologist</option>
                                    <option value="Dermatologist">Dermatologist</option>
                                    <option value="Endocrinologist">Endocrinologist</option>
                                    <option value="Gastroenterologist">Gastroenterologist</option>
                                    <option value="Medicine">Medicine</option>
                                    <option value="Neurologist">Neurologist</option>
                                    <option value="Orthopedic Surgeon">Orthopedic Surgeon</option>
                                    <option value="Pediatrician">Pediatrician</option>
                                    <option value="Psychiatrist">Psychiatrist</option>
                                    <option value="Pathologist">Pathologist</option>
                                    <option value="Skin & VD">Skin & VD</option>
                                    <option value="Surgery">Surgery</option>
                                    <option value="Sexuality">Sexuality</option>
                                </select>
                            </div>
                        </div>



                        <div class="row mb-4">
                            <label for="inputPassword" class="col-sm-3 col-form-label">Password :</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="inputPassword" name="password" value=<%= doctor.getPassword()%> required>
                            </div>
                        </div>


                        <div class="row mb-4">
                            <label for="confirmPassword" class="col-sm-3 col-form-label">Confirm Password :</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" value=<%= doctor.getPassword()%> required>
                            </div>
                        </div>

                        <div class="text-center" id="signin-btn">
                            <button type="reset" class="btn btn-danger me-2">RESET</button>
                            <button type="submit" class="btn btn-success ms-2">UPDATE</button>
                        </div>

                        <div class="text-center mt-3" id="signup-text">
                            <a href="" class="text-decoration-none text-dark " id="dontHaveAcc">Don't want to update ?</a>
                            <a class="text-decoration-none " id="needHelp" href="${pageContext.request.contextPath}/allDoctors">Go Back</a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



</body>

</html>
