<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Department List - Employee Management System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --dark-navy: #1A1E27;
            --gray: #8C9297;
            --light-blue: #A8C2CC;
            --pale-blue: #DDE7EB;
            --white: #FFFFFF;
        }

        body {
            background-color: var(--pale-blue);
            font-family: 'Segoe UI', sans-serif;
        }

        /* ✅ NAVBAR — SAME AS EMPLOYEE PAGE */
        .navbar {
            background-color: var(--dark-navy) !important;
            padding: 15px 0;
            box-shadow: 0 4px 10px rgba(0,0,0,0.25);
        }
        .navbar-brand {
            font-weight: bold;
            color: var(--light-blue) !important;
            font-size: 22px;
        }
        .nav-link {
            color: var(--white) !important;
            margin-right: 18px;
            font-size: 16px;
        }
        .nav-link.active,
        .nav-link:hover {
            color: var(--light-blue) !important;
        }

        /* ✅ Page Title */
        h2 {
            color: var(--dark-navy);
            font-weight: 700;
        }

        /* ✅ Card Styling */
        .card {
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(8px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.15);
            border: 1px solid rgba(255,255,255,0.4);
            padding: 20px;
        }

        /* ✅ Buttons (same as Employee page) */
        .btn-primary {
            background-color: var(--dark-navy);
            border: none;
            border-radius: 10px;
        }
        .btn-primary:hover {
            background-color: var(--gray);
        }

        .btn-warning {
            background-color: var(--light-blue);
            border: none;
            color: #000;
            border-radius: 8px;
        }
        .btn-warning:hover {
            background-color: var(--gray);
            color: white;
        }

        .btn-danger {
            background-color: var(--gray);
            border: none;
            border-radius: 8px;
        }
        .btn-danger:hover {
            background-color: var(--dark-navy);
            color: white;
        }

        .btn-info {
            background-color: var(--light-blue);
            border-radius: 8px;
            border: none;
            color: #000;
        }
        .btn-info:hover {
            background-color: var(--gray);
            color: white;
        }

        /* ✅ TABLE MATCHES EMPLOYEE PAGE */
        table {
            border-radius: 14px;
            overflow: hidden;
        }

        .attendance-table thead tr th {
            background-color: #A8C2CC !important;
            color: #000 !important;     
        }
        thead {
            background-color: var(--dark-navy);
            color: white;
        }

        tbody tr {
            transition: 0.3s;
        }

        tbody tr:hover {
            background-color: #EEF3F6;
            transform: scale(1.01);
            box-shadow: 0 4px 14px rgba(0,0,0,0.1);
        }

        td, th {
            vertical-align: middle;
        }
    </style>
</head>

<body>

    <!-- ✅ NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="/">EMS</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navMenu">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/employees">Employees</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/departments">Departments</a></li>
                    <li class="nav-item"><a class="nav-link" href="/attendance">Attendance</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- ✅ MAIN CONTENT -->
    <div class="container mt-4">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Department List</h2>
            <a href="/departments/add" class="btn btn-primary px-4 py-2">+ Add Department</a>
        </div>

        <div class="card">

            <table class="table table-striped align-middle text-center">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Department Name</th>
                        <th>Description</th>
                        <th>Total Employees</th>
                        <th style="width: 250px;">Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${departments}" var="dept">
                        <tr>
                            <td>${dept.id}</td>
                            <td>${dept.name}</td>
                            <td>${dept.description}</td>
                            <td>${dept.employees != null ? dept.employees.size() : 0}</td>

                            <td>
                                <a href="/departments/edit/${dept.id}" class="btn btn-sm btn-warning">Edit</a>
                                <a href="/departments/delete/${dept.id}" 
                                   onclick="return confirm('Are you sure you want to delete this department?')" 
                                   class="btn btn-sm btn-danger">Delete</a>
                                <a href="/departments/departments/${dept.id}/employees" class="btn btn-sm btn-info">View Employees</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>

        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
