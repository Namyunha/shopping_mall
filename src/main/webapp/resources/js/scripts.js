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
    if(inputQuantity.value>0){
        inputQuantity.value--;
    } else {
        alert("수량이 모자랍니다");
    }
}



const goCart = () => {
    cart-form.preventDefault();
    location.href="/book/cart";
}



const addCart = (id, sellerId) => {
    let inputQuantity = document.querySelector("#inputQuantity").value;
    $.ajax({
        type: "post",
        url: "/book/cart",
        data:{
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