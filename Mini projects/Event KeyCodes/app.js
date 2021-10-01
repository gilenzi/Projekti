'use-strict';

const introBox = document.querySelector('.intro');
const aboutKey = document.querySelector('.about-key');
const eKey = document.querySelector('.e-key');
const eKeyCode = document.querySelector('.e-key-code');
const eCode = document.querySelector('.e-code');

window.addEventListener('keydown',(e) => {

    introBox.classList.add('fade');
    aboutKey.classList.add('active');

    if(e.keyCode === 27){
        introBox.classList.remove('fade');
        aboutKey.classList.remove('active');
    }

    eKey.textContent = e.key;
    eKeyCode.textContent = e.keyCode;
    eCode.textContent = e.code;
});