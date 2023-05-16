<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-15
  Time: 오전 8:47
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
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<header>
    <div id="header">
        <h1>BookShopping-Mall</h1>
    </div>
</header>

<nav class="navbar navbar-expand-lg bg-light navbar-dark bg-dark">
    <div class="container-fluid">
        <img src="/resources/images/logo.webp" alt="" width="100" height="70" >

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/customer/login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/book/shop">shop</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Community
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">자유게시판</a></li>
                        <li><a class="dropdown-item" href="#">1:1</a></li>
                        <li><a class="dropdown-item" href="#">FAQ</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>

    </div>
</nav>

<main>
    <%!String tagline = "Welcome to Book Market!";%>
    <div class="container mainContainer">
        <div class="text-center">
            <h3>
                <%=tagline%>
            </h3>
            <%
                response.setIntHeader("Refresh", 1);
                Date day = new java.util.Date();
                String am_pm;
                int hour = day.getHours();
                int minute = day.getMinutes();
                int second = day.getSeconds();
                if (hour / 12 == 0) {
                    am_pm = "AM";
                } else {
                    am_pm = "PM";
                    hour = hour - 12;
                }
                String CT = hour + ":" + minute + ":" + second + " " + am_pm;
                out.println("현재 접속  시각: " + CT + "\n");
            %>
        </div>
        <hr>
    </div>
</main>

<footer class="container">

    <p>&copy; BookMarket</p>
</footer>
</body>
</html>
