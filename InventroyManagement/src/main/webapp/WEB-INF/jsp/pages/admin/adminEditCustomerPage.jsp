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
    <title>Admin Dashboard</title>
</head>
<body>
<div class="d-flex">
    <div class="ps-2 mt-3">
        <a href="/admin/view_users">
            <button class="btn btn-primary">
                <span></span>Back
            </button>
        </a>
    </div>
    <div class="container">
        <div class="row" id="login">
            <div class="col-md-8 mx-auto my-3">
                <div class=" mb-2">
                    <h4 class="text-center card-header py-1 text-dark fw-bold border">EDIT
                        CUSTOMER</h4>
                </div>
                <c:if test="${not empty updateFailMsg}">
                    <div class="row">
                        <p class="text-danger text-center fs-6 text-capitalize">${updateFailMsg}</p>
                    </div>
                    <c:remove var="updateFailMsg" />
                </c:if>
                <div class="bg-light fw-bold border">
                    <div class="card-body">
                        <form class="" action="save_edit_user" method="post">
                            <label for="inputEmail3"
                                   class="col-sm-4 col-form-label text-warning">Personal
                                Details</label>
                            <hr>
                            <input type="hidden" class="form-control" name="userId"
                                   value="${editUser.userId }">
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">FirstName</label>
                                <div class="col-sm-4 ">
                                    <input type="text" class="form-control" name="firstName"
                                           value="${editUser.firstName }">
                                </div>
                                <label for="inputEmail3" class="col-sm-2 col-form-label">LastName</label>
                                <div class="col-sm-4 ">
                                    <input type="text" class="form-control" name="lastName"
                                           value="${editUser.lastName }">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-4 ">
                                    <input type="text" class="form-control" name="email"
                                           value="${editUser.email }" required="required">
                                </div>
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Password</label>
                                <div class="col-sm-4 d-flex">
                                    <input type="password" class="form-control" name="password"
                                           value="${editUser.password }">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Phone</label>
                                <div class="col-sm-4 ">
                                    <input type="text" class="form-control" name="phone"
                                           value="${editUser.phone }">
                                </div>

                                <label for="qualificationSelect"
                                       class="col-sm-2 col-form-label">Status</label>
                                <div class="col-sm-4">
                                    <select class="form-select" id="productSelect"
                                            name="isAccountActive">
                                        <option value="${editUser.isAccountActive }">Choose
                                            Status</option>
                                        <option value="true">ACTIVE</option>
                                        <option value="false">INACTIVE</option>
                                    </select>
                                </div>

                            </div>
                            <!-- Address div Started -->
                            <div class="row mb-4 my-4">
                                <label for="inputPassword3"
                                       class="col-sm-2 col-form-label text-danger">Address</label>
                                <hr>
                                <div class="container me-3">
                                    <div class="row mb-3">
                                        <label for="inputEmail3" class="col-sm-2 col-form-label">City</label>
                                        <div class="col-sm-4 ">
                                            <input type="text" class="form-control" name="city"
                                                   value="${editUser.address.city }">
                                        </div>
                                        <label for="inputEmail3" class="col-sm-2 col-form-label">State</label>
                                        <div class="col-sm-4 ">
                                            <input type="text" class="form-control" name="state"
                                                   value="${editUser.address.state }">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputEmail3" class="col-sm-2 col-form-label">Country</label>
                                        <div class="col-sm-4 ">
                                            <input type="text" class="form-control" name="country"
                                                   value="${editUser.address.country }">
                                        </div>
                                        <label for="inputEmail3" class="col-sm-2 col-form-label">Pincode</label>
                                        <div class="col-sm-4 ">
                                            <input type="text" class="form-control" name="pincode"
                                                   value="${editUser.address.pincode }">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Address div ended  -->
                            <div class="text-center" id="signin-btn">
                                <a class="btn btn-danger" id="needHelp"
                                   href="/admin/view_users">BACK</a>
                                <button type="submit" class="btn btn-success mx-2">SAVE</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>