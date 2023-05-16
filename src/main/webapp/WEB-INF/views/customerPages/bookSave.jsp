<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-15
  Time: 오전 11:45
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <%-- 우편번호 --%>
    <script src="/resources/js/save.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/bookSave.css">
</head>
<body>

<form action="/book/save" id="saveForm" name="boardSave" method="post" enctype="multipart/form-data">
    <h1 class="h3 mb-3 fw-normal">책등록</h1>
    <div id="nameBlank">
        <div class="nameBlank_component">
            <label for="bookName" class="form-label">도서명</label>
            <input type="text" class="form-control" name="bookName" id="bookName">
        </div>
        <div class="nameBlank_component">
            <label for="unitPrice" class="form-label">도서가격</label>
            <input type="text" class="form-control" name="unitPrice" id="unitPrice">
        </div>
        <div class="nameBlank_component">
            <label for="unitsInStock" class="form-label">입고 수</label>
            <input type="text" class="form-control" name="unitsInStock" id="unitsInStock">
        </div>
    </div>

    <div class="mb-3">
        <label for="author" class="form-label">저자</label>
        <input type="text" class="form-control" name="author" id="author">
    </div>

    <div class="mb-3">
        <label for="descript" class="form-label">설명</label>
        <textarea class="form-control" name="descript" id="descript" rows="3"></textarea>
    </div>

    <div class="form-floating">
        <select class="form-select" id="floatingSelect" name="publisher" aria-label="Floating label select example">
            <option value="">Publisher</option>
            <option value="종합출판사">종합출판사</option>
            <option value="문학출판사">문학출판사</option>
            <option value="사회과학출판사">사회과학출판사</option>
        </select>
        <label for="floatingSelect">Works with selects</label>
    </div>
    <div class="form-floating">
        <select class="form-select" id="floatingSelect2" name="category" aria-label="Floating label select example">
            <option value="">category</option>
            <option value="액션">액션</option>
            <option value="판타지">판타지</option>
            <option value="자기개발">자기개발</option>
        </select>
        <label for="floatingSelect2">Works with selects</label>
    </div>
    <div class="form-floating">
        <select class="form-select" name="conditions" id="floatingSelect3" aria-label="Floating label select example">
            <option value="">책상태</option>
            <option value="중고">중고</option>
            <option value="신상">신규</option>
            <option value="E-Book">E-Book</option>
        </select>
        <label for="floatingSelect3">Works with selects</label>
    </div>
    <div class="mb-3">
        <label for="releaseDate" class="form-label">출판일</label>
        <input type="text" class="form-control" id="releaseDate" name="releaseDate">
    </div>
    <div class="mb-3">
        <label for="formFileMultiple" class="form-label">책이미지</label>
        <input class="form-control" name="bookFile" type="file" id="formFileMultiple" multiple>
    </div>
    <%--    releaseDate--%>
    <button class="w-100 btn btn-lg btn-primary" type="submit">책등록하기</button>
    <br>
    <input type="button" onclick="goBack()" class="w-100 btn btn-lg btn-dark" value="뒤로가기">
    <p class="mt-5 mb-3 text-muted">©2017–2023</p>
</form>
</body>
<script>
    const goBack = () => {
        history.back();
    }
</script>

</html>
