<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Products</title>
    <style>
        .product-details {
            position: static;
        }

        .sort {
            position: fixed;
        }
    </style>
</head>
<body>
<div class="d-flex">
    <div class="dropdown user-dropdown ms-auto my-1 me-3 sort">
        <button class="btn btn-light dropdown-toggle border"
                data-bs-toggle="dropdown" aria-expanded="false">Sort by</button>
        <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item"
                   href="/user/view_all_products?value=price_high_to_low"> Price
                -- High to Low</a></li>
            <li><a class="dropdown-item"
                   href="/user/view_all_products?value=price_low_to_high"> Price
                -- Low to High</a></li>
            <li><a class="dropdown-item"
                   href="/user/view_all_products?value=name_a_to_z"> Name
                -- a to z</a></li>
            <li><a class="dropdown-item"
                   href="/user/view_all_products?value=name_z_to_a"> Name
                -- z to a</a></li>
            <li><a class="dropdown-item" href="/user/view_all_products">Default</a></li>
        </ul>
    </div>
</div>
<div class="container product-details">
    <div class="row">
        <c:forEach var="item" items="${allProducts}" varStatus="loop">
            <div class="col-3 mb-5 mx-auto">
                <div class="border shadow">
                    <div class="p-3">
                        <img src="../static/Img/${item.imageName}" class="card-img-top"
                             alt="..asdfasdf." height="180" width="80">
                    </div>
                    <div class="card-body">
                        <h6 class="card-title fw-bold ">${item.productName }</h6>
                            ${item.category }
                        <c:if test="${item.quantity <= 0}">
                            <p class="my-1" style="font-size: 14px">

                                <span class="badge bg-danger"> Out of Stock </span>
                            </p>
                        </c:if>
                        <c:if test="${item.quantity > 0}">
                            <p class="my-1" style="font-size: 14px">
                                <span class="badge bg-success"> Available </span>
                            </p>
                        </c:if>
                        <h4>&#x20b9 ${item.price.toString().substring(0, item.price.toString().length() - 2) }
                        </h4>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>