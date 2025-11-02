<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add/Edit Employee - Employee Management System</title>

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
            font-family: 'Segoe UI', sans-serif;
        }

        /* ✅ Unified Navbar (Same as employee list page) */
        .navbar {
            background-color: var(--dark) !important;
            padding: 15px 0;
            box-shadow: 0 4px 10px rgba(0,0,0,0.25);
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 22px;
            color: var(--blue) !important;
        }
        .nav-link {
            color: var(--white) !important;
            margin-right: 18px;
            font-size: 16px;
            transition: 0.3s;
        }
        .nav-link.active,
        .nav-link:hover {
            color: var(--blue) !important;
        }

        /* ✅ Card */
        .card {
            background: var(--white);
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.10);
        }

        .card-header {
            background: var(--blue);
            color: var(--dark);
            font-weight: 600;
            padding: 18px;
            border-radius: 20px 20px 0 0;
        }

        /* ✅ Buttons */
        .btn-primary {
            background: var(--dark);
            border: none;
            border-radius: 10px;
        }
        .btn-primary:hover {
            background: var(--gray);
        }

        .btn-secondary {
            background: var(--gray);
            border: none;
            border-radius: 10px;
        }
        .btn-secondary:hover {
            background: var(--dark);
        }

    </style>
</head>

<body>

    <!-- ✅ UNIFIED NAVBAR (same as employee list) -->
    <!-- <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="/">EMS</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navMenu">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="/employees">Employees</a></li>
                    <li class="nav-item"><a class="nav-link" href="/departments">Departments</a></li>
                    <li class="nav-item"><a class="nav-link" href="/attendance">Attendance</a></li>
                </ul>
            </div>
        </div>
    </nav> -->

    <!-- ✅ MAIN CONTENT -->
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <div class="card">
                    <div class="card-header">
                        <h3 class="mb-0">
                            ${employee.id == null ? 'Add New Employee' : 'Edit Employee'}
                        </h3>
                    </div>

                    <div class="card-body">
                        <form:form action="/employees/save" method="post" modelAttribute="employee">

                            <form:hidden path="id"/>

                            <!-- ✅ Name -->
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <form:input path="name" class="form-control" required="true"/>
                            </div>

                            <!-- ✅ Email -->
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <form:input path="email" type="email" class="form-control" required="true"/>
                            </div>

                            <!-- ✅ Department -->
                            <div class="mb-3">
                                <label class="form-label">Department</label>
                                <form:select path="department.id" class="form-control" required="true">
                                    <form:option value="" label="Select Department"/>
                                    <form:options items="${departments}" itemValue="id" itemLabel="name"/>
                                </form:select>
                            </div>

                            <!-- ✅ Salary -->
                            <div class="mb-3">
                                <label class="form-label">Salary</label>
                                <form:input path="salary" type="number" step="0.01" class="form-control" required="true"/>
                            </div>

                            <!-- ✅ Phone -->
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <form:input path="phone" class="form-control" required="true"/>
                            </div>

                            <!-- ✅ Hire Date -->
                            <div class="mb-3">
                                <label class="form-label">Hire Date</label>
                                <form:input path="hireDate" type="date" class="form-control" required="true"/>
                            </div>

                            <!-- ✅ Joining Date -->
                            <div class="mb-3">
                                <label class="form-label">Joining Date</label>
                                <form:input path="joiningDate" type="date" class="form-control" required="true"/>
                            </div>

                            <!-- ✅ Buttons -->
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">
                                    ${employee.id == null ? 'Add Employee' : 'Update Employee'}
                                </button>
                                <a href="/employees" class="btn btn-secondary">Cancel</a>
                            </div>

                        </form:form>
                    </div>

                </div>

            </div>
        </div>
    </div>

</body>
</html>
