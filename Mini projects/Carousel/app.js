
const images = document.querySelectorAll('.carousel__img');
const btnLeft = document.querySelector('.carousel__btn--left');
const btnRight = document.querySelector('.carousel__btn--right');

let currentIndex = images.length - 1;

btnRight.addEventListener('click',slideLeft);
btnLeft.addEventListener('click',slideRight);


let interval = setInterval(slideLeft, 2000);

function resetInterval(){
    clearInterval(interval);
    interval = setInterval(slideLeft,2000);
}

function slideLeft(){
    resetInterval();

    if(currentIndex === 0){
        for(let i = 0 ; i < images.length ; i++){
            (function(i){
                setTimeout(() => {
                    images[i].classList.remove('moveLeft');
                }, i * 150);
            })(i);
        }
        currentIndex = images.length - 1;
        return;
    }

    if(images[currentIndex].classList.contains('moveRight')){
        images[currentIndex].classList.remove('moveRight');
    }
    images[currentIndex].classList.add('moveLeft');
    currentIndex--;

}

function slideRight(){
    resetInterval();

    if(currentIndex === 3) {
        for(let i = images.length - 1; i > 0; i--){
            console.log(i);
            (function(i){
                setTimeout(() => {
                    if(images[i].classList.contains('moveRight')){
                        images[i].classList.remove('moveRight');
                    }
                    images[i].classList.add('moveLeft');
                    
                    console.log(i);
                }, 250 / i);
            })(i);
        }
        currentIndex = 0;
        return;
    }
    currentIndex++;

    if(images[currentIndex].classList.contains('moveLeft')){
        switchClasses(images[currentIndex]);
    }
    images[currentIndex].classList.add('moveRight');
}


function switchClasses(element){
    element.classList.remove('moveLeft');
    element.classList.add('moveRight');
}