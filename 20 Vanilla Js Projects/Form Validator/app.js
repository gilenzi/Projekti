'use strict';

const username = document.querySelector("[name='username']");
const email = document.querySelector("[name='email']");
const password = document.querySelector("[name='password']");
const confirmPassword = document.querySelector("[name='confirm-password']");
const btn = document.querySelector(".btn");

let errorMessage = '';

btn.addEventListener('click',checkFields);

function checkFields(e){
    e.preventDefault();

    checkRequired([username, email, password, confirmPassword]);
    checkLength(username, 3, 10);
    checkLength(password, 6, 12);
    checkEmail(email);
    checkPasswords(password, confirmPassword);
}

// CHECK  FUNCTIONS
////////////////////////////////////////////////////////////////////////////////////////


function checkPasswords(password1, password2){
    if((password1.value.trim() !== '' && password2.value.trim() !== '') && password1.value === password2.value){
        showSuccess(password1);
        showSuccess(password2);
    }else{
        showError(password2,`${getFieldName(password2)} password do not match`);
    }
}

function checkLength(el, min, max){
    if(el.value.length < min){
        showError(el,`${getFieldName(el)} must be at least ${min} characters`);
    }
    else if(el.value.length > max){
        showError(el,`${getFieldName(el)} must be maximum ${max} characters`);
    }else{
        showSuccess(el);
    }
}

function checkEmail(el){
    const re =
    /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

    if(!re.test(String(el.value).toLowerCase())){
        showError(el,`${getFieldName(el)} is not valid`);
    }else{
        showSuccess(el);
    }
}


function checkRequired(arr){
    for(let i = 0 ; i < arr.length ; i++){
        let el = arr[i];

        if(el.value.trim() === ''){
            showError(el,`${getFieldName(el)} is required`);
        }else{
            showSuccess(el);
        }
    }
}

function getFieldName(el){
    return  `${el.id.charAt(0).toUpperCase() + el.id.slice(1)}`;
}

function showError(element, msg){
    element.nextElementSibling.textContent = msg;
    element.classList.add('is-wrong');
}

function showSuccess(element){
    element.classList.contains('is-wrong') ? element.classList.remove('is-wrong') : element.classList.add('is-correct')
    element.classList.add('is-correct')
    element.nextElementSibling.textContent = '';
}


