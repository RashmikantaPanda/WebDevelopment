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

    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <style>
        .bg-image {
            background-image: url('https://source.unsplash.com/kKvQJ6rK6S4/660x1000');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
    </style>

</head>

<body>

    <div class="navigation-bar">
        <nav class="px-lg-5 navbar navbar-expand-lg navbar-light bg-pink">
            <div class="container-fluid">
                <a class="navbar-brand fs-4" href="index.jsp">RAJ BHOG</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-6 me-5">
                        <li class="nav-item ">
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">About</a>
                        </li>
                        <!-- <li class="nav-item">
                            <a class="nav-link" href="#">Service</a>
                        </li> -->
                        <li class="nav-item">
                            <a class="nav-link" href="signin.jsp">Booking</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="contact.jsp">Contact</a>
                        </li>


                    </ul>
                
                </div>
            </div>
        </nav>
    </div>

    <div class="container col-lg-6">
        <div class="card my-5 bg-info">
            <div class="px-lg-5  py-lg-3 py-sm-2 mx-3">
                <h4 class="card-title">Contact Form</h4>
                <form id="contact_form" name="contact_form" method="post">
                    <div class="mb-5 row">
                        <div class="col-lg-6 col-sm-12 col-md-6">
                            <label>First Name</label>
                            <input type="text" required maxlength="50" class="form-control" id="first_name" name="first_name">
                        </div>
                        <div class="col-lg-6 col-sm-12 col-md-6">
                            <label>Last Name</label>
                            <input type="text" required maxlength="50" class="form-control" id="last_name" name="last_name">
                        </div>
                    </div>
                    <div class="mb-5 row">
                        <div class="col-lg-6 col-sm-12 col-md-6">
                            <label for="email_addr">Email address</label>
                            <input type="email" required maxlength="50" class="form-control" id="email_addr" name="email"
                                placeholder="name@example.com">
                        </div>
                        <div class="col-lg-6 col-sm-12 col-md-6">
                            <label for="phone_input">Phone</label>
                            <input type="tel" required maxlength="50" class="form-control" id="phone_input" name="Phone"
                                placeholder="Phone">
                        </div>
                    </div>
                    <div class="mb-5 col-12">
                        <label for="message">Message</label>
                        <textarea class="form-control" id="message" name="message" rows="5"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary px-4 btn-lg">Send</button>
                </form>
            </div>
        </div>
    </div>

</body>

</html>