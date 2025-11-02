<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add/Edit Department - Employee Management System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

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
        }

        /* ✅ Navbar */
        .navbar-custom {
            background: var(--dark);
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: var(--white) !important;
            font-weight: 500;
        }
        .navbar-custom .nav-link.active {
            border-bottom: 2px solid var(--blue);
        }

        /* ✅ Card */
        .card {
            border-radius: 12px;
            background: var(--white);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        .card-header {
            background: var(--dark);
            color: var(--white);
            border-radius: 12px 12px 0 0;
        }

        /* ✅ Inputs */
        .form-control {
            border-radius: 10px;
            border: 1px solid var(--gray);
        }

        /* ✅ Buttons */
        .btn-primary {
            background: var(--dark);
            border: none;
        }
        .btn-primary:hover {
            background: var(--gray);
        }
        .btn-secondary {
            background: var(--blue);
            border: none;
            color: var(--dark);
        }
        .btn-secondary:hover {
            background: var(--gray);
            color: var(--white);
        }
    </style>
</head>
<body>

    <!-- ✅ NAVBAR -->
    <!-- <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="/">EMS</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="/employees">Employees</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/departments">Departments</a></li>
                    <li class="nav-item"><a class="nav-link" href="/attendance">Attendance</a></li>
                </ul>
            </div>
        </div>
    </nav> -->

    <!-- ✅ MAIN CONTENT -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <div class="card">
                    <div class="card-header">
                        <h3 class="m-0">
                            ${department.id == null ? 'Add New Department' : 'Edit Department'}
                        </h3>
                    </div>

                    <div class="card-body">
                        <form:form action="/departments/save" method="post" modelAttribute="department">
                            <form:hidden path="id"/>

                            <div class="mb-3">
                                <label class="form-label">Department Name</label>
                                <form:input path="name" class="form-control" required="true"/>
                                <form:errors path="name" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <form:textarea path="description" class="form-control" rows="3"/>
                                <form:errors path="description" class="text-danger"/>
                            </div>

                            <div class="d-grid gap-2 mt-4">
                                <button type="submit" class="btn btn-primary">Save Department</button>
                                <a href="/departments" class="btn btn-secondary">Cancel</a>
                            </div>

                        </form:form>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
