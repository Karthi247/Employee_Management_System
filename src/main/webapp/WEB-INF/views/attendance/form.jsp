<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EMS - Attendance Form</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #DDE7EB;
            margin: 0;
            padding: 0;
        }

        /* ✅ NAVBAR */
        .navbar {
            background-color: #1A1E27;
            color: white;
            padding: 15px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar a {
            color: #DDE7EB;
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
        }
        .navbar a:hover {
            color: white;
        }

        /* ✅ FORM CONTAINER */
        .form-container {
            background: white;
            width: 450px;
            margin: 40px auto;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #1A1E27;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #1A1E27;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #8C9297;
            border-radius: 6px;
            background-color: #F5F9FB;
        }

        textarea {
            height: 80px;
        }

        /* Remove underline from all button links */
a.btn {
    text-decoration: none;
    display: block;
    padding: 12px 16px;
    width: auto;
    text-align: center;
}

/* Prevent blue hover for links */
a.btn:hover {
    color: white;
}


        .btn {
            width: 100%;
            background-color: #1A1E27;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #000000;
        }
    </style>

</head>
<body>

<!-- ✅ NAVBAR INSIDE SAME FILE -->
<!-- <div class="navbar">
    <div class="nav-title">EMS System</div>
    <div>
        <a href="/employees">Employees</a>
        <a href="/attendance/list">Attendance</a>
        <a href="/logout">Logout</a>
    </div>
</div> -->

<!-- ✅ FORM -->
<div class="form-container">

    <h2>${attendance.id == null ? "Add Attendance" : "Edit Attendance"}</h2>

    <form action="${attendance.id == null ? '/attendance/save' : '/attendance/update'}" method="post">

        <!-- Hidden field for Edit -->
        <c:if test="${attendance.id != null}">
            <input type="hidden" name="id" value="${attendance.id}">
        </c:if>

        <!-- EMPLOYEE DROPDOWN -->
        <label>Employee</label>
        <select name="employeeId" required>
            <c:forEach var="emp" items="${employees}">
                <option value="${emp.id}" 
                    ${attendance.employee != null && emp.id == attendance.employee.id ? "selected" : ""}>
                    ${emp.name}
                </option>
            </c:forEach>
        </select>

        <!-- DATE -->
        <label>Date</label>
        <input type="date" name="date"
               value="${attendance.date}"
               required>

        <!-- CHECK-IN TIME -->
        <label>Check In</label>
        <input type="time" name="checkIn"
               value="${attendance.checkInFormatted}">

        <!-- CHECK-OUT TIME -->
        <label>Check Out</label>
        <input type="time" name="checkOut"
               value="${attendance.checkOutFormatted}">

        <!-- STATUS -->
        <label>Status</label>
        <select name="status" required>
            <c:forEach var="st" items="${statuses}">
                <option value="${st}"
                    ${attendance.status == st ? "selected" : ""}>
                    ${st}
                </option>
            </c:forEach>
        </select>

        <!-- NOTES -->
        <label>Notes</label>
        <textarea name="notes">${attendance.notes}</textarea>

            <div style="margin-top: 15px;">
                <button type="submit" class="btn">Save Attendance</button>
                <a href="/attendance" class="btn" style="background:#8C9297; margin-top:10px;">Cancel</a>
            </div>


    </form>
</div>

</body>
</html>
