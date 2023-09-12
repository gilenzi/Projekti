'use-strict';

const sliderContainer = document.querySelector('.slider');
const sliderLeft= document.querySelector('.slider__left-side');
const slidesText= sliderLeft.querySelectorAll('.slider__text-section');

const sliderRight= document.querySelector('.slider__image-section');
const btnDown = document.querySelector('.arrow--down');
const btnUp = document.querySelector('.arrow--up');
const slidesLength = sliderRight.querySelectorAll('div').length;
const slidesImages = sliderRight.querySelectorAll('div');

let activeSlideIndex = 0;
sliderLeft.style.top = `-${(slidesLength - 1) * 100}vh`;

btnUp.addEventListener('click',() => changeSlide('up'));
btnDown.addEventListener('click',() => changeSlide('down'));


function changeSlide(direction){
    if(direction === 'up'){
        activeSlideIndex++;
        if(activeSlideIndex > slidesLength - 1){
            activeSlideIndex = 0;
        }
    }
    if(direction === 'down'){
        activeSlideIndex--;
        if(activeSlideIndex < 0){
            activeSlideIndex = slidesLength - 1;
        };
    }
    sliderRight.style.transform = `translateY(-${activeSlideIndex * 100}%)`;
    sliderLeft.style.transform = `translateY(${activeSlideIndex * 100}%)`;
}