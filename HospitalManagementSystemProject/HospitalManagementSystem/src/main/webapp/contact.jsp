<%--
  Created by IntelliJ IDEA.
  User: RASHMIKANTA PANDA
  Date: 17-12-2023
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HMS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./CSS/style.css">



    <style>
        /* Google Font CDN Link */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');

        .container1 {
            width: 85%;
            background: #fff;
            border-radius: 6px;
            padding: 20px 60px 30px 40px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }

        .container1 .content {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .container1 .content .left-side {
            width: 25%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-top: 15px;
            position: relative;
        }

        .content .left-side::before {
            content: '';
            position: absolute;
            height: 70%;
            width: 2px;
            right: -15px;
            top: 50%;
            transform: translateY(-50%);
            background: #afafb6;
        }

        .content .left-side .details {
            margin: 14px;
            text-align: center;
        }

        .content .left-side .details i {
            font-size: 30px;
            color: #3e2093;
            margin-bottom: 10px;
        }

        .content .left-side .details .topic {
            font-size: 18px;
            font-weight: 500;
        }

        .content .left-side .details .text-one,
        .content .left-side .details .text-two {
            font-size: 14px;
            /* color: #afafb6; */
        }

        .container1 .content .right-side {
            width: 75%;
            margin-left: 75px;
        }

        .content .right-side .topic-text {
            font-size: 23px;
            font-weight: 600;
            color: #3e2093;
        }

        .right-side .input-box {
            height: 50px;
            width: 100%;
            margin: 12px 0;
        }

        .right-side .input-box input,
        .right-side .input-box textarea {
            height: 100%;
            width: 100%;
            border: none;
            outline: none;
            font-size: 16px;
            background: #F0F1F8;
            border-radius: 6px;
            padding: 0 15px;
            resize: none;
        }

        .right-side .message-box {
            min-height: 110px;
        }

        .right-side .input-box textarea {
            padding-top: 6px;
        }

        .right-side .button {
            display: inline-block;
            margin-top: 12px;
        }

        .right-side .button input[type="button"] {
            color: #fff;
            font-size: 18px;
            outline: none;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            background: #3e2093;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .button input[type="button"]:hover {
            background: #5029bc;
        }

        @media (max-width: 950px) {
            .container {
                width: 90%;
                padding: 30px 40px 40px 35px;
            }

            .container .content .right-side {
                width: 75%;
                margin-left: 55px;
            }
        }

        @media (max-width: 820px) {
            .container {
                margin: 40px 0;
                height: 100%;
            }

            .container1 .content {
                flex-direction: column-reverse;
            }

            .container1 .content .left-side {
                width: 100%;
                flex-direction: row;
                margin-top: 40px;
                justify-content: center;
                flex-wrap: wrap;
            }

            .container1 .content .left-side::before {
                display:none;
            }

            .container1 .content .right-side {
                width: 100%;
                margin-left: 0;
            }
            .contactCont{
                align-content: center;
                justify-content: center;
            }
        }
    </style>
</head>

<body>

<div class="navigation-bar">
    <nav class="px-lg-5  navbar navbar-expand-lg navbar-dark bg-green">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold fs-3" href="index.jsp">HMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-5 me-5">
                    <li class="nav-item ">
                        <a class="nav-link " aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="contact.jsp">Contact</a>
                    </li>


                </ul>

                <div class="dropdown">
                    <button class="btn btn-warning dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        Login
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="patient_login.jsp">Patient</a></li>
                        <li><a class="dropdown-item" href="doctor_login.jsp">Doctor</a></li>
                        <li><a class="dropdown-item" href="admin_login.jsp">Admin</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>

<div class="container contactCont">
    <div class="row">
        <div class="container mt-5 container1">
            <div class="content">
                <div class="left-side">
                    <div class="address details">
                        <i class="fas fa-map-marker-alt"></i>
                        <div class="topic text-info fw-bold">Address</div>
                        <div class="text-one">AIIMS, BBSR</div>
                        <div class="text-two">Khurda 751004</div>
                    </div>
                    <div class="phone details">
                        <i class="fas fa-phone-alt"></i>
                        <div class="topic text-info fw-bold">Phone</div>
                        <div class="text-one">+91 94375 39215</div>
                        <div class="text-two">+91 94398 11630</div>
                    </div>
                    <div class="email details">
                        <i class="fas fa-envelope"></i>
                        <div class="topic text-info fw-bold">Email</div>
                        <div class="text-one">aiims.bbsr@yahoo.com</div>
                        <div class="text-two">www.aiims.org.in</div>
                    </div>
                </div>
                <div class="right-side">
                    <div class="topic-text">Send us a message</div>
                    <p>If you have any work from me or any types of quries related to this websitte, you can send us
                        message
                        from here. It's our pleasure to help you.</p>
                    <form action="#">
                        <div class="input-box">
                            <input type="text" placeholder="Enter your name">
                        </div>
                        <div class="input-box">
                            <input type="text" placeholder="Enter your email">
                        </div>
                        <div class="input-box message-box">
                            <input type="text" placeholder="Enter your message">
                        </div>
                        <div class="button">
                            <input type="button" value="Send Now">
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