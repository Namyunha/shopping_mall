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
        url: "/book/cart",
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

const onCheck = (count, price) => {
    const oneCheck = document.querySelectorAll(".oneClick");
    const sumCount = document.querySelector("#sumCount");
    const sumPrice = document.querySelector("#sumPrice");
    const oneCount = document.querySelectorAll(".count");
    const onePrice = document.querySelectorAll(".price");
    let sumc = 0;
    let sump = 0;
    for (let i = 0; i < oneCheck.length; i++) {
        if (oneCheck[i].checked == true) {
            sumc += +oneCount[i].value.innerHTML;
            sump += +onePrice[i].value.innerHTML; // 문자열을 숫자로 변환하여 더함
        }
    }
    sumCount.innerHTML = sumc;
    sumPrice.innerHTML = sump;
}


const countChange = (unitsPrice) => {
    const changeCount = document.querySelectorAll(".changeCount");
    const price = document.querySelector(".price");
    console.log(unitsPrice);

    console.log(changeCount);
    price.innerHTML = unitsPrice * changeCount;
}


const allClick = () => {
    const bookCheck = document.querySelector("#bookCheck");
    const oneCheck = document.querySelectorAll(".oneClick");
    const sumCount = document.querySelector("#sumCount");
    const sumPrice = document.querySelector("#sumPrice");
    const oneCount = document.querySelectorAll("#changeCount");
    const onePrice = document.querySelectorAll("#price");

    let sumc = 0;
    let sump = 0;

    if (bookCheck.checked == false) {
        for (let i = 0; i < oneCheck.length; i++) {
            oneCheck[i].checked = false;
        }
    } else if (bookCheck.checked == true) {
        for (let i = 0; i < oneCheck.length; i++) {
            oneCheck[i].checked = true;
            sumc += +oneCount[i].value.innerHTML;
            sump += +onePrice[i].value.innerHTML;
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

