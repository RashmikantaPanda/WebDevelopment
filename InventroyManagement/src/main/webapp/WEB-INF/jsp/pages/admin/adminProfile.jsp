<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6">
                        <label class="labels">Name</label><input type="text"
                                                                 class="form-control" placeholder="first name" value="">
                    </div>
                    <div class="col-md-6">
                        <label class="labels">Surname</label><input type="text"
                                                                    class="form-control" value="" placeholder="surname">
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="p-3 py-5">
                        <div
                                class="d-flex justify-content-between align-items-center experience">
                            <span>Edit Experience</span><span
                                class="border px-3 p-1 add-experience"><i
                                class="fa fa-plus"></i>&nbsp;Experience</span>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <label class="labels">Experience in Designing</label><input
                                type="text" class="form-control" placeholder="experience"
                                value="">
                        </div>
                        <br>
                        <div class="col-md-12">
                            <label class="labels">Additional Details</label><input
                                type="text" class="form-control"
                                placeholder="additional details" value="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>