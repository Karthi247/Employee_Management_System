<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EMS - Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        :root {
            --dark: #1A1E27;
            --gray: #8C9297;
            --blue: #A8C2CC;
            --light: #DDE7EB;
            --white: #FFFFFF;
        }

        body {
            background: var(--light);
            font-family: "Poppins", sans-serif;
        }

        /* ✅ NAVBAR */
        .navbar-custom {
            background: var(--dark);
            padding: 15px 0;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        .navbar-custom .navbar-brand {
            font-weight: bold;
            color: var(--blue) !important;
            font-size: 1.4rem;
        }
        .navbar-custom .nav-link {
            color: var(--white) !important;
            margin-left: 18px;
            font-weight: 500;
        }
        .navbar-custom .nav-link:hover {
            color: var(--blue) !important;
        }
        .navbar-custom .nav-link.active {
            border-bottom: 2px solid var(--blue);
        }

        /* ✅ Cards */
        .card-custom {
            border-radius: 18px;
            border: none;
            background: var(--white);
            box-shadow: 0px 8px 25px rgba(0,0,0,0.1);
        }

        .card-header {
            background: var(--blue);
            color: var(--dark);
            border-radius: 18px 18px 0 0 !important;
            font-weight: 600;
        }
    </style>
</head>

<body>

    <!-- ✅ NAVBAR INCLUDED IN SAME FILE -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container">

            <a class="navbar-brand" href="/dashboard">EMS</a>

            <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNav" aria-expanded="false">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">

                <ul class="navbar-nav ms-auto">

                    <!-- ✅ If user logged in -->
                    <c:if test="${not empty loggedInUser}">
                        <li class="nav-item"><a class="nav-link" href="/employees">Employees</a></li>
                        <li class="nav-item"><a class="nav-link" href="/departments">Departments</a></li>
                        <li class="nav-item"><a class="nav-link" href="/attendance">Attendance</a></li>
                        <li class="nav-item"><a class="nav-link text-danger fw-bold" href="/logout">Logout</a></li>
                    </c:if>

                    <!-- ✅ If NOT logged in -->
                    <c:if test="${empty loggedInUser}">
                        <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="/signup">Signup</a></li>
                    </c:if>

                </ul>

            </div>
        </div>
    </nav>


 <!-- ✅ HOME PAGE CONTENT -->
<div class="container mt-5">

    <h2 class="text-center mb-4" style="color: var(--dark); font-weight: 700;">
        Welcome to Employee Management System
    </h2>

    <p class="text-center mb-5" style="color: var(--gray); font-size: 1.1rem;">
        Manage Employees, Departments, and Attendance in one place.
    </p>

    <div class="row g-4">

        <!-- ✅ Employees -->
        <div class="col-md-4">
            <div class="card card-custom">
                <div class="card-header text-center">
                    <h5>Employees</h5>
                </div>
                <div class="card-body text-center">
                    <p style="color: var(--gray);">Manage employee details, roles, and information.</p>
                    <a href="/employees" class="btn btn-dark px-4"
                       style="background: var(--dark); color: var(--white); border-radius: 10px;">
                        View Employees
                    </a>
                </div>
            </div>
        </div>

        <!-- ✅ Departments -->
        <div class="col-md-4">
            <div class="card card-custom">
                <div class="card-header text-center">
                    <h5>Departments</h5>
                </div>
                <div class="card-body text-center">
                    <p style="color: var(--gray);">Organize and manage company departments.</p>
                    <a href="/departments" class="btn btn-dark px-4"
                       style="background: var(--dark); color: var(--white); border-radius: 10px;">
                        View Departments
                    </a>
                </div>
            </div>
        </div>

        <!-- ✅ Attendance -->
        <div class="col-md-4">
            <div class="card card-custom">
                <div class="card-header text-center">
                    <h5>Attendance</h5>
                </div>
                <div class="card-body text-center">
                    <p style="color: var(--gray);">Track daily attendance and timings.</p>
                    <a href="/attendance" class="btn btn-dark px-4"
                       style="background: var(--dark); color: var(--white); border-radius: 10px;">
                        View Attendance
                    </a>
                </div>
            </div>
        </div>

        <!-- ✅ Department Sample Table (3 Columns) -->
<div class="container mt-5">

    <h3 class="text-center mb-4" style="color: var(--dark); font-weight: 700;">
        Popular Departments
    </h3>

    <table class="table table-bordered text-center"
           style="background: var(--white); border-radius: 15px; overflow: hidden;">

        <thead style="background: var(--blue); color: var(--dark); font-weight: 600;">
            <tr>
                <th>Department 1</th>
                <th>Department 2</th>
                <th>Department 3</th>
            </tr>
        </thead>

        <tbody style="color: var(--dark);">
            <tr>
                <td>Human Resources</td>
                <td>Finance</td>
                <td>Marketing</td>
            </tr>
            <tr>
                <td>IT Support</td>
                <td>Sales</td>
                <td>Research & Development</td>
            </tr>
            <tr>
                <td>Quality Assurance</td>
                <td>Customer Service</td>
                <td>Administration</td>
            </tr>
        </tbody>

    </table>
</div>


    </div>
</div>


</body>
</html>
