<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.css" />
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
    <style type="text/css">
        .product-table {
            vertical-align: middle;
        }

        .bg-light-green {
            background-color: rgb(102, 160, 104);
        }
    </style>
    <title>Products</title>
</head>
<body>
<div class="my-2 product">
    <div class="mb-2">
        <h4
                class="text-center card-header py-2 text-light bg-warning fw-bold">PRODUCT
            DETAILS</h4>
    </div>

    <!-- Search Bar  -->
    <div class="mx-3">
        <c:if test="${not empty delSuccMsg }">
            <div class="col-md-3 mx-auto  text-center">
                <h6 class="text-center bg-light-green py-2 text-light">${delSuccMsg }</h6>
                <c:remove var="delSuccMsg" />
            </div>
        </c:if>
        <c:if test="${not empty delFailMsg }">
            <div class="col-md-3 mx-auto  text-center">
                <h6 class="text-center bg-danger py-2 text-light">${delFailMsg }</h6>
                <c:remove var="delFailMsg" />
            </div>
        </c:if>
        <div class="d-flex">
            <div class="float-ends mx-auto col-md-6">
                <form action="#" method="get">
                    <div class="mt-2 d-flex">
                        <input
                                class="form-control shadow border-4 border-info rounded-pill fw-bold"
                                id="system-search" name="q" placeholder="Search Product"
                                required>
                    </div>
                </form>
            </div>

            <div class="dropdown user-dropdown ms-auto my-1 me-3 sort">
                <button class="btn btn-white dropdown-toggle border"
                        data-bs-toggle="dropdown" aria-expanded="false">Sort by</button>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item"
                           href="/admin/view_all_products?value=price_high_to_low"> Price
                        -- High to Low</a></li>
                    <li><a class="dropdown-item"
                           href="/admin/view_all_products?value=price_low_to_high"> Price
                        -- Low to High</a></li>
                    <li><a class="dropdown-item"
                           href="/admin/view_all_products?value=name_a_to_z"> Name -- a
                        to z</a></li>
                    <li><a class="dropdown-item"
                           href="/admin/view_all_products?value=name_z_to_a"> Name -- z
                        to a</a></li>
                    <li><a class="dropdown-item"
                           href="/admin/view_all_products?value=">Default</a></li>
                </ul>
            </div>
        </div>

    </div>
    <div class="">
        <div class="card-body">
            <table
                    class="table table-bordered table-hover table-striped table-list-search">
                <thead>
                <tr class="text-center">
                    <th scope="col">#</th>
                    <th scope="col">Image</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Product Id</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col" class="">Description</th>
                    <th scope="col">Actions</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${allProducts}" varStatus="loop">
                    <!--  If Product IN-ACTIVE -->
                    <c:if test="${item.status eq 'INACTIVE' }">
                        <tr
                                class="text-center product-table text-decoration-line-through text-danger fw-bold table-danger">
                            <th scope="row">${loop.index+1 }</th>
                            <td><img alt="${item.imageName }"
                                     src="../static/Img/${item.imageName}" height="100px"
                                     width="100px" /></td>
                            <td style="width: 150px;">${item.productName}</td>
                            <td>${item.productId}</td>
                            <td>${item.quantity}</td>
                            <td>${item.price}</td>
                            <td>${item.category}</td>
                            <td style="width: 150px;">${item.description}</td>
                            <td><a href="restore_product/${item.id}"
                                   class="btn btn-info">Restore</a></td>
                        </tr>
                    </c:if>
                    <!--  If Product ACTIVE -->
                    <c:if test="${item.status eq 'ACTIVE' }">
                        <tr class="text-center product-table">
                            <th scope="row">${loop.index+1 }</th>
                            <td><img alt="${item.imageName }"
                                     src="../static/Img/${item.imageName}" height="100px"
                                     width="100px" /></td>
                            <td style="width: 150px;">${item.productName}</td>
                            <td>${item.productId}</td>
                            <td>${item.quantity}</td>
                            <td>${item.price}</td>
                            <td>${item.category}</td>
                            <td style="width: 150px;">${item.description}</td>
                            <td><a href="edit_item/${item.id}"><i
                                    class="fa fa-edit mx-2" aria-hidden="true"></i></a> <a href="#"
                                                                                           data-bs-toggle="modal" data-bs-target="#deleteProductModalId"
                                                                                           data-product-id="${item.id }"><i
                                    class="fa fa-trash text-danger" aria-hidden="true"></i></a></td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>


        <!-- Delete Product Modal-->
        <div class="modal fade" id="deleteProductModalId" tabindex="-1"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Are you sure
                            to delete ?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">NO</button>
                        <a id="deleteLink" href="#"><button class="btn btn-danger">Yes</button></a>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>

<script>
    $(document)
        .ready(
            function() {
                var activeSystemClass = $('.list-group-item.active');

                //something is entered in search form
                $('#system-search')
                    .keyup(
                        function() {
                            var that = this;
                            // affect all table rows on in systems table
                            var tableBody = $('.table-list-search tbody');
                            var searchMsg = $('.search-msg p');
                            var tableRowsClass = $('.table-list-search tbody tr');
                            $('.search-sf').remove();
                            tableRowsClass
                                .each(function(i, val) {

                                    //Lower text for case insensitive
                                    var rowText = $(val)
                                        .text()
                                        .toLowerCase();
                                    var inputText = $(that)
                                        .val()
                                        .toLowerCase();
                                    if (inputText != '') {
                                        $(
                                            '.search-query-sf')
                                            .remove();
                                        searchMsg
                                            .prepend('<p class="search-query-sf mt-3">Searching for: "'
                                                + $(
                                                    that)
                                                    .val()
                                                + '"</p>');
                                    } else {
                                        $(
                                            '.search-query-sf')
                                            .remove();
                                    }

                                    if (rowText
                                        .indexOf(inputText) == -1) {
                                        //hide rows
                                        tableRowsClass
                                            .eq(i)
                                            .hide();

                                    } else {
                                        $('.search-sf')
                                            .remove();
                                        tableRowsClass
                                            .eq(i)
                                            .show();
                                    }
                                });
                            //all tr elements are hidden
                            if (tableRowsClass
                                .children(':visible').length == 0) {
                                tableBody
                                    .append('<tr class="search-sf"><td class="text-muted" colspan="10">No entries found.</td></tr>');
                            }
                        });
            });

    document.querySelectorAll('[data-bs-target="#deleteProductModalId"]').forEach(deleteButton => {
        deleteButton.addEventListener('click', function () {
            const productId = this.getAttribute('data-product-id');
            const deleteLink = document.getElementById('deleteLink');
            deleteLink.setAttribute('href', '/admin/delete_product/' + productId);
        });
    });
</script>
</html>