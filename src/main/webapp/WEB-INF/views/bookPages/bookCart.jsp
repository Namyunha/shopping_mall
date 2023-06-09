<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오후 1:49
  To change this template use File | Settings | File Templates.
--%>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--    <div class="container px-4 px-lg-5">--%>
<%--        <a class="navbar-brand" href="/"><img src="/resources/images/logo.webp" alt="" width="100" height="70"></a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"--%>
<%--                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span--%>
<%--                class="navbar-toggler-icon"></span></button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
<%--            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">--%>
<%--                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>--%>
<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"--%>
<%--                       data-bs-toggle="dropdown" aria-expanded="false">Shop</a>--%>
<%--                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                        <li><a class="dropdown-item" href="#!">All Products</a></li>--%>
<%--                        <li>--%>
<%--                            <hr class="dropdown-divider"/>--%>
<%--                        </li>--%>
<%--                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>--%>
<%--                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>

<%--            <form class="d-flex">--%>
<%--                <button class="btn btn-outline-dark" type="submit">--%>
<%--                    <i class="bi-cart-fill me-1"></i>--%>
<%--                    Cart--%>
<%--                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>--%>
<%--                </button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Shop Item - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/scripts.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>

<%@include file="../component/header.jsp" %>

<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-dark text-light">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
        <h1 class="display-4 fw-normal">장바구니</h1>
        <%--        <p class="lead fw-normal">담은 물건들</p>--%>
        <%--        <a class="btn btn-outline-secondary" href="#">Coming soon</a>--%>
    </div>
    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
</div>

<div class="m-md-3">

    <c:choose>
        <c:when test="${bookList == null}">
            <h1>등록된 도서가 없습니다.</h1>
        </c:when>
        <c:otherwise>
            <table class="table">
                <thead class="table-dark">
                <tr>
                    <th><input id="bookCheck" onclick="allClick()" type="checkbox"></th>
                    <th>도서명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>합계</th>
                    <th>삭제</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach items="${bookList}" var="book">
                    <input id="customerId" type="text" name="${customer.id}" value="${customer.id}"
                           style="display: none">
                    <input id="cartId" type="text" name="${cartDTO.id}" value="${cartDTO.id}" style="display: none">
                    <tr>
                        <td><input class="oneClick" type="checkbox"
                                   onclick="onCheck(`${book.id}`)"></td>
                        <td>${book.bookName}</td>
                        <td>${book.unitPrice}</td>
                        <td><input id="${book.id}" class="count"
                                   onblur="countChange(`${book.id}`,`${book.unitPrice}`,`${book.unitsInStock}`,`${customer.id}`, `${book.bookName}`)"
                                   type="text" value="${book.bookCount}"> <span id="${book.id}Span"
                                                                                style="color: red">재고수량: ${book.unitsInStock}</span>
                        </td>
                        <td id="${book.id}Price" class="price">${book.bookCount*book.unitPrice}</td>
                        <td>
                            <button onclick="onDelete(`${book.id}`)">삭제</button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>

                <tfoot class="table-primary">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>총수량: <span id="sumCount"></span></td>
                    <td>총금액: <span id="sumPrice"></span></td>
                </tr>
                </tfoot>
            </table>
        </c:otherwise>
    </c:choose>
</div>


<div class="m-md-3">
    <input id="buyBtn" type="button" onclick="buyBtn()"
           class="w-100 btn btn-lg btn-primary" value="구매하기" disabled>
    <a href="/book/shop" class="w-100 btn btn-lg btn-dark" type="submit">쇼핑하기</a>
</div>

</body>
</html>
