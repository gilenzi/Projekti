
const toggle =  document.querySelector('button');
const nav = document.querySelector('nav');

toggle.addEventListener('click',() => {
    nav.classList.toggle('active');
});