<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Record Attendance - Employee Management System</title>
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
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3>${attendance.id == null ? 'Record Attendance' : 'Edit Attendance'}</h3>
                    </div>
                    <div class="card-body">
                        <form:form action="/attendance/save" method="post" modelAttribute="attendance">
                            <form:hidden path="id"/>
                            
                            <div class="mb-3">
                                <label for="date" class="form-label">Date</label>
                                <form:input path="date" type="date" class="form-control" required="true"/>
                                <form:errors path="date" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label for="employee" class="form-label">Employee</label>
                                <form:select path="employee.id" class="form-select" required="true">
                                    <form:option value="" label="Select Employee"/>
                                    <c:forEach items="${employees}" var="emp">
                                        <form:option value="${emp.id}" label="${emp.name} (${emp.department.name})"/>
                                    </c:forEach>
                                </form:select>
                                <form:errors path="employee" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label for="checkIn" class="form-label">Check In Time</label>
                                <form:input path="checkIn" type="time" class="form-control" required="true"/>
                                <form:errors path="checkIn" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label for="checkOut" class="form-label">Check Out Time</label>
                                <form:input path="checkOut" type="time" class="form-control"/>
                                <form:errors path="checkOut" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <form:select path="status" class="form-select" required="true">
                                    <form:option value="PRESENT">Present</form:option>
                                    <form:option value="LATE">Late</form:option>
                                    <form:option value="ABSENT">Absent</form:option>
                                    <form:option value="HALF_DAY">Half Day</form:option>
                                </form:select>
                                <form:errors path="status" class="text-danger"/>
                            </div>

                            <div class="mb-3">
                                <label for="notes" class="form-label">Notes</label>
                                <form:textarea path="notes" class="form-control" rows="3"/>
                                <form:errors path="notes" class="text-danger"/>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Save Attendance</button>
                                <a href="/attendance" class="btn btn-secondary">Cancel</a>
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