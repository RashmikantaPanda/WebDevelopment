<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>BillDetails</title>
</head>
<body>
<div class="d-flex">
    <div class="ps-2 mt-3 col-md-1">
        <a href="/admin/sell_item">
            <button class="btn btn-primary">
                <span></span>Back
            </button>
        </a>
    </div>
    <div class="my-2 col-md-10">
        <div class="containers">
            <c:if test="${not empty userCartItems}">
                <div class="border  col-sm-8  mx-auto my-2 shadow">
                    <div class="p-2 bg-light">
                        <h5 class="text-center bg-info p-2">BILL SUMMERY</h5>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Code</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Net Amount</th>


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
                                    <td class="text-center">${cart.quantity }</td>
                                    <td class="text-center">${cart.totalPrice }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-center fw-bold">${netQuantity}</td>
                                <th class="text-danger text-center fs-5">${netPrice}</th>
                            </tr>
                            </tfoot>
                        </table>
                        <form action="save_user_bill/${userCartItems[0].userId }"
                              method="POST">
                            <div class="row my-3">
                                <label for="qualificationSelect"
                                       class="col-sm-4 col-form-label">Payment Method</label>
                                <div class="col-sm-8">
                                    <select class="form-select" id=paymentMethod required="required"
                                            name="paymentMethod">
                                        <option value="${editProduct.category }">Choose
                                            Method</option>
                                        <option value="Cash">Cash</option>
                                        <option value="Card">Card</option>
                                        <option value="UPI">UPI</option>

                                    </select>
                                </div>
                            </div>
                            <div class="row my-3">
                                <label for="inputEmail3" class="col-sm-4 col-form-label">Remark</label>
                                <div class="col-sm-8 ">
                                    <input type="text" class="form-control" id="inputEmail3" required="required"
                                           name="remark">
                                </div>
                            </div>
                            <div class="my-3 text-center" id="signin-btn">
                                <a href="sell_item" class="text-decoration-none">
                                    <button type="button" class="btn btn-primary text-light ">BACK</button>
                                </a>
                                <button type="submit" class="btn btn-success text-light mx-5">PAY
                                    BILL</button>
                            </div>
                        </form>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>