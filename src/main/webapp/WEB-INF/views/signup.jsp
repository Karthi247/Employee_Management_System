<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Signup - Employee Management System</title>
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
            font-family: "Poppins", sans-serif;
        }

        .card-custom {
            width: 420px;
            background: var(--white);
            padding: 30px;
            border-radius: 18px;
            box-shadow: 0px 12px 40px rgba(0,0,0,0.15);
            animation: fadeIn 0.7s ease-in-out;
        }

        h3 {
            color: var(--dark-navy);
            font-weight: 600;
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
            transition: 0.3s ease-out;
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

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

<div class="card-custom">
    <h3 class="text-center mb-3">Create Account</h3>

    <form action="${pageContext.request.contextPath}/register" method="post">

        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-control" name="name" placeholder="Enter your full name" required/>
        </div>

        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" class="form-control" name="username" placeholder="Choose a username" required/>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" placeholder="Enter your email" required/>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="password" placeholder="Create a password" required/>
        </div>

        <button class="btn-custom w-100 mt-2">Register</button>
    </form>

    <p class="text-center mt-3">
        Already have an account?
        <a href="${pageContext.request.contextPath}/login">Login</a>
    </p>
</div>

</body>
</html>
