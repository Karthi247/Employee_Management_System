<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    :root {
        --dark: #1A1E27;
        --gray: #8C9297;
        --blue: #A8C2CC;
        --light: #DDE7EB;
        --white: #FFFFFF;
    }

    /* ✅ Navbar */
    .navbar-custom {
        background: var(--dark);
    }
    .navbar-custom .navbar-brand,
    .navbar-custom .nav-link {
        color: var(--white) !important;
        font-weight: 500;
    }
    .navbar-custom .nav-link.active {
        border-bottom: 2px solid var(--blue);
    }
</style>

<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="/">EMS</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/employees">Employees</a></li>
                <li class="nav-item"><a class="nav-link" href="/departments">Departments</a></li>
                <li class="nav-item"><a class="nav-link" href="/attendance">Attendance</a></li>
            </ul>
        </div>
    </div>
</nav>
