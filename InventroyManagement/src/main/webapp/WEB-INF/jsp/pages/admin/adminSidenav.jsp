<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>SideNav</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="../static/CSS/sidenav.css">
</head>
<body>
<div class="side-nav-bar">
    <div class="sidebar">
        <div class="">
            <div class="d-flex flex-column align-items-center text-center">
                <img class="rounded-circle mt-2" width="150px"
                     src="https://th.bing.com/th/id/OIP.V0NH3fa-mZ4AJ94SEQTy_wHaHa?rs=1&pid=ImgDetMain">
                <span class="font-weight-bold">${loggedInUser.firstName}
                    ${loggedInUser.lastName }</span> <span class="text-danger">${loggedInUser.email}</span>
                <span class="text-black-50">${loggedInUser.address.city.toUpperCase()},${loggedInUser.address.state.toUpperCase()},${loggedInUser.address.country}</span>
            </div>
        </div>
        <hr class="mb-0">
        <div>
            <div class="mx-1 mb-5">
                <a class="btn btn-warning border text-light text-uppercase my-1"
                   href="/admin/dashboard" id="profile">Home</a> <a
                    class="btn btn-warning border text-light text-uppercase mb-1"
                    href="/admin/view_all_products" id="view_all_products">View
                Products</a> <a
                    class="btn btn-warning border text-light text-uppercase mb-1"
                    href="/admin/add_new_item" id="add_new_item">Add Product</a> <a
                    class="btn btn-warning border text-light text-uppercase mb-1"
                    href="/admin/add_category" id="add_category">Add Category</a> <a
                    class="btn btn-warning border text-light text-uppercase mb-1"
                    href="/admin/sell_item" id="add_category">Sell Item</a> <a
                    class="btn btn-warning border text-light text-uppercase mb-1"
                    href="/admin/view_sell_history" id="view_sell_history">Sell
                History</a>
            </div>
        </div>
    </div>


    <!-- Modal for log out -->
    <div class="modal fade" id="exampleModal" tabindex="-1"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Do you want to
                        logged out ?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">NO
                    </button>
                    <button type="button" class="btn btn-danger "
                            onclick="doctorLogout()">YES
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>