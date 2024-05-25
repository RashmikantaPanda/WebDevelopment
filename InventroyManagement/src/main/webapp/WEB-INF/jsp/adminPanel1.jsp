<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DoctorCreation</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../CSS/style.css">


</head>

<body>

<div class="navigation-bar">
    <nav class="px-lg-5  navbar navbar-expand-lg navbar-dark bg-green">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold fs-3" href="index.html">IMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav  mb-2 mb-lg-0 fs-5 me-5 ms-4">
                    <li class="nav-item ">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>

                </ul>


                <div class="dropdown user-dropdown ms-auto">
                    <button class="btn btn-warning dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        Admin
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#"><i class="fa fa-pencil"></i> Edit</a></li>
                        <li><a class="dropdown-item text-danger" href="#"><i class="fa fa-sign-out text-dark"></i>
                            Logout</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </nav>
</div>

<div class="card bg-light h-100">
    <div class="mx-4">
        <div class="row" id="login">
            <div class="col-md-4 mx-auto my-5">
                <div class="card mb-2">
                    <h4 class="text-center card-header py-1 text-dark fw-bold">ADD NEW ITEM</h4>
                </div>
                <div class="card bg-light">
                    <div class="card-body">
                        <form class="fw-bold">
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-4 col-form-label">ITEM Name:</label>
                                <div class="col-sm-8 ">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-4 col-form-label">ITEM Id:</label>
                                <div class="col-sm-8 ">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="qualificationSelect"
                                       class="col-sm-4 col-form-label">Category</label>
                                <div class="col-sm-8">
                                    <select class="form-select" id="qualificationSelect" name="Qualification">
                                        <option value="" selected disabled>Select Category</option>
                                        <option value="MD">Electronics</option>
                                        <option value="DO">Cosmetics</option>
                                        <option value="MBBS">Clothes
                                        </option>
                                        <option value="MS">Home & Kitchen</option>
                                        <option value="DNB">Books</option>
                                        <option value="PhD">Medicines</option>

                                    </select>
                                </div>
                            </div>


                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-4 col-form-label">Quantity</label>
                                <div class="col-sm-8 ">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-4 col-form-label">Price</label>
                                <div class="col-sm-8 ">
                                    <input type="text" class="form-control">
                                </div>
                            </div>

                            <div class="row mb-4">
                                <label for="inputPassword3" class="col-sm-4 col-form-label">Description :</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputPassword">
                                </div>
                            </div>


                            <div class="text-center" id="signin-btn">
                                <button type="submit" class="btn btn-danger">ADD ITEM</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>


            <div class="col-md-8 my-5">
                <div class="card mb-2">
                    <h4 class="text-center card-header py-1 text-dark fw-bold">PRODUCT DETAILS</h4>
                </div>
                <div class="card bg-light">
                    <div class="card-body">
                        <table class="table table-bordered table-hover table-striped table-success">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Product Id</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Category</th>
                                <th scope="col">Actions</th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Moto G5 S2</td>
                                <td>PID1002</td>
                                <td>25</td>
                                <td>Electronics</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm">Edit</button>
                                    <button type="button" class="btn btn-danger btn-sm">Delete</button>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">1</th>
                                <td>Moto G5 S2</td>
                                <td>PID1002</td>
                                <td>25</td>
                                <td>Electronics</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm">Edit</button>
                                    <button type="button" class="btn btn-danger btn-sm">Delete</button>
                                </td>
                            </tr>
                            <!-- Add more rows with additional doctor details -->
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>

</body>

</html>