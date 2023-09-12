
const clickNumber = document.querySelector('.number-of-likes');
const image = document.querySelector('.image');
const heart = document.querySelector('.fa-heart');

let likes = 0;

image.addEventListener('click',(e) => {
    heart.classList.contains('animation') ? heart.classList.remove('animation') : ''
    ;
    likes++;
    const top = e.offsetY - '40';
    const left = e.offsetX - '48';
    heart.style.cssText = `
    top: ${top}px;
    left: ${left}px;
    `;
    heart.classList.add('animation');

    clickNumber.textContent = likes;

})
