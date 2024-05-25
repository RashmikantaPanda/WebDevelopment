<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sell History</title>
    <!-- Font Awesome for icons -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            rel="stylesheet">
</head>
<body>
<div class="container pruduct-sell-history">
    <div class="row">
        <div class="col ms-5">
            <h4
                    class="text-center mt-3 bg-danger text-light py-2 text-uppercase">Sell
                History</h4>
            <div class="container" id="accordionExample">
                <c:forEach var="purchase" items="${sellHistories}">
                    <div class="mt-3 border">
                        <div class="card-header d-flex" id="heading${purchase.id}">
                            <div class="mb-0 d-flex">
                                <p class="my-1 text-info text-decoration-none">Purchased
                                    on: ${purchase.purchasedDateTime.toString().substring(0,10)}</p>
                                <p class="mx-4 my-1 fw-bold text-success">[
                                        ${purchase.user.firstName} ${purchase.user.lastName} ]</p>
                            </div>
                            <div class="ms-auto">
                                <a href="download_sell_pdf/${purchase.id}"><i
                                        class="fa fa-download mx-3 text-primary fs-4"></i></a>
                            </div>
                        </div>
                        <div id="collapse${purchase.id}" class="acollapse"
                             aria-labelledby="aheading${purchase.id}"
                             data-parent="#accordionExample">
                            <div class="card-body">
                                <table class="table table-bordered">
                                    <thead class="thead-dark bg-secondary text-light">
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
                                        <td class="fw-bold text-danger">${totalPrice}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
