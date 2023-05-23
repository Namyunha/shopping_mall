<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-15
  Time: 오전 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/"><img src="/resources/images/logo.webp" alt="" width="100" height="70"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <c:choose>
                    <c:when test="${loginId == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="/customer/login">Login</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="/book/save">Save</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/customer/logout">Log Out</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/customer/mypage">My Page</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>

            <form class="d-flex">
                <c:choose>
                    <c:when test="${loginId== null}">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </c:when>
                    <c:otherwise>
                        <a href="/book/cart" class="btn btn-outline-dark">
                            <i class="bi-cart-fill me-1"></i>
                                ${loginId}님의 장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </form>
        </div>
    </div>
</nav>