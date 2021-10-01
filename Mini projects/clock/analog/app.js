'use-strict'

//DARK/LIGHT MODE
const toggle = document.querySelector('.toggle');
const element = document.querySelector('.circle');
const body = document.querySelector('body');

toggle.addEventListener('click', () => {
    body.classList.toggle('light');
});

//CLOCK
const h = document.querySelector('.hours');
const m = document.querySelector('.minutes');
const s = document.querySelector('.seconds');

setInterval(() => {
    const date = new Date();


    h.style.transform = `rotateZ(${date.getHours() * 30 +
        (date.getMinutes() * 6 / 12)}deg)`;
    m.style.transform = `rotateZ(${date.getMinutes() * 6}deg)`;
    s.style.transform = `rotateZ(${date.getSeconds() * 6}deg)`;

}, 1000);