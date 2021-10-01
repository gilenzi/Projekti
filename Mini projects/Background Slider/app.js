'use-strict';

const sliderContainer = document.querySelector('.slider-container');
const sliderView = document.querySelector('.slider-view');
const btns = document.querySelectorAll('.btn');

let imgNumber = 1;

function changeImg(counter){
    let path = `images/photo-${counter}.jpeg`;

    sliderView.style.backgroundImage  = `url('${path}')`;
    sliderContainer.style.backgroundImage  = `url('${path}')`;
}

btns[0].addEventListener('click',() => {
    imgNumber--;
    if(imgNumber < 1) imgNumber = 3;
    changeImg(imgNumber);
});

btns[1].addEventListener('click',() => {
    imgNumber++;
    if(imgNumber > 3) imgNumber = 1;
    changeImg(imgNumber);
});
