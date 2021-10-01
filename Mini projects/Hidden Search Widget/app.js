'use-strict';

const search = document.querySelector('#search');
const btn = document.querySelector('.search-btn');

btn.addEventListener('click',() => {
    search.classList.toggle('toggle');
    search.focus();
});