<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --dark-navy: #1A1E27;
            --gray: #8C9297;
            --light-blue: #A8C2CC;
            --pale-blue: #DDE7EB;
            --white: #FFFFFF;
        }

        body {
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, var(--dark-navy), var(--light-blue));
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
        }

        .card-custom {
            width: 380px;
            border-radius: 18px;
            background: var(--white);
            padding: 30px;
            box-shadow: 0px 12px 40px rgba(0,0,0,0.15);
            animation: fadeIn 0.7s ease-in-out;
        }

        h3 {
            font-weight: 600;
            color: var(--dark-navy);
        }

        .form-label {
            color: var(--gray);
            font-weight: 500;
        }

        .form-control {
            border-radius: 10px;
            padding: 10px;
            border: 1px solid var(--pale-blue);
        }

        .btn-custom {
            background: var(--light-blue);
            border: none;
            color: var(--dark-navy);
            font-weight: 600;
            border-radius: 10px;
            padding: 10px;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background: var(--gray);
            color: var(--white);
        }

        a {
            color: var(--dark-navy);
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .alert {
            border-radius: 10px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

<div class="card-custom">
    
    <h3 class="text-center mb-3">Login</h3>

    <c:if test="${errorMessage != null}">
        <div class="alert alert-danger text-center">${errorMessage}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">

        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" placeholder="Enter your username" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter your password" required />
        </div>

        <button class="btn-custom w-100 mt-2">Login</button>
    </form>

    <p class="text-center mt-3">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/signup">Sign Up</a>
    </p>

</div>

</body>
</html>
