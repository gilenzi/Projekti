'use-strict'

const h = document.querySelector('.hours p:nth-child(1)');
const m = document.querySelector('.minutes p:nth-child(1)');
const s = document.querySelector('.seconds p:nth-child(1)');

const clock = setInterval(() => {
    const date = new Date();
    h.innerHTML = (date.getHours()).toString().padStart(2, '0');
    m.innerHTML = (date.getMinutes()).toString().padStart(2, '0');
    s.innerHTML = (date.getSeconds()).toString().padStart(2, '0');
}, 1000);

