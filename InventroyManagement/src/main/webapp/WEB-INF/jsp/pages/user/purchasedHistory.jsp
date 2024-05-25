<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Purchased History</title>
    <!-- Font Awesome for icons -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            rel="stylesheet">
</head>
<body>
<div class="">
    <h2>User Purchased History</h2>
    <div class="container mt-5" id="accordionExample">
        <c:if test="${not empty purchaseHistory }">
            <c:forEach var="purchase" items="${purchaseHistory}">
                <div class="mt-2">
                    <div class="card-header d-flex" id="heading${purchase.id}">
                        <div class="mb-0">
                            <div class="text-warning text-decoration-none fs-6 my-2"
                                 data-toggle="collapse" data-target="#collapse${purchase.id}"
                                 aria-expanded="true" aria-controls="collapse${purchase.id}">
                                Purchased on: <span class="text-dark fw-bold">
                                    ${purchase.purchasedDateTime.toString().substring(0,10)}</span>
                            </div>
                        </div>
                        <div class="ms-auto my-2">
                            <a href="/user/download_sell_pdf/${purchase.id}"><i
                                    class="fa fa-download mx-3 text-primary fs-5"></i></a>
                        </div>
                    </div>
                    <div id="collapse${purchase.id}" class="collapse"
                         aria-labelledby="heading${purchase.id}"
                         data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Product Code</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total Price</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="totalPrice" value="0" />
                                <c:forEach var="item" items="${purchase.productCart}">
                                    <tr>
                                        <td>${item.productName}</td>
                                        <td>${item.productCode}</td>
                                        <td>${item.price}</td>
                                        <td>${item.quantity}</td>
                                        <td>${item.totalPrice}</td>
                                    </tr>
                                    <c:set var="totalPrice"
                                           value="${totalPrice + item.totalPrice}" />
                                </c:forEach>
                                <tr>
                                    <td colspan="4" class="text-right"><b>Total:</b></td>
                                    <td class="text-danger fw-bold">${totalPrice}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty purchaseHistory }">
            <div class="text-center mx-auto my-5">
                <h3>You have no ordered history !</h3>
            </div>
        </c:if>
    </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
