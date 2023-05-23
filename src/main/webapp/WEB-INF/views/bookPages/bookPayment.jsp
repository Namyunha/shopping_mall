<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-22
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/styles.css">
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="/resources/js/payment.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<%@include file="../component/header.jsp" %>
<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-dark text-light">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
        <h1 class="display-4 fw-normal">결제하기</h1>
        <%--        <p class="lead fw-normal">담은 물건들</p>--%>
        <%--        <a class="btn btn-outline-secondary" href="#">Coming soon</a>--%>
    </div>
    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
</div>

<div class="m-md-3">
    <table class="table">
        <thead class="table-dark">

        <tr>
            <th>책 제목</th>
            <th>구매 수량</th>
            <th>총 가격</th>
            <th>결제 상태</th>
        </tr>
        </thead>
        <tbody>

        <c:choose>

            <c:when test="${bookList == null}">
                <h1>구매할 수 있는 도서가 없습니다.</h1>
            </c:when>

            <c:otherwise>
                <c:forEach items="${bookList}" var="book">
                    <tr>
                        <td>${book.bookName}</td>
                        <td>${book.unitsInStock}</td>
                        <td>${book.unitsInStock * book.unitPrice}</td>
                        <td>미결제</td>
                    </tr>
                </c:forEach>

                <tr>
                    <td>총 수량: ${sumDTO.sumCount}</td>
                    <td>총 결제금액: ${sumDTO.sumPrice}</td>
                    <td></td>
                    <td></td>
                </tr>
            </c:otherwise>

        </c:choose>
        </tbody>
    </table>
</div>

<form class="wrapper m-md-3">

    <div style="width: 100%; display: flex">
        <button onclick="repositData()" style="width: 50%" type="button" class="btn btn-dark">저장정보</button>
        <button onclick="writeData()" style="width: 50%" type="button" class="btn btn-danger">직접입력</button>
    </div>

    <div id="data-area">
        <div class="row g-3" style="width: 100%">
            <div style="display: flex; width: 100%; align-items: center" class="col-auto">
                <label style="width: 20%" for="name">주문자이름</label>
                <input style="width: 80%" type="text" class="form-control" id="name" placeholder="${customerDTO.name}"
                       readonly>
            </div>
        </div>

        <div class="row g-3" style="width: 100%">
            <div style="display: flex; width: 100%; align-items: center" class="col-auto">
                <label style="width: 20%" for="address">배송지주소</label>
                <input style="width: 80%" type="text" class="form-control" id="address"
                       placeholder="${customerDTO.address}" readonly>
            </div>
        </div>

        <div class="row g-3" style="width: 100%">
            <div style="display: flex; width: 100%; align-items: center" class="col-auto">
                <label style="width: 20%" for="email">이메일</label>
                <input style="width: 80%" type="text" class="form-control" id="email" placeholder="${customerDTO.email}"
                       readonly>
            </div>
        </div>
    </div>

    <div>
        <button onclick="onPay()" type="button" class="btn btn-outline-dark">결제하기</button>
        <button type="button" class="btn btn-outline-danger">결제취소</button>
    </div>

</form>
</body>

<script>

    const onPay = () => {
        $.ajax({
            type: "post",
            url: "/book/payment",
            data: {
                customerId: "${customerDTO.id}",
                sumCount: ${sumDTO.sumCount},
                sumPrice: ${sumDTO.sumPrice},
                customerName: "${customerDTO.name}",
                payConditions: "결제대기",
                shipmentConditions: "배송준비",
                address: "${customerDTO.address}",
                email: "${customerDTO.email}"
            },
            success: function () {
                location.href="/customer/mypage";
                alert("결제성공");
            },
            error: function () {
                alert("결제실패");
            }
        })
    }

</script>
</html>
