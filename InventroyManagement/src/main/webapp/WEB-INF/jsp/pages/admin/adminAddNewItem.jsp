<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<div class="">
    <div class="ps-2 mt-3">
        <a href="/admin/dashboard">
            <button class="btn btn-primary">
                <span></span>Back
            </button>
        </a>
    </div>
    <div class="h-100">
        <div class="col-md-10  mx-auto">
            <div class="row" id="login">
                <div class="my-1">
                    <div class="cards mb-2 col-md-6 mx-auto">
                        <h4
                                class="text-center card-header py-1 text-white fw-bold bg-info">ADD
                            NEW ITEM</h4>
                    </div>
                    <div class="card bg-light col-md-6 mx-auto">
                        <c:if test="${not empty failMsg }">
                            <h5 class="text-danger text-center">${failMsg }</h5>
                            <c:remove var="failMsg" />
                        </c:if>
                        <div class="card-body shadow">
                            <form class="fw-bold" action="addItem" method="post"
                                  enctype="multipart/form-data">
                                <div class="row mb-3">
                                    <label for="inputEmail3"
                                           class="col-sm-4 col-form-label text-end">ITEM Name</label>
                                    <div class="col-sm-8 ">
                                        <input type="text" class="form-control" name="productName"
                                               value="${filledProduct.productName }" required="required">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputEmail3"
                                           class="col-sm-4 col-form-label text-end">ITEM Code</label>
                                    <div class="col-sm-8 ">
                                        <input type="text" class="form-control" name="productId"
                                               value="${filledProduct.productId }" required="required">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputEmail3"
                                           class="col-sm-4 col-form-label text-end">Image</label>
                                    <div class="col-sm-8 ">
                                        <input type="file" class="form-control" name="file">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="qualificationSelect "
                                           class="col-sm-4 col-form-label text-end">Category</label>
                                    <div class="col-sm-8">
                                        <select class="form-select" id="categorySelect"
                                                name="category">
                                            <option value="${filledProduct.category}" selected>Select
                                                Category</option>
                                            <c:forEach var="categories" items="${allCategories}">

                                                <option value="${categories.categoryName }">${categories.categoryName }</option>

                                            </c:forEach>

                                        </select>
                                    </div>
                                </div>


                                <div class="row mb-3">
                                    <label for="inputEmail3"
                                           class="col-sm-4 col-form-label text-end">Quantity</label>
                                    <div class="col-sm-8 ">
                                        <input type="number" class="form-control" name="quantity" required="required"
                                               value="${filledProduct.quantity }" min="0">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputEmail3"
                                           class="col-sm-4 col-form-label text-end">Price</label>
                                    <div class="col-sm-8 ">
                                        <input type="number" class="form-control" name="price" min="0"
                                               value="${filledProduct.price }" required="required">
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <label for="inputPassword3"
                                           class="col-sm-4 col-form-label text-end">Description
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="inputPassword"
                                               value="${filledProduct.description }" name="description">
                                    </div>
                                </div>


                                <div class="text-center" id="signin-btn">
                                    <button type="reset" class="btn btn-danger mx-3 fw-bold">CLEAR</button>
                                    <button type="submit" class="btn btn-primary fw-bold">ADD
                                        ITEM</button>
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