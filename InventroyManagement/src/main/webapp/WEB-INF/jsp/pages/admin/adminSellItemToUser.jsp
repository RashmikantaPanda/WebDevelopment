<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.css" />
    <style>
        .bill-table th {
            font-size: 14px;
            font-weight: bold;
        }

        .bill-table td {
            font-size: 14px;
            font-family: sans-serif;
        }
    </style>
    <title>Sell Item</title>
</head>
<body>
<div class="container px-3 mt-4">
    <a href="/admin/dashboard">
        <button class="btn btn-primary">
            <span></span>Back
        </button>
    </a>
</div>
<div class="h">
    <div class="mx-4">
        <div class="row">
            <div class="border bg-light col-md-5 mx-auto mt-3 shadow my-auto">
                <div class="mb-2">
                    <h4
                            class="text-center card card-header py-1 my-2 text-dark fw-bold">SELL
                        ITEM</h4>
                </div>
                <div>
                    <c:if test="${not empty failMsg }">
                        <h6 class="text-center text-danger mb-0">${failMsg}</h6>
                        <c:remove var="failMsg" />
                    </c:if>
                </div>
                <div id="responseContainer"></div>
                <div class="bg-light">
                    <div class="card-body">
                        <form class="fw-bold"
                              action="${pageContext.request.contextPath}/admin/add_items_to_user_cart"
                              method="POST" enctype="multipart/form-data">

                            <div class="row mb-3 border py-2 bg-info">
                                <label for="qualificationSelect"
                                       class="col-sm-4 col-form-label">USER DETAILS</label>
                                <c:if test="${not empty userCartItems}">
                                    <c:set var="userName"
                                           value="${sessionScope.userCartItems[0].userName}" />
                                    <c:set var="userId"
                                           value="${sessionScope.userCartItems[0].userId}" />
                                    <div class="col-sm-8">
                                        <select class="form-select" id="userSelect" name="userId">
                                            <option value="${userId }">${userName }</option>
                                        </select>
                                    </div>
                                </c:if>
                                <c:if test="${empty userCartItems}">
                                    <div class="col-sm-8">
                                        <select class="form-select" id="userSelects" name="userId"
                                                required="required">
                                            <option value="${null }">Select User</option>
                                            <c:forEach var="user" items="${allUsers}">
                                                <option value="${user.userId } ">${user.firstName }
                                                        ${user.lastName }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </c:if>
                            </div>
                            <div class="py-2 px-2">
                                <div class="row mb-1">
                                    <label for="qualificationSelect"
                                           class="col-sm-4 col-form-label">Item Name</label>
                                    <div class="col-sm-8">
                                        <select class="form-select" id="productSelect"
                                                name="productId">
                                            <option value="${null }">Select Product</option>
                                            <c:forEach var="product" items="${allActiveProducts}">
                                                <option value="${product.id } ">${product.productId }
                                                        ${product.productName }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="row my-1">
                                    <div class="col-sm-10 text-center">OR</div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputEmail34" class="col-sm-4 col-form-label">ITEM
                                        Code</label>
                                    <div class="col-sm-8 ">
                                        <input type="text" class="form-control"
                                               placeholder="Enter Item Code" name="productCode">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-4 col-form-label">Quantity</label>
                                    <div class="col-sm-8 ">
                                        <input type="number" min="1" class="form-control" value=""
                                               name="quantity" id="itemMaxQuantity" required="required">
                                    </div>
                                </div>

                                <div class="text-center" id="signin-btn">
                                    <a href="cancel_user_cart" class="text-decoration-none">
                                        <button type="button"
                                                class="btn btn-warning text-light mx-2 ">CANCEL</button>
                                    </a>
                                    <button type="submit" class="btn btn-primary mx-2 ">ADD</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <c:if test="${not empty userCartItems}">
                <div class="border m-1 mt-3 bg-light col-md-6 mx-auto shadow">
                    <h5 class="text-center pt-2 fw-bold">BILL SUMMERY</h5>
                    <hr class="mb-0">
                    <table class="table table-striped bill-table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Code</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Action</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="netPrice" value="0" />
                        <c:set var="netQuantity" value="0" />
                        <c:forEach var="cart" items="${userCartItems}" varStatus="loop">
                            <c:set var="netPrice" value="${netPrice + cart.totalPrice }" />
                            <c:set var="netQuantity"
                                   value="${netQuantity + cart.quantity }" />
                            <tr>
                                <th scope="row">${loop.index+1}</th>
                                <td>${cart.productName }</td>
                                <td>${cart.productCode }</td>
                                <td>${cart.price }</td>
                                <td width="100">${cart.quantity }<a
                                        href="sell_item/plus_sell_item/${loop.index }"><i
                                        class="ms-3 fs-6 fa fa-plus-circle text-success"
                                        aria-hidden="true"></i></a><a
                                        href="sell_item/minus_sell_item/${loop.index }"><i
                                        class="mx-2 fs-6 fa fa-minus-circle text-danger"
                                        aria-hidden="true"></i></a></td>
                                <td>${cart.totalPrice }</td>
                                <td class="text-center"><a
                                        href="/admin/sell_item/delete/${loop.index+1}"><i
                                        class="fa fa-trash fs-6" aria-hidden="true"></i> </a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>${netQuantity}</td>
                            <th class="text-danger fs-6">${netPrice}</th>
                            <td></td>
                        </tr>
                        </tfoot>
                    </table>
                    <div class="text-end" style="margin-top: 156px">
                        <a href="cancel_user_cart" class="text-decoration-none">
                            <button type="button" class="btn btn-danger text-light mx-4 my-3">CLEAR</button>
                        </a> <a href="bill_details">
                        <button type="button" class="btn btn-success text-light my-3">PROCEED</button>
                    </a>
                    </div>
                </div>

            </c:if>
        </div>
    </div>
</div>
</body>
</html>