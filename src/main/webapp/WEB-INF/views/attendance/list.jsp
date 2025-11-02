<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EMS - Attendance List</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body {
            background-color: #DDE7EB;
            font-family: 'Segoe UI', sans-serif;
        }

        /* ✅ UNIFIED NAVBAR (SAME AS EMPLOYEE PAGE) */
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
            color: white !important;
            margin-right: 18px;
            font-size: 16px;
            transition: 0.3s;
        }

        .nav-link:hover,
        .nav-link.active {
            color: #A8C2CC !important;
        }

        /* ✅ PAGE TITLE */
        h2 {
            color: #1A1E27;
            font-weight: 700;
        }

        /* ✅ CARD CONTAINER (EXACT SAME AS EMPLOYEE PAGE) */
        .card {
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(8px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.15);
            border: 1px solid rgba(255,255,255,0.4);
        }

        /* ✅ TABLE (MATCH EMPLOYEE PAGE) */
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

        /* ✅ BUTTONS */
        .btn-add {
            background-color: #1A1E27;
            border: none;
            border-radius: 10px;
            color: white;
            padding: 10px 16px;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-add:hover {
            background-color: #8C9297;
        }

        .btn-edit {
            background-color: #A8C2CC;
            border-radius: 8px;
            color: #000;
            padding: 6px 12px;
            border: none;
            text-decoration: none;
        }

        .btn-edit:hover {
            background-color: #8C9297;
            color: white;
        }

        .btn-delete {
            background-color: #8C9297;
            border: none;
            border-radius: 8px;
            padding: 6px 12px;
            color: white;
        }

        .btn-edit, .btn-delete {
    display: inline-block;
    text-decoration: none !important;
    border: none;
}

.btn-edit:hover, .btn-delete:hover {
    text-decoration: none !important;
    color: #DDE7EB !important;
}


        .btn-delete:hover {
            background-color: #1A1E27;
        }

    </style>

</head>
<body>

<!-- ✅ NAVBAR (same styling as Employee List page) -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="/">EMS</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/employees">Employees</a></li>
                <li class="nav-item"><a class="nav-link" href="/departments">Departments</a></li>
                <li class="nav-item"><a class="nav-link active" href="/attendance">Attendance</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- ✅ PAGE CONTENT -->
<div class="container mt-4">

    <!-- Title + Add Button (same layout as employee list) -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Attendance List</h2>
        <a href="/attendance/add" class="btn-add">+ Add Attendance</a>
    </div>

    <!-- ✅ CARD WRAPPER (same as employee list) -->
    <div class="card p-3">
        <div class="card-body">

            <table class="table table-striped align-middle text-center">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee</th>
                    <th>Date</th>
                    <th>Check In</th>
                    <th>Check Out</th>
                    <th>Status</th>
                    <th>Notes</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="att" items="${attendanceList}">
                    <tr>
                        <td>${att.id}</td>
                        <td>${att.employee.name}</td>
                        <td>${att.date}</td>
                        <td>${att.checkInFormatted}</td>
                        <td>${att.checkOutFormatted}</td>
                        <td>${att.status}</td>
                        <td>${att.notes}</td>

                        <td>
                            <a href="/attendance/edit/${att.id}" class="btn-edit">Edit</a>
                            <a href="/attendance/delete/${att.id}"
                               class="btn-delete"
                               onclick="return confirm('Delete this attendance?')">
                               Delete
                            </a>
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
