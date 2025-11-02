<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Employee - Employee Management System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #DDE7EB;
            font-family: 'Segoe UI', sans-serif;
        }

        /* ✅ Unified Navbar
        .navbar {
            background-color: #1A1E27 !important;
            padding: 15px 0;
            box-shadow: 0 4px 10px rgba(0,0,0,0.25);
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 22px;
            color: #A8C2CC !important;
        }
        .nav-link {
            color: #FFFFFF !important;
            margin-right: 18px;
            font-size: 16px;
            transition: 0.3s;
        }
        .nav-link.active,
        .nav-link:hover {
            color: #A8C2CC !important;
        } */

        /* Card */
        .card {
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.80);
            box-shadow: 0 8px 25px rgba(0,0,0,0.10);
            padding: 25px;
        }

        .card-header {
            background-color: #A8C2CC;
            padding: 18px;
            border-radius: 12px 12px 0 0;
        }
        .card-header h3 {
            margin: 0;
            color: #1A1E27;
            font-weight: 700;
        }

        .btn-primary {
            background-color: #1A1E27;
            border: none;
            border-radius: 10px;
        }
        .btn-primary:hover {
            background-color: #8C9297;
        }

        .btn-secondary {
            background-color: #8C9297;
            border: none;
            border-radius: 10px;
        }
        .btn-secondary:hover {
            background-color: #1A1E27;
        }
    </style>
</head>

<body>

    <!-- ✅ NAVBAR
    <nav class="navbar navbar-expand-lg navbar-dark">
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
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <div class="card">
                    <div class="card-header">
                        <h3>Edit Employee</h3>
                    </div>

                    <div class="card-body">

                        <form:form modelAttribute="employee" action="/employees/edit/${employee.id}" method="post">
                            <form:hidden path="id"/>

                            <!-- Name -->
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <form:input path="name" class="form-control" required="true"/>
                                <form:errors path="name" class="text-danger"/>
                            </div>

                            <!-- Email -->
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <form:input path="email" type="email" class="form-control" required="true"/>
                                <form:errors path="email" class="text-danger"/>
                            </div>

                            <!-- Department -->
                            <div class="mb-3">
                                <label class="form-label">Department</label>
                                <form:select path="department.id" class="form-control" required="true">
                                    <form:option value="">-- Select Department --</form:option>
                                    <form:options items="${departments}" itemValue="id" itemLabel="name"/>
                                </form:select>
                                <form:errors path="department" class="text-danger"/>
                            </div>

                            <!-- Salary -->
                            <div class="mb-3">
                                <label class="form-label">Salary</label>
                                <form:input path="salary" type="number" step="0.01" class="form-control" required="true"/>
                                <form:errors path="salary" class="text-danger"/>
                            </div>

                            <!-- Phone -->
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <form:input path="phone" class="form-control" required="true"/>
                            </div>

                            <!-- Hire Date -->
                            <div class="mb-3">
                                <label class="form-label">Hire Date</label>
                                <form:input path="hireDate" type="date" class="form-control" required="true"/>
                            </div>

                            <!-- Joining Date -->
                            <div class="mb-3">
                                <label class="form-label">Joining Date</label>
                                <form:input path="joiningDate" type="date" class="form-control" required="true"/>
                            </div>

                            <!-- Buttons -->
                            <div class="d-grid gap-2 mt-4">
                                <button type="submit" class="btn btn-primary">Update Employee</button>
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
