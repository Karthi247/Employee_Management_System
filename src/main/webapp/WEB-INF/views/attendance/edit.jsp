<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Attendance - EMS</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #DDE7EB;
            margin: 0;
            padding: 0;
        }

        .form-container {
            background: #FFFFFF;
            width: 450px;
            margin: 40px auto;
            padding: 25px;
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            color: #1A1E27;
            margin-bottom: 20px;
            font-weight: bold;
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

        textarea { height: 80px; }

        /* BUTTONS: both buttons same size and full-width */
        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 6px;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 12px 14px;
            border-radius: 8px;
            font-size: 15px;
            text-align: center;
            cursor: pointer;
            border: none;
            text-decoration: none; /* for anchor */
        }

        /* Primary (Update) */
        .btn-primary {
            background-color: #1A1E27;
            color: #ffffff;
        }
        .btn-primary:hover {
            background-color: #000000;
        }

        /* Secondary (Cancel) — same size as primary */
        .btn-secondary {
            background-color: #8C9297;
            color: #fff;
            padding: 11px 1px;
        }
        .btn-secondary:hover {
            background-color: #1A1E27;
        }

        /* Ensure <a> elements behave the same as buttons */
        a.btn { display: block; }
    </style>
</head>

<body>

<div class="form-container">

    <h2>Edit Attendance</h2>

    <form action="/attendance/update" method="post">

        <!-- Hidden ID -->
        <input type="hidden" name="id" value="${attendance.id}">

        <!-- Employee Name (non-editable) -->
        <label>Employee</label>
        <input type="text" value="${attendance.employee.name}" disabled>
        <input type="hidden" name="employeeId" value="${attendance.employee.id}">

        <!-- Date -->
        <label>Date</label>
        <input type="date" name="date" value="${attendance.date}" required>

        <!-- Check In -->
        <label>Check In</label>
        <input type="time" name="checkIn" value="${attendance.checkInFormatted}">

        <!-- Check Out -->
        <label>Check Out</label>
        <input type="time" name="checkOut" value="${attendance.checkOutFormatted}">

        <!-- Status -->
        <label>Status</label>
        <select name="status" required>
            <c:forEach var="st" items="${statuses}">
                <option value="${st}" ${attendance.status == st ? 'selected' : ''}>${st}</option>
            </c:forEach>
        </select>

        <!-- Notes -->
        <label>Notes</label>
        <textarea name="notes">${attendance.notes}</textarea>

        <!-- Buttons (both same size) -->
        <div class="btn-group">
            <button type="submit" class="btn btn-primary">Update Attendance</button>
            <a href="/attendance" class="btn btn-secondary">Cancel</a>
        </div>

    </form>
</div>

</body>
</html>
