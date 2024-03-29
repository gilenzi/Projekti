'use-strict';

const progress = document.querySelector('#progress');
const prev = document.querySelector('#prev');
const next = document.querySelector('#next');
const circles = document.querySelectorAll('.circle');

let currentActive = 1;

next.addEventListener('click',() => {
    currentActive++;

    if(currentActive > circles.length) currentActive = circles.length;

    update();
});

prev.addEventListener('click',() => {
    currentActive--;

    if(currentActive < 1) currentActive = 1;

    update();
});

function update(){
    circles.forEach((circle,ind) =>{
        ind < currentActive ? circle.classList.add('active') :
        circle.classList.remove('active')
    });

    const actives = document.querySelectorAll('.active');
    progress.style.width = ((actives.length - 1) / (circles.length - 1)) * 99 + '%';

    if(currentActive === 1){
        prev.disabled = true;
    }else if(currentActive === circles.length){
        next.disabled = true;
    }else{
        next.disabled = false;
        prev.disabled = false;
    }
}