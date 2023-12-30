<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                            <a class="nav-link" aria-current="page" href="dashboard.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="dashboard-about.jsp">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="status">Status</a>
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
                                onclick="logout()" role="">Logout</button>
                    </div>
                </div>
            </div>
        </nav>
    </div>

    <div class="container">
        <div class="bg-light">
            <div class="about px-5 py-3 mt-5">
                <h1>About Us</h1>
                <P>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sint ut, voluptate distinctio ex magni sit
                    atque velit fugit adipisci! Praesentium in odit animi assumenda voluptatem, ut consequuntur ad quod
                    dolores illo, molestias inventore maiores rerum expedita eveniet eius laborum. Est ea quaerat totam
                    corporis! Debitis recusandae nostrum rerum! Illo, placeat ab vero molestiae fugiat iusto cum
                    aspernatur enim sit, maxime sequi nulla tempore. Ex dicta itaque temporibus cum velit similique,
                    neque provident error alias iure odit nemo a corporis corrupti modi, officiis vel. Quasi, cupiditate
                    aliquid, provident non praesentium deserunt voluptatum temporibus aliquam beatae adipisci inventore
                    suscipit reiciendis, ipsa laboriosam ad ullam velit blanditiis! Voluptate labore doloremque sed
                    voluptatibus saepe, laudantium impedit nihil. Numquam at voluptates accusantium sint quia
                    repudiandae voluptas dolore, reprehenderit, perspiciatis accusamus amet praesentium ut molestiae
                    officiis maiores minima! Autem aliquam cum laudantium sed asperiores perferendis in suscipit sit
                    inventore quis magnam harum soluta earum dolores ullam tempora non, obcaecati doloremque vel dolore
                    tenetur? Delectus eligendi odio laudantium ea nam commodi vero distinctio at voluptas. Aperiam
                    tempore voluptatum sit libero? Assumenda eligendi ipsa nesciunt aliquam necessitatibus, commodi
                    cupiditate quaerat quo! Corrupti nulla iusto ad maxime corporis asperiores ex eos quas, qui cumque
                    laudantium aliquam? Nemo, similique maiores?</P>

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