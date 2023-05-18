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
    <link rel="stylesheet" href="/resources/css/save.css">
</head>
<body>

<form id="saveForm" name="saveForm" action="/customer/save" method="post">
    <h1 class="h3 mb-3 fw-normal">회원가입</h1>
    <div id="nameBlank">
        <div class="nameBlank_component">
            <label for="name" class="form-label">이름</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="홍길동">
        </div>
        <div class="nameBlank_component">
            <label for="nickname" class="form-label">별명</label>
            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="흑염소">
        </div>
    </div>
    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Email</label>
        <input type="email" class="form-control" id="exampleFormControlInput1" name="email"
               placeholder="name@example.com">
    </div>
    <div>
        <label for="exampleFormControlInput1" class="form-label">비밀번호</label>
        <input type="password" class="form-control" name="password" id="floatingPassword">
    </div>
    <label for="sample6_address">주소입력</label>
    <div>
        <input type="text" id="address" name="address" display="none">
        <input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호">
        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
        <input type="text" id="sample6_address" placeholder="주소"><br>
        <input type="text" id="sample6_detailAddress" placeholder="상세주소">
        <input type="text" id="sample6_extraAddress" placeholder="참고항목">
    </div>
    <button onclick="join()" class="w-100 btn btn-lg btn-primary">회원가입하기</button>
    <br>
    <input type="button" onclick="goBack()" class="w-100 btn btn-lg btn-dark" value="뒤로가기">
    <p class="mt-5 mb-3 text-muted">©2017–2023</p>
</form>


</body>
<script>
    const goBack = () => {
        history.back();
    }
    const saveForm = document.querySelector("#saveForm");


    function handleSubmit(event) {
        event.preventDefault();
    }
    const join = () => {
        const name = document.querySelector("#name");
        const nickname = document.querySelector("#nickname");
        const email = document.querySelector("#exampleFormControlInput1");
        const password = document.querySelector("#floatingPassword");

        const postcode = document.querySelector("#sample6_postcode");
        const mainAddress = document.querySelector("#sample6_address");
        const detailAddress = document.querySelector("#sample6_detailAddress");
        let address = document.querySelector("#address");
        saveForm.addEventListener("submit", handleSubmit);

        if (name.value == "") {
            alert("이름을 입력해주세요")
            name.focus();
        } else if (nickname.value == "") {
            alert("별명을 입력해주세요");
            nickname.focus();
        } else if (email.value == "") {
            alert("이메일을 입력해주세요");
            email.focus();
        } else if (password.value == "") {
            alert("비밀번호를 입력해주세요");
            password.focus();
        } else if (postcode.value == "") {
            alert("우편번호를 입력해주세요");
            postcode.focus();
        } else if (mainAddress.value == "") {
            alert("주소를 입력해주세요");
            mainAddress.focus();
        } else if (detailAddress.value == "") {
            alert("상세주소를 입력해주세요");
            detailAddress.focus();
        } else {
            address.value = postcode.value + ", " + mainAddress.value + ", " + detailAddress.value;
            alert("회원가입에 성공하셨습니다");
            saveForm.submit();
        }
    }


</script>

</html>
