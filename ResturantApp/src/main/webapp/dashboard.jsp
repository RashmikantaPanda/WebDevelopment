<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
	</script>
<link rel="stylesheet" href="./CSS/dashboardCss.css">


</head>

<body>

	<div class="navigation-bar">
		<nav class="px-lg-5 navbar navbar-expand-lg navbar-light bg-pink">
			<div class="container-fluid">
				<a class="navbar-brand fs-4" href="#">RAJ BHOG</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-6 me-5">
						<li class="nav-item "><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="dashboard-about.jsp">About</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="status">Status</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="booktable.jsp">Booking</a></li>
						<li class="nav-item"><a class="nav-link" href="dashboard-contact.jsp">Contact</a>
						</li>


					</ul>
					<div class="d-flex">
							<a class="btn bg-success text-light me-2" href="#" role="button">${UserName}</a>

							<button class="btn bg-danger bg-outline-light text-light me-2 fw-bold logoutBtn"
							 onclick="logout()" role="">Logout</button>
					</div>
				</div>
			</div>
		</nav>
	</div>

	<div class="container">
		<div class="tableImage">
				<a class="btn btn-outline-light bg-danger fs-4" role="" href="bookATable">BOOK A TABLE</a>
		</div>
	</div>

</body>
<!-- Include SweetAlert library (you can adjust the version and source) -->
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