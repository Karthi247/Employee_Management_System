<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employees in Department</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body { background-color: #DDE7EB; font-family: 'Segoe UI'; }

        .navbar { background-color: #1A1E27 !important; }
        .navbar-brand { color: #A8C2CC !important; font-weight: bold; }
        .nav-link { color: white !important; }
        .nav-link:hover { color: #A8C2CC !important; }

        .card { 
            border-radius: 20px; 
            padding: 20px; 
            background: white; 
            box-shadow: 0 6px 20px rgba(0,0,0,0.15); 
        }

        thead { background-color: #1A1E27; color: white; }
        tbody tr:hover { background-color: #EEF3F6; transform: scale(1.01); }
        table { border-radius: 14px; overflow: hidden; }

        .btn-back {
            background: #8C9297;
            color: white;
            padding: 8px 14px;
            border-radius: 8px;
            text-decoration: none;
            display: inline-block;   /* ✅ FIX: Allows margin spacing */
            margin-bottom: 15px;     /* ✅ FIX: Spacing from card */
        }
        .btn-back:hover {
            background: #1A1E27;
        }
    </style>
</head>

<body>

<!-- <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="/">EMS</a>

        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="/employees">Employees</a></li>
            <li class="nav-item"><a class="nav-link active" href="/departments">Departments</a></li>
            <li class="nav-item"><a class="nav-link" href="/attendance">Attendance</a></li>
        </ul>
    </div>
</nav> -->

<div class="container mt-4">

    <h2 class="mb-3">
        Employees in Department: 
        <span style="color:#1A1E27;">${department.name}</span>
    </h2>

    <!-- ✅ FIX: Back button now has proper spacing -->
    <a href="/departments" class="btn-back">← Back to Departments</a>

    <div class="card mt-2">

        <table class="table text-center table-striped align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Joining Date</th>
                    <th>Salary</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="emp" items="${employees}">
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.name}</td>
                        <td>${emp.email}</td>
                        <td>${emp.joiningDate}</td>
                        <td>${emp.salary}</td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>

    </div>
</div>

</body>
</html>
