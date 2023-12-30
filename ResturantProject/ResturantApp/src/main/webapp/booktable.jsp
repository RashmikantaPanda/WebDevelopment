<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./CSS/style.css">
    <link rel="stylesheet" href="./CSS/tableBookingCss.css">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>
<div class="navigation-bar">
    <nav class="px-lg-5 navbar navbar-expand-lg navbar-light bg-pink">
        <div class="container-fluid">
            <a class="navbar-brand fs-4" href="dashboard.jsp">RAJ BHOG</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-6 me-5">
                    <li class="nav-item "><a class="nav-link "
                                             aria-current="page" href="dashboard.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="dashboard-about.jsp">About</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="status">Status</a>
                    </li>
                    <li class="nav-item"><a class="nav-link active" href="#">Booking</a></li>
                    <li class="nav-item"><a class="nav-link" href="dashboard-contact.jsp">Contact</a>
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


<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>Table Booking</h3>
            </div>
            <div class="card-body">
                <form action="booking">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="username" value=""
                               name="username">

                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-envelope-open"></i></span>
                        </div>
                        <input type="email" class="form-control" placeholder="email"
                               value="<%= session.getAttribute("UserName") != null ? session.getAttribute("UserName") : "" %>"
                               name="email" readonly>

                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-phone"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="phone no" name="phoneno">

                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                        </div>
                        <input type="date" class="form-control" name="date">

                    </div>

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <input type="time" class="form-control" placeholder="select time" name="time">

                    </div>

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-group"></i></span>
                        </div>
                        <%--                            <input type="text" class="form-control" name="partySize" pattern="^[1-9]" placeholder="party size">--%>
                        <input type="number" class="form-control" name="partySize" placeholder="party size" min="1"
                               max="20" required>

                    </div>


                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-table"></i></span>
                        </div>
                        <input type="number" class="form-control" name="tableId" placeholder="table number">

                    </div>

                    <div class="form-group">
                        <input type="submit" value="Book Table" class="btn float-right login_btn">
                    </div>
                    <div class="form-group">
                        <input type="reset" value="Reset" class="btn float-left btn btn-danger">
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center links">
                    <a class="nav-link text-success" href="#">Show available tables</a>
                </div>
            </div>
        </div>
    </div>
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