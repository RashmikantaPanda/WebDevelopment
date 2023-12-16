<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ page import="java.util.List" %>
<%@ page import="org.oupp.resturant.model.TableBooking" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./CSS/style.css">
    <link rel="stylesheet" href="./CSS/statusCss.css">

</head>

<body>

<div class="navigation-bar">
    <nav class="px-lg-5 navbar navbar-expand-lg navbar-light bg-pink">
        <div class="container-fluid">
            <a class="navbar-brand fs-4" href="dashboard.jsp">RAJ BHOG</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-6 me-5">
                    <li class="nav-item ">
                        <a class="nav-link " aria-current="page" href="dashboard.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard-about.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Status</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="booktable.jsp">Booking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard-contact.jsp">Contact</a>
                    </li>


                </ul>
                <div class="d-flex">
                    <a class="btn bg-success text-light me-2" href="#" role="button">${UserName}</a>

                    <button class="btn bg-danger bg-outline-light text-light me-2 fw-bold logoutBtn"
                            onclick="logout()" role="">Logout
                    </button>
                </div>
            </div>
        </div>
    </nav>
</div>

<div class="container" style="overflow-x:auto;">

    <div class="text-center bg-danger text-light my-2 fs-4 ">Booking Status</div>
    <c:if test="${empty bookingList}">
        <p class="bg-pink text-light">No bookings found.</p>
    </c:if>

    <c:if test="${not empty bookingList}">
        <div class="table-responsive">

            <table class="table table-striped bg-light text-center table-hover">
                <thead>
                <tr class="table-success">
                    <th class="">#SL NO</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Party Size</th>
                    <th>Table No</th>
                    <th>Status</th>
                    <th>Remark</th>
                </tr>
                </thead>
                <tbody class="overflow-scroll">
                <c:forEach var="booking" items="${bookingList}" varStatus="loop">
                    <tr>
                        <td class="">${loop.index + 1}</td>
                        <td>${booking.date}</td>
                        <td>${booking.time}</td>
                        <td>${booking.partySize}</td>
                            <%--                    <td>${booking.customerName}</td>--%>
                            <%--                    <td>${booking.phoneno}</td>--%>
                        <td>${booking.tableId}</td>
                        <c:choose>
                            <c:when test="${booking.status eq 1}">
                                <td class="text-success fw-bold">Success</td>
                            </c:when>
                            <c:when test="${booking.status eq 0}">
                                <td class="text-danger fw-bold">Rejected</td>
                            </c:when>
                            <c:otherwise>
                                <td class="text-warning fw-bold">Pending</td>
                            </c:otherwise>
                        </c:choose>

                            <%--                    <td style="width: 250px"><p class="overflow-auto">${booking.remark}</p></td>--%>
                        <td style="max-width: 100px"><input readonly class="form-control overflow-scroll"
                                                            value="${booking.remark}"></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

</div>

</body>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    function logout() {
        // Make an AJAX request to the server to invalidate the session
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "LogoutServlet", true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    // Redirect to the login page after successful logout
                    Swal.fire({
                        icon: 'success',
                        title: 'Logged Out!',
                        text: 'You have been logged out successfully.',
                        timer: 5000,
                    });
                    setTimeout(function () {
                        window.location.href = "index.jsp";
                    }, 3000);
                } else {
                    // Display a SweetAlert if logout fails
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Logout failed. Please try again.',
                    });
                }
            }
        };
        xhr.send();

        // Display a SweetAlert for successful logout

    }
</script>


</html>