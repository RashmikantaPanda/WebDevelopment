<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../static/CSS/style.css">
    <style>
        .navigation-bar {
            position: fixed;
            width: 100%;
        }
    </style>
</head>

<body>
<div class="navigation-bar">
    <nav class="px-lg-5  navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold fs-3" href="dashboard">I M S</a>
            <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-6 me-5 ">
                    <li class="nav-item "><a class="nav-link active"
                                             aria-current="page"
                                             href="${pageContext.request.contextPath}/user/dashboard">HOME</a></li>
                    <li class="nav-item "><a class="nav-link active"
                                             aria-current="page"
                                             href="${pageContext.request.contextPath}/user/view_all_products">PRODUCTS</a></li>
                    <li class="nav-item "><a class="nav-link active"
                                             aria-current="page"
                                             href="${pageContext.request.contextPath}/user/view_purchased_history">HISTORY</a></li>
                </ul>



                <div class="d-flex">
                    <div class="dropdown user-dropdown ms-auto">
                        <button class="btn btn-warning dropdown-toggle" type="button"
                                data-bs-toggle="dropdown" aria-expanded="false">${loggedInUser.firstName}</button>
                        <ul class="dropdown-menu dropdown-menu-ends">
                            <li><a class="dropdown-item" href="/user/edit_profile">
                                EDIT</a></li>
                            <li><a class="dropdown-item text-danger"
                                   href="/user/logout">LOGOUT</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </nav>
</div>
</body>
</html>