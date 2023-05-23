<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-23
  Time: 오후 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp" %>

<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center text-bg-primary text-light">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
        <h1 class="display-4 fw-normal">마이페이지</h1>
        <%--        <p class="lead fw-normal">담은 물건들</p>--%>
        <%--        <a class="btn btn-outline-secondary" href="#">Coming soon</a>--%>
    </div>
    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
</div>

<div class="m-md-3">
    <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <button class="nav-link active" id="v-pills-order-tab" data-bs-toggle="pill"
                    data-bs-target="#v-pills-order" type="button" role="tab" aria-controls="v-pills-order"
                    aria-selected="true">주문/배송조회
            </button>
            <button class="nav-link" id="v-pills-bag-tab" data-bs-toggle="pill"
                    data-bs-target="#v-pills-bag" type="button" role="tab" aria-controls="v-pills-bag"
                    aria-selected="false">장바구니
            </button>
            <button class="nav-link" id="v-pills-update-tab" data-bs-toggle="pill"
                    data-bs-target="#v-pills-update" type="button" role="tab" aria-controls="v-pills-update"
                    aria-selected="false">회원정보수정-
            </button>
            <button class="nav-link" id="v-pills-fill-tab" data-bs-toggle="pill"
                    data-bs-target="#v-pills-fill" type="button" role="tab" aria-controls="v-pills-fill"
                    aria-selected="false">포인트충전
            </button>
            <button class="nav-link" id="v-pills-history-tab" data-bs-toggle="pill"
                    data-bs-target="#v-pills-history" type="button" role="tab" aria-controls="v-pills-history"
                    aria-selected="false">포인트충전내역
            </button>
        </div>

        <div style="width: 100%">
            <div style="width: 100%">
                <nav class="navbar navbar-expand-lg bg-body-tertiary " style="background-color: gray; width: 100%">
                    <div class="container-fluid">
                        <div style="color: white" class="navbar-brand" href="#">주문/배송 조회</div>
                    </div>
                </nav>
                <div style="width: 100%">
                    <c:choose>
                        <c:when test="${orderList == null}">
                            <h1>결제 상품이 없습니다.</h1>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${orderList}" var="order">

                                <table class="table">
                                    <thead class="table-dark">
                                    <tr>
                                        <th>일자</th>
                                        <th>상품정보</th>
                                        <th>배송지</th>
                                        <th>배송상태</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td>${order.createdDate}</td>
                                        <td>${bookList[0].bookName}</td>
                                        <c:if test="${countNum}>0">
                                            <td>${bookList[0].bookName}외 ${countNum}권</td>
                                        </c:if>
                                        <td>${order.address}</td>
                                        <td>${order.shipmentConditions}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </c:forEach>

                        </c:otherwise>

                    </c:choose>

                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
