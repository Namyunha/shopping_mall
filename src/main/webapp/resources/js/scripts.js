/*!
* Start Bootstrap - Shop Item v5.0.6 (https://startbootstrap.com/template/shop-item)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-item/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

const plusBtn = () => {
    let inputQuantity = document.querySelector("#inputQuantity");
    console.log(inputQuantity);
    inputQuantity.value++;
    console.log(inputQuantity.value);
}


const minusBtn = () => {
    let inputQuantity = document.querySelector("#inputQuantity");
    if (inputQuantity.value > 0) {
        inputQuantity.value--;
    } else {
        alert("수량이 모자랍니다");
    }
}


const goCart = () => {
    cart - form.preventDefault();
    location.href = "/book/cart";
}


const addCart = (id, sellerId) => {
    let inputQuantity = document.querySelector("#inputQuantity").value;
    $.ajax({
        type: "post",
        url: "/book/detail",
        data: {
            bookId: id,
            bookCount: inputQuantity,
            customerId: sellerId
        },
        success: function () {
            alert("장바구니에 물건이 담겼습니다.");
        },
        error: function () {
            alert("물건 담기에 실패하였습니다.");
        }
    })
}


const onCheck = () => {
    let sumC = document.querySelector("#sumCount").innerHTML;
    let sumP = document.querySelector("#sumPrice").innerHTML;
    let buyBtn = document.querySelector("#buyBtn");
    const oneCheck = document.querySelectorAll(".oneClick");
    const sumCount = document.querySelector("#sumCount");
    const sumPrice = document.querySelector("#sumPrice");
    const oneCount = document.querySelectorAll(".count");
    const onePrice = document.querySelectorAll(".price");
    let sumc = 0;
    let sump = 0;
    console.log(sumC);
    console.log(sumP);
    if (sumC == 0 && sumP == 0) {
        buyBtn.disabled = false;
    } else {
        buyBtn.disabled = true;
    }
    for (let i = 0; i < oneCheck.length; i++) {
        let checkCount = oneCheck[i].checked;
        console.log(checkCount);
        if (oneCheck[i].checked == true) {
            sumc += +oneCount[i].value;
            sump += +onePrice[i].innerHTML; // 문자열을 숫자로 변환하여 더함
        }
    }
    sumCount.innerHTML = sumc;
    sumPrice.innerHTML = sump;
}

const countChange = (id, unitPrice, unitsInStock, customerId, bookName) => {
    const bookPrice = document.getElementById(id + "Price");
    const bookSpan = document.getElementById(id + "Span");
    let bookId = document.getElementById(id);
    let inputQuantity = parseInt(bookId.value); // 입력된 수량을 숫자로 변환
    let unitsInstocks = unitsInStock - inputQuantity;
    if (inputQuantity < 0 || bookId.value == "") {
        inputQuantity = 0;
        bookId.value = 0;
        unitsInstocks = unitsInStock - inputQuantity;
        bookSpan.innerHTML = "재고수량: " + unitsInstocks;
        bookPrice.innerHTML = inputQuantity * unitPrice;
        alert("0 이상의 값을 입력해주세요.");
    } else if (inputQuantity > parseInt(unitsInStock)) {
        inputQuantity = 0;
        bookId.value = 0;
        unitsInstocks = unitsInStock - inputQuantity;
        bookSpan.innerHTML = "재고수량: " + unitsInstocks;
        bookPrice.innerHTML = inputQuantity * unitPrice;
        alert("재고 수량을 확인해주세요.");
    } else {
        bookPrice.innerHTML = inputQuantity * unitPrice;
        bookSpan.innerHTML = "재고수량: " + unitsInstocks;
        $.ajax({
            type: "post",
            url: "/book/payment",
            data: {
                customerId: customerId,
                bookId: id,
                bookCount: inputQuantity,
                unitsInStock: unitsInstocks,
                unitPrice: unitPrice,
                bookName: bookName
            },
            success: function () {
                console.log("수량변경 성공");
                onCheck();
            },
            error: function () {
                console.log("수량변경 실패");
            }
        })
    }
}


const allClick = () => {
    const bookCheck = document.querySelector("#bookCheck");
    const oneCheck = document.querySelectorAll(".oneClick");
    const sumCount = document.querySelector("#sumCount");
    const sumPrice = document.querySelector("#sumPrice");
    const oneCount = document.querySelectorAll(".count");
    const onePrice = document.querySelectorAll(".price");
    let sumc = 0;
    let sump = 0;
    if (bookCheck.checked == false) {
        let buyBtn = document.querySelector("#buyBtn");
        for (let i = 0; i < oneCheck.length; i++) {
            oneCheck[i].checked = false;
            buyBtn.disabled = true;
        }
    } else if (bookCheck.checked == true) {
        let buyBtn = document.querySelector("#buyBtn");
        for (let i = 0; i < oneCheck.length; i++) {
            oneCheck[i].checked = true;
            sumc += +oneCount[i].value;
            sump += +onePrice[i].innerHTML;
            buyBtn.disabled = false;
        }
    }
    sumCount.innerHTML = sumc;
    sumPrice.innerHTML = sump;
}

const onDelete = (id) => {
    $.ajax({
        type: "post",
        url: "/book/delete?id=" + id,
        success: function () {
            location.href = "/book/cart"
            alert("삭제에 성공하셨습니다.");
        },
        error: function () {
            alert("삭제에 실패하셨습니다.")
        }
    })
}


function buyBtn() {
    // 선택된 체크박스 가져오기
    let checkboxes = document.querySelectorAll('input.oneClick:checked');
    // DTO 객체 생성
    const dto = {
        books: []
    };
    // 선택된 체크박스에 대해 반복하여 ID와 도서 수량을 DTO에 추가
    checkboxes.forEach(function (checkbox) {
        let bookId = checkbox.getAttribute('onclick').match(/`([^`]*)`/)[1]; // 체크박스의 onclick 속성에서 bookId 추출
        let bookCountInput = document.getElementById(bookId);
        let bookCount = bookCountInput.value;
        let customerId = document.getElementById("customerId").value;
        // DTO에 ID와 수량 추가
        dto.books.push({
            customerId: customerId,
            bookId: bookId,
            bookCount: bookCount,
        });
    });
    console.log(dto);
    $.ajax({
        url: '/book/payment', // 서버 요청을 처리할 URL
        type: 'post',
        contentType: 'application/json',
        data: JSON.stringify(dto),
        success: function (response) {
            console.log("성공");
            location.href = "/book/payment";
            console.log(response);
        },
        error: function (xhr, status, error) {
            console.log("실패");
            console.log('AJAX Error:', error);
        }
    });
}








