<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./CSS/style.css">


</head>

<body>

<div class="navigation-bar">
    <nav class="px-lg-5 navbar navbar-expand-lg navbar-light bg-pink">
        <div class="container-fluid">
            <a class="navbar-brand fs-4" href="#">RAJ BHOG</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-6 me-5">
                    <li class="nav-item ">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
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
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                </ul>

                <div class="d-flex">
                    <a class="btn btn-outline-dark me-2" href="signin.jsp" role="button">Sign In</a>
                    <a class="btn btn-outline-dark" href="signup.jsp" role="button">Sign Up</a>
                </div>

            </div>
        </div>
    </nav>
</div>

<%--Carausal Start--%>
<div class="bg-carousel-color">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
    <div class="carousel-inner px-2 py-2">
        <div class="carousel-item active">
            <div class="">
                <div class="row mx-auto">
                    <div class=" col-lg-4 col-sm-12 col-md-6 my-5">
                        <div class="card">
                            <img src="./Images/indianThali2.jpg" height="300px" width="300px" class="card-img-top" alt="...">

                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 col-md-6 my-5">
                        <div class="card">
                            <img src="./Images/resturantImage3.jpg" height="300px" width="300px" class="card-img-top" alt="...">

                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 col-md-6 my-5">
                        <div class="card">
                            <img src="./Images/fooImage3.webp" height="300px" width="300px" class="card-img-top" alt="...">

                        </div>
                    </div>
<%--                    <div class="col-lg-3 col-sm-12 col-md-6 my-5">--%>
<%--                        <div class="card">--%>
<%--                            <img src="./Images/foodImage4.jpg" height="200px" width="300px" class="card-img-top" alt="...">--%>
<%--                            --%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="">
                <div class="row mx-auto">
                    <div class=" col-lg-4 col-sm-12 col-md-6 my-5">
                        <div class="card">
                            <img src="./Images/sandwichImage1.jpg" height="300px" width="300px" class="card-img-top" alt="...">

                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 col-md-6 my-5">
                        <div class="card">
                            <img src="./Images/bergerImage1.jpg" height="300px" width="300px" class="card-img-top" alt="...">

                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 col-md-6 my-5">
                        <div class="card">
                            <img src="./Images/dosa1.jpg" height="300px" width="300px" class="card-img-top" alt="...">

                        </div>
                    </div>
<%--                    <div class="col-lg-4 col-sm-12 col-md-6 my-5">--%>
<%--                        <div class="card">--%>
<%--                            <img src="./Images/dahibara1.webp" height="200px" width="300px" class="card-img-top" alt="...">--%>

<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>

        </div>
        <div class="carousel-item">
            <div class="">
                <div class="row mx-auto">
                    <div class=" col-lg-4 col-sm-12 col-md-6 my-5">
                        <div class="card">
                            <img src="./Images/foodImage1.jpg" height="300px" width="300px" class="card-img-top" alt="...">

                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 col-md-6 my-5">
                        <div class="card">
                            <img src="./Images/foodImage5.jpg" height="300px" width="300px" class="card-img-top" alt="...">

                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 col-md-6 my-5">
                        <div class="card">
                            <img src="./Images/fooImage3.webp" height="300px" width="300px" class="card-img-top" alt="...">

                        </div>
                    </div>
<%--                    <div class="col-lg-4 col-sm-12 col-md-6 my-5">--%>
<%--                        <div class="card">--%>
<%--                            <img src="./Images/foodImage4.jpg" height="200px" width="300px" class="card-img-top" alt="...">--%>

<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
</div>
</div>
<%--Carausal End--%>

<div class="bg-dark">
    <div class="container">
        <div class="row mx-auto">
            <div class=" col-lg-3 col-sm-12 col-md-6 my-5">
                <div class="card">
                    <img src="./Images/foodImage1.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body bg-light">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Indain Thali</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">150</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-5">
                <div class="card">
                    <img src="./Images/foodImage5.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Burger</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">75</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-5">
                <div class="card">
                    <img src="./Images/fooImage3.webp" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Sandwich </h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">99</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-5">
                <div class="card">
                    <img src="./Images/foodImage4.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Chili Chicken</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">180</i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--    <div class="tableImage">--%>
    <%--        <marquee vspace="" behavior="alternate" direction="">--%>
    <%--            <a class="btn btn-outline-light bg-danger fs-4" role="button" href="bookATable">BOOK A TABLE</a>--%>
    <%--        </marquee>--%>
    <%--    </div>--%>
    <%--2nd Food Card--%>
    <div class="container">
        <div class="row mx-auto">
            <div class=" col-lg-3 col-sm-12 col-md-6 my-5">
                <div class="card">
                    <img src="./Images/sandwichImage1.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body bg-light">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Sandwich</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">150</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-5">
                <div class="card">
                    <img src="./Images/bergerImage1.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Burger</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">75</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-5">
                <div class="card">
                    <img src="./Images/dosa1.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Dosa </h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">59</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-5">
                <div class="card">
                    <img src="./Images/dahibara1.webp" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Dahibada</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">50</i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-12 my-5" style="margin-top: -20px;">
    <div class="tableImage">
        <marquee vspace="" behavior="alternate" direction="">
            <a class="btn btn-outline-light bg-danger fs-4" role="button" href="bookATable">BOOK A TABLE</a>
        </marquee>
    </div>
</div>
<%--3rd Card --%>
<div class="bg-danger">
    <div class="container">
        <div class="row mx-auto">
            <div class=" col-lg-3 col-sm-12 col-md-6 mt-5">
                <div class="card">
                    <img src="./Images/indianThali2.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body bg-light">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Indian Thali</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">180</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 mt-5">
                <div class="card">
                    <img src="./Images/chaomin1.avif" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Chaomin</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">65</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 mt-5">
                <div class="card">
                    <img src="./Images/biriyani1.cms" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Biryani </h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">149</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 mt-5">
                <div class="card">
                    <img src="./Images/samosa1.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Samosa</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">50</i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--4th Card--%>
    <div class="container">
        <div class="row mx-auto mt-5">
            <div class=" col-lg-3 col-sm-12 col-md-6 my-2">
                <div class="card">
                    <img src="./Images/sandwichImage1.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body bg-light">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Sandwich</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">150</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-2">
                <div class="card">
                    <img src="./Images/bergerImage1.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Burger</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">75</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-2">
                <div class="card">
                    <img src="./Images/dosa1.jpg" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Dosa </h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">59</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-6 my-2">
                <div class="card">
                    <img src="./Images/dahibara1.webp" height="200px" width="300px" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-lg-center fs-5 fw-bold">Dahibada</h5>
                        <div class="d-flex align-items-center">
                            <a href="#" class="btn btn-outline-danger">BUY</a>
                            <a href="#" class="btn btn-outline-success ms-auto"> <i class="fa fa-rupee">50</i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>