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


const onCheck = () => {
    const oneCheck = document.querySelectorAll(".oneClick");
    const sumCount = document.querySelector("#sumCount");
    const sumPrice = document.querySelector("#sumPrice");
    const oneCount = document.querySelectorAll(".count");
    const onePrice = document.querySelectorAll(".price");
    let sumc = 0;
    let sump = 0;
    for (let i = 0; i < oneCheck.length; i++) {
        if (oneCheck[i].checked == true) {
            sumc += +oneCount[i].value;
            sump += +onePrice[i].innerHTML; // 문자열을 숫자로 변환하여 더함
        }
    }
    sumCount.innerHTML = sumc;
    sumPrice.innerHTML = sump;
}


// const countChange = (id, unitPrice, unitsInStock) => {
//     const bookPrice = document.getElementById(id + "Price");
//     let bookId = document.getElementById(id);
//     console.log("id: " + id);
//     console.log("unitPrice: " + unitPrice);
//     console.log("unitsInStock: " + unitsInStock);
//     console.log(bookId.value);
//     if (bookId.value < 0) {
//         bookId.value = 0;
//         bookPrice.innerHTML = bookId.value * unitPrice;
//         alert("0이상 입력해주세요");
//     } else if (bookId.value > unitsInStock) {
//         bookId.value = 0;
//         bookPrice.innerHTML = bookId.value * unitPrice;
//         alert("재고수량을 확인해주세요");
//     } else {
//         bookPrice.innerHTML = bookId.value * unitPrice;
//         onCheck();
//     }
//     console.log(unitPrice);
//     console.log(bookId.value);
//     console.log(bookPrice);
//     console.log(bookPrice.innerHTML);
// }

const countChange = (id, unitPrice, unitsInStock) => {
    const bookPrice = document.getElementById(id + "Price");
    let bookId = document.getElementById(id);
    const inputQuantity = parseInt(bookId.value); // 입력된 수량을 숫자로 변환
    if (inputQuantity < 0) {
        bookId.value = 0;
        bookPrice.innerHTML = inputQuantity * unitPrice;
        alert("0 이상의 값을 입력해주세요.");
    } else if (inputQuantity > parseInt(unitsInStock)) {
        bookId.value = 0;
        bookPrice.innerHTML = inputQuantity * unitPrice;
        alert("재고 수량을 확인해주세요.");
    } else {
        bookPrice.innerHTML = inputQuantity * unitPrice;
    }
    onCheck();
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
        for (let i = 0; i < oneCheck.length; i++) {
            oneCheck[i].checked = false;
        }
    } else if (bookCheck.checked == true) {
        for (let i = 0; i < oneCheck.length; i++) {
            oneCheck[i].checked = true;
            sumc += +oneCount[i].value;
            sump += +onePrice[i].innerHTML;
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

const buyBtn = () => {

    console.log("id: "+id);

    console.log("unitsInStock: "+unitsInStock);
    const stocks = unitsInStock - bookCount
    $.ajax({
        type: "post",
        url: "/book/payment",
        data: {
            bookId: id,
            bookCount: bookCount,
            unitsInStock: stocks,
        },
        success: function () {
            const result = confirm("구매페이지로 가시겠습니까?");
            if (result) {
                location.href = "/book/payment";
            } else {
                location.href = "/book/shop";
            }
        },
        error: function () {
            alert("물건을 구매 하실수 없습니다.");
        }
    })
}







