<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-15
  Time: 오전 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>


<form action="/customer/login" method="post" id="loginForm" name="loginForm">
    <a href="/">
        <img class="mb-4" src="/resources/images/logo.webp" alt="" width="72" height="57">
    </a>
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating">
        <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
        <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
        <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
        <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
    </div>

    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
    <br>
    <input type="button" onclick="goSignUp()" class="w-100 btn btn-lg btn-dark" value="Sign up">
    <p class="mt-5 mb-3 text-muted">© 2017–2023</p>
</form>

<script>
    const goSignUp = () => {
        location.href = "/customer/save"
    }
    const customer = {
        "email": email.value,
        "password" : password.value
    }
</script>
</body>
</html>
