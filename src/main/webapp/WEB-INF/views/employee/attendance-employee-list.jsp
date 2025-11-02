<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Attendance</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #A8C2CC; /* ✅ Your palette */
        }

        .table-container {
            background: #FFFFFF;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #1A1E27; /* dark navy */
            font-weight: 600;
        }
    </style>
</head>

<body class="p-4">

<div class="table-container">

    <h2>Attendance - ${employee.name}</h2>
    <hr>

    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Date</th>
                <th>Check In</th>
                <th>Check Out</th>
                <th>Status</th>
                <th>Notes</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="a" items="${attendanceList}">
                <tr>
                    <td>${a.date}</td>
                    <td>${a.checkInFormatted}</td>
                    <td>${a.checkOutFormatted}</td>
                    <td>${a.status}</td>
                    <td>${a.notes}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="${pageContext.request.contextPath}/employees" class="btn btn-secondary">Back</a>

</div>

</body>
</html>
