<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit</title>
</head>
<body>

<div class="pt-3">
    <div class="row" id="login">
        <div class="col-md-8 mx-auto my-5 py-3">
            <div class="mb-2 border">
                <h4 class="text-center card-header py-1 text-dark fw-bold">EDIT
                    PROFILE</h4>
            </div>
            <div class="border bg-light fw-bold">
                <div class="card-body">
                    <c:if test="${not empty updateFailMsg}">
                        <div class="row my-1">
                            <p class="text-danger text-center fs-6 mb-0">${updateFailMsg}</p>
                        </div>
                        <c:remove var="updateFailMsg"/>
                    </c:if>
                    <form class="" action="edit_profile" method="post">
                        <label for="inputEmail3"
                               class="col-sm-4 col-form-label text-warning">Personal
                            Details</label>
                        <hr>
                        <div class="col-sm-4 ">
                            <input type="text" hidden="true" class="form-control"
                                   value="${loggedInUser.userId}" name="userId">
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">FirstName</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control"
                                       value="${loggedInUser.firstName}" name="firstName">
                            </div>
                            <label for="inputEmail3" class="col-sm-2 col-form-label">LastName</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" value="${loggedInUser.lastName}"
                                       name="lastName">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" value="${loggedInUser.email}" name="email">
                            </div>
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-4 ">
                                <input type="password" class="form-control" name="password"
                                       value="${loggedInUser.password}">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Phone</label>
                            <div class="col-sm-4 ">
                                <input type="text" class="form-control" value="${loggedInUser.phone}" name="phone">
                            </div>
                            <!-- <label for="inputEmail3" class="col-sm-2 col-form-label">Address</label>
                        <div class="col-sm-4 ">
                            <input type="text" class="form-control">
                        </div> -->
                        </div>
                        <!-- Address div Started -->
                        <div class="row mb-4 my-4">
                            <label for="address"
                                   class="col-sm-2 col-form-label text-danger" id="address">Address</label>
                            <hr>
                            <div class="container me-3">
                                <div class="row mb-3">
                                    <label for="city" class="col-sm-2 col-form-label">City</label>
                                    <div class="col-sm-4 ">
                                        <input type="text" class="form-control" id="city"
                                               value="${loggedInUser.address.city}" name="city">
                                    </div>
                                    <label for="state" class="col-sm-2 col-form-label">State</label>
                                    <div class="col-sm-4 ">
                                        <input type="text" class="form-control" id="state"
                                               value="${loggedInUser.address.state}" name="state">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="country" class="col-sm-2 col-form-label">Country</label>
                                    <div class="col-sm-4 ">
                                        <input type="text" class="form-control" id="country"
                                               value="${loggedInUser.address.country}" name="country">
                                    </div>
                                    <label for="pincode" class="col-sm-2 col-form-label">Pincode</label>
                                    <div class="col-sm-4 ">
                                        <input type="text" class="form-control" id="pincode"
                                               value="${loggedInUser.address.pincode}" name="pincode">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Address div ended  -->
                        <div class="text-center" id="signin-btn">
                            <a href="dashboard">
                                <button type="button"
                                        class="btn btn-danger text-light mx-3">Cancel
                                </button>
                            </a>

                            <button type="submit" class="btn btn-success ">Save</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>