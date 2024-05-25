<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>All Customers</title>
</head>
<body>
<div class="d-flex">

    <div class="ps-2 mt-4">
        <a href="/admin/dashboard">
            <button class="btn btn-primary btn-sm">
                <!-- <span><i class="fa fa-backward" aria-hidden="true"></i></span> -->
                Back
            </button>
        </a>
    </div>
    <div class=" mx-auto mt-4 bg-danger shadow">
        <div class="">
            <h4 class="text-center card-header py-1 text-white fw-bold">CUSTOMERS
                DETAILS</h4>
        </div>
    </div>
</div>

<div class="mx-2">
    <c:if test="${not empty errorEditMsg}">
        <div class="row">
            <p class="text-success text-center fs-5">${errorEditMsg}</p>
        </div>
        <c:remove var="errorMsg" />
    </c:if>
    <c:if test="${not empty succEditMsg}">
        <div class="row">
            <p class="text-success text-center fs-5">${succEditMsg}</p>
        </div>
        <c:remove var="succEditMsg" />
    </c:if>

    <div class="card-body bg-light mt-3 table-responsive">
        <table class="table table-bordered table-hover table-striped ">
            <thead>
            <tr class="text-center">
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Phone</th>
                <th scope="col">Address</th>
                <th scope="col">Account CreationDate</th>
                <th scope="col">Acc Status</th>
                <th scope="col">#Purchased</th>
                <th scope="col">Action</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${allCustomers}" varStatus="loop">
                <tr>
                    <th scope="row">${loop.index+1}</th>
                    <td>${customer.firstName}<span class="ms-1">${customer.lastName}</span>
                    </td>
                    <td class="" style="width: 100px;">${customer.email}</td>
                    <td>${customer.phone}</td>
                    <td>${customer.address.city},${customer.address.state}</td>
                    <td class="text-center">${customer.accountCreationDate.toString().substring(0,10)}</td>
                    <c:if test="${customer.isAccountActive eq true }">
                        <td class="text-center"><span class="badge bg-success">${customer.isAccountActive}</span></td>
                    </c:if>
                    <c:if test="${customer.isAccountActive eq false }">
                        <td class="text-center"><span class="badge bg-danger">${customer.isAccountActive}</span></td>
                    </c:if>
                    <td class="text-center"> <span class="badge bg-warning">${customer.purchasedHistory.size()}</span></td>

                    <td class="text-center"><a href="edit_customer?custId=${customer.userId }"><i class="fa fa-pencil-square fs-3 text-primary" aria-hidden="true"></i>
                    </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="text-center">
    <div class="my-3">
        <a href="add_new_user" class="btn btn-primary text-light ">ADD
            NEW USER</a>
    </div>
</div>
</body>
</html>