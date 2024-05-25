<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit</title>
    <link rel="stylesheet" href="../../static/CSS/sidenav.css">

</head>
<body>
<div class="d-flex">
    <div class="ps-2 mt-3 col-md-1">
        <a href="/admin/view_all_products">
            <button class="btn btn-primary" >
                <span></span>Back
            </button>
        </a>
    </div>
    <div class="col-md-10s mx-auto mt-3">
        <div class="">
            <div class="row">
                <div class="border bg-light col-md-10 mx-auto shadow">
                    <div class="mb-2">
                        <h4
                                class="text-center bg-danger text-white py-1 my-2 fw-bold">EDIT
                            ITEM</h4>
                    </div>
                    <div class="bg-light">
                        <div class="card-body">
                            <form class="fw-bold"
                                  action="${pageContext.request.contextPath}/admin/edit/${editProduct.id}"
                                  method="POST" enctype="multipart/form-data">
                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-4 col-form-label">ITEM
                                        Name: </label>
                                    <div class="col-sm-8 ">
                                        <input type="text" class="form-control"
                                               value="${editProduct.productName }" name="productName">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-4 col-form-label">ITEM
                                        Id:</label>
                                    <div class="col-sm-8 ">
                                        <input type="text" class="form-control"
                                               value="${editProduct.productId }" name="productId">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-4 col-form-label">Image</label>
                                    <div class="col-sm-3 ">
                                        <input type="file" class="form-control card" name="file"
                                               value="">
                                    </div>
                                    <div class="col-sm-5 ">
                                        <img class="form-control"
                                             src="../../static/Img/${editProduct.imageName}">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="qualificationSelect"
                                           class="col-sm-4 col-form-label">Category</label>
                                    <div class="col-sm-8">
                                        <select class="form-select" id="categorySelect"
                                                name="category">
                                            <option value="${editProduct.category }" selectedreadonly">${editProduct.category }</option>
                                            <c:forEach var="categories" items="${allCategories}">

                                                <option value="${categories.categoryName }">${categories.categoryName }</option>

                                            </c:forEach>

                                        </select>
                                    </div>
                                </div>


                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-4 col-form-label">Quantity</label>
                                    <div class="col-sm-8 ">
                                        <input type="number" min="0" class="form-control"
                                               value="${editProduct.quantity}" name="quantity">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-4 col-form-label">Price</label>
                                    <div class="col-sm-8 ">
                                        <input type="text" class="form-control"
                                               value="${editProduct.price }" name="price">
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <label for="inputPassword3" class="col-sm-4 col-form-label">Description
                                        :</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="inputPassword"
                                               value="${editProduct.description }" name="description">
                                    </div>
                                </div>


                                <div class="text-center" id="signin-btn">
                                    <a href="/admin/view_all_products"
                                       class="text-decoration-none">
                                        <button type="button" class="btn btn-warning text-light mx-2">CANCEL</button>
                                    </a>
                                    <button type="submit" class="btn btn-primary mx-2">SAVE</button>

                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>