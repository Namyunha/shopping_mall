function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

const goBack = () => {
    history.back();
}

function handleSubmit(event) {
    event.preventDefault();
}

const join = () => {
    const saveForm = document.querySelector("#saveForm");
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

const duCheckEmail = () => {
    const email = document.querySelector("#exampleFormControlInput1");
    const duCheckEmailResult = document.querySelector("#duCheckEmailResult");
    const joinBtn = document.querySelector("#joinBtn");
    $.ajax({
        type: "post",
        url: "/customer/emailCheck",
        data: {
            email: email.value
        },
        success: function () {
            duCheckEmailResult.innerHTML = "이용가능한 이메일입니다";
            duCheckEmailResult.style.color = "green";
            joinBtn.disabled = false;
        },
        error: function () {
            duCheckEmailResult.innerHTML = "이미 존재하는 이메일입니다";
            duCheckEmailResult.style.color = "red";
            joinBtn.disabled = true;
        }
    })
}

const pwRegularCheck = () => {
    const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,12}$/;
    const password = document.querySelector("#floatingPassword");
    const pwRegularResult = document.querySelector("#pwRegularResult");
    const checkPassword = document.querySelector("#checkPassword");
    const pwDuCheckResult = document.querySelector("#pwDuCheckResult");
    // const joinBtn = document.querySelector("#joinBtn");
    if (password.value.match(exp)) {
        pwRegularResult.innerHTML = "이용가능한 비밀번호입니다.";
        pwRegularResult.style.color = "green";
        checkPassword.disabled = false;
        // joinBtn.disabled = false;
    } else {
        pwRegularResult.innerHTML = "영,소문자,숫자 포함 6~12자를 입력해주세요";
        pwRegularResult.style.color = "red";
        checkPassword.disabled = true;
        checkPassword.value = "";
        pwDuCheckResult.innerHTML = "";
        // joinBtn.disabled = true;
    }
}

const pwDuCheck = () => {
    const password = document.querySelector("#floatingPassword");
    const checkPassword = document.querySelector("#checkPassword");
    const pwDuCheckResult = document.querySelector("#pwDuCheckResult");
    const joinBtn = document.querySelector("#joinBtn");
    if (password.value == checkPassword.value) {
        pwDuCheckResult.innerHTML = "비밀번호가 일치합니다";
        pwDuCheckResult.style.color = "green";
        joinBtn.disabled = false;
    } else {
        pwDuCheckResult.innerHTML = "비밀번호가 일치하지 않습니다";
        pwDuCheckResult.style.color = "red";
        joinBtn.disabled = true;
    }
}

