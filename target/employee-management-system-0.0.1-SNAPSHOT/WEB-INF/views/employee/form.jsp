<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add/Edit Employee - Employee Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">EMS</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="/employees">Employees</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/departments">Departments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/attendance">Attendance</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3>${employee.id == null ? 'Add New Employee' : 'Edit Employee'}</h3>
                    </div>
                    <div class="card-body">
                        <form:form action="/employees/save" method="post" modelAttribute="employee">
                            <form:hidden path="id"/>
                            
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <form:input path="name" class="form-control" required="true"/>
                                <form:errors path="name" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <form:input path="email" type="email" class="form-control" required="true"/>
                                <form:errors path="email" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label for="department" class="form-label">Department</label>
                                <form:select path="department.id" class="form-control" required="true">
                                    <form:option value="" label="Select Department"/>
                                    <form:options items="${departments}" itemValue="id" itemLabel="name"/>
                                </form:select>
                                <form:errors path="department" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label for="salary" class="form-label">Salary</label>
                                <form:input path="salary" type="number" step="0.01" class="form-control" required="true"/>
                                <form:errors path="salary" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label for="hireDate" class="form-label">Hire Date</label>
                                <form:input path="hireDate" type="date" class="form-control" required="true"/>
                                <form:errors path="hireDate" class="text-danger"/>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Save Employee</button>
                                <a href="/employees" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>