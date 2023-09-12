'use-strict';

const gameField = document.getElementsByClassName('game-field')[0];
const insectContainer = document.getElementsByClassName('insects-container')[0];
const score = document.querySelector('.score span');
const message = document.querySelector('.message');
const hours = document.querySelector('.hours');
const seconds = document.querySelector('.seconds');
const minutes = document.querySelector('.minutes');


let result = 0;
let speedUp = 5;
let intervalId;
let appearSpeed = 2000;


insectContainer.addEventListener('click',(e) => {
    const el = e.target;


    createInsect(el.dataset.insectType);
    setTimer();

});

gameField.addEventListener('click',(e) => {
    const el = e.target;

    if(el.classList.contains('insect-box')){
        if(!el.classList.contains('is-clicked')){
            el.classList.add('is-clicked');
            result++;

            if(score.textContent == '15'){
                message.classList.add('is-visible');
                setTimeout(()=>  {
                    message.classList.remove('is-visible');
                },3000);
            }

            score.textContent = result;
            appearSpeed -= speedUp;

            intervalId = setInterval(createInsect,appearSpeed,el.dataset.insectType);
        }
    }
});

function setTimer(){
    let sec = 0;
    let min = 0;
    
    setInterval(() => {
        sec++;
        sec = sec <= 9 ? `0${sec}` : sec;
        
        if(sec === 60){
            min++;
            sec = 0;

            min = min <= 9 ? `0${min}` : min;
            minutes.textContent = min;
        }

        seconds.textContent = sec;
    },1000);
}


function createInsect(insectType){

    const rotation = Math.floor(Math.random() * 361);
    let positionY = Math.floor(Math.random() * gameField.clientHeight) + 1;
    let positionX = Math.floor(Math.random() * gameField.clientWidth) + 1;

    positionY > 100 ? positionY -= 100 : positionY;
    positionX > 100 ? positionX -= 100 : positionX;

    let box = document.createElement('div');
    box.setAttribute('data-insect-type',`${insectType}`);
    box.classList.add('insect-box');
    box.style.cssText = `
    top: ${positionY}px;
    left: ${positionX}px;
    background-image: url(./images/${insectType}.png);
    transform: rotate(${rotation}deg);
    `;

    gameField.appendChild(box);
}