<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee List - Employee Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #DDE7EB;
            font-family: 'Segoe UI', sans-serif;
        }

        /* ✅ UNIFIED NAVBAR (same for all pages) */
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
        }

        /* PAGE HEADER */
        h2 {
            color: #1A1E27;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        /* BUTTONS */
        .btn-primary {
            background-color: #1A1E27;
            border: none;
            border-radius: 10px;
            transition: 0.3s;
        }
        .btn-primary:hover {
            background-color: #8C9297;
        }

        .btn-warning {
            background-color: #A8C2CC;
            border: none;
            color: #000;
            border-radius: 8px;
        }
        .btn-warning:hover {
            background-color: #8C9297;
            color: white;
        }

        .btn-danger {
            background-color: #8C9297;
            border: none;
            border-radius: 8px;
        }
        .btn-danger:hover {
            background-color: #1A1E27;
        }

        .btn-info {
            background-color: #A8C2CC;
            border-radius: 8px;
            border: none;
            color: #000;
        }
        .btn-info:hover {
            background-color: #8C9297;
            color: white;
        }

        /* CARD DESIGN */
        .card {
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(8px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.15);
            border: 1px solid rgba(255,255,255,0.4);
        }

        /* TABLE */
        table {
            border-radius: 14px;
            overflow: hidden;
        }
        thead {
            background-color: #1A1E27;
            color: #FFFFFF;
        }

        tbody tr {
            transition: 0.3s;
        }

        tbody tr:hover {
            background-color: #EEF3F6;
            transform: scale(1.01);
            box-shadow: 0 4px 14px rgba(0,0,0,0.1);
        }
    </style>
</head>

<body>

    <!-- ✅ UPDATED UNIFIED NAVBAR -->
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
    </nav>

    <!-- PAGE WRAPPER -->
    <div class="container mt-4">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Employee List</h2>
            <a href="/employees/add" class="btn btn-primary px-4 py-2">+ Add Employee</a>
        </div>

        <div class="card p-3">
            <div class="card-body">

                <table class="table table-striped align-middle text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>joining Date</th>
                            <th>Salary</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${employees}" var="employee">
                            <tr>
                                <td>${employee.id}</td>
                                <td>${employee.name}</td>
                                <td>${employee.email}</td>
                                <td>${employee.department.name}</td>
                                <td>${employee.joiningDate}</td>
                                <td>${employee.salary}</td>

                                <td>
                                    <a href="/employees/edit/${employee.id}" class="btn btn-sm btn-warning">Edit</a>
                                    <a href="/employees/delete/${employee.id}" class="btn btn-sm btn-danger"
                                       onclick="return confirm('Are you sure you want to delete this employee?')">Delete</a>

                                    <a href="/employees/employee/${employee.id}" class="btn btn-sm btn-info">Attendance</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>

            </div>
        </div>
    </div>

</body>
</html>
