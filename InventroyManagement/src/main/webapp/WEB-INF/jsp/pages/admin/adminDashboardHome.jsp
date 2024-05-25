<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style>
        .card:hover {
            transform: scale(1.05);
            transition: transform 0.3s ease; /* Add smooth transition */
        }
    </style>
</head>
<body>
<div class="container text-center col-8 mt-5">
    <div class="row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <div class="cards text-bg-info bg-light shadow">
                <div class="card-body text-bg-info">
                    <img src="../static/Img/product-shelf-svgrepo-com.svg" height="70"
                         width="70">
                    <h5 class="card-title">Products</h5>
                    <p class="card-text fs-1">${allActiveProducts.size() }</p>
                    <a href="view_all_products" class="btn btn-primary">View
                        Products</a>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="cards text-bg-secondary bg-light shadow">
                <div class="card-body">
                    <img src="../static/Img/category-svgrepo-com.svg" height="70"
                         width="70">
                    <h5 class="card-title">Categories</h5>
                    <p class="card-text fs-1">${allCategories.size() }</p>
                    <a href="view_category" class="btn btn-dark">View Categories</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container text-center col-8 mt-5">
    <div class="row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <div class="cards text-bg-secondary bg-light shadow">
                <div class="card-body">
                    <img src="../static/Img/usersImage.svg" height="70" width="70">
                    <h5 class="card-title">Users</h5>
                    <p class="card-text fs-1">${allUsers.size()}</p>
                    <a href="/admin/view_users" class="btn btn-success">View Users</a>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="cards text-bg-info bg-light shadow">
                <div class="card-body">
                    <img src="../static/Img/sale-tag-for-online-shops-svgrepo-com.svg"
                         height="70" width="70">
                    <h5 class="card-title">Total Sale</h5>
                    <p class="card-text fs-1">${totalSoldItem}</p>
                    <a href="view_sell_history" class="btn btn-danger">View</a>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>