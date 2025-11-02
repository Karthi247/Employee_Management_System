<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Attendance Records - Employee Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">EMS</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/employees">Employees</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/departments">Departments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/attendance">Attendance</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Attendance Records</h2>
            <a href="/attendance/record" class="btn btn-primary">Record Attendance</a>
        </div>

        <!-- Filter Form -->
        <div class="card mb-4">
            <div class="card-body">
                <form action="/attendance/search" method="get" class="row g-3">
                    <div class="col-md-3">
                        <label for="department" class="form-label">Department</label>
                        <select name="departmentId" class="form-select">
                            <option value="">All Departments</option>
                            <c:forEach items="${departments}" var="dept">
                                <option value="${dept.id}" ${param.departmentId == dept.id ? 'selected' : ''}>
                                    ${dept.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="startDate" class="form-label">Start Date</label>
                        <input type="date" name="startDate" class="form-control" 
                               value="${param.startDate}">
                    </div>
                    <div class="col-md-3">
                        <label for="endDate" class="form-label">End Date</label>
                        <input type="date" name="endDate" class="form-control" 
                               value="${param.endDate}">
                    </div>
                    <div class="col-md-3 d-flex align-items-end">
                        <button type="submit" class="btn btn-primary w-100">Search</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Employee</th>
                            <th>Department</th>
                            <th>Check In</th>
                            <th>Check Out</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${attendanceRecords}" var="record">
                            <tr>
                                <td><fmt:formatDate value="${record.date}" pattern="yyyy-MM-dd"/></td>
                                <td>${record.employee.name}</td>
                                <td>${record.employee.department.name}</td>
                                <td><fmt:formatDate value="${record.checkIn}" pattern="HH:mm"/></td>
                                <td><fmt:formatDate value="${record.checkOut}" pattern="HH:mm"/></td>
                                <td>
                                    <span class="badge bg-${record.status == 'PRESENT' ? 'success' : 
                                                         record.status == 'LATE' ? 'warning' : 
                                                         record.status == 'ABSENT' ? 'danger' : 'secondary'}">
                                        ${record.status}
                                    </span>
                                </td>
                                <td>
                                    <a href="/attendance/edit/${record.id}" class="btn btn-sm btn-warning">Edit</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>