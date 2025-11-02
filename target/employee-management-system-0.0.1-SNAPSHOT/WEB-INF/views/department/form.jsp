<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add/Edit Department - Employee Management System</title>
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
                        <a class="nav-link active" href="/departments">Departments</a>
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
                        <h3>${department.id == null ? 'Add New Department' : 'Edit Department'}</h3>
                    </div>
                    <div class="card-body">
                        <form:form action="/departments/save" method="post" modelAttribute="department">
                            <form:hidden path="id"/>
                            
                            <div class="mb-3">
                                <label for="name" class="form-label">Department Name</label>
                                <form:input path="name" class="form-control" required="true"/>
                                <form:errors path="name" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <form:textarea path="description" class="form-control" rows="3"/>
                                <form:errors path="description" class="text-danger"/>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Save Department</button>
                                <a href="/departments" class="btn btn-secondary">Cancel</a>
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