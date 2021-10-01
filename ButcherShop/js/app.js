'use-strict';

const circleContainer = document.querySelector('.circle');
const container = document.querySelector('.container');
const circle = document.querySelector('.circle');

// LADNING PAGE SPLIT
const landingContainer = document.querySelector('.landing-split-container')
const leftSide = document.querySelector('.split.left');
const rightSide = document.querySelector('.split.right');
// LADNING PAGE SPLIT 2
const landingContainer2 = document.querySelector('.landing-split-container.second')
const leftSide2 = document.querySelector('.split-left-2');
const rightSide2 = document.querySelector('.split-right-2');
// EVENT LISTENERS
circleContainer.addEventListener('click',navigationRoll);
leftSide.addEventListener('mouseenter',landingSplitLeft);
rightSide.addEventListener('mouseenter',landingSplitRight);
// LADNING PAGE SPLIT 2
leftSide2.addEventListener('mouseenter',landingSplitLeft2);
rightSide2.addEventListener('mouseenter',landingSplitRight2);


// FUNCTIONS
function navigationRoll(e){
    if(e.target.classList.contains('fa-bars') || e.target.classList.contains('fa-times')){
        container.classList.toggle('show-nav');
        circle.classList.toggle('circle-rotate');
    }
}

function landingSplitLeft(){
    landingContainer.classList.add('hover-left');
    landingContainer.classList.remove('hover-right');
}
function landingSplitRight(){
    landingContainer.classList.add('hover-right');
    landingContainer.classList.remove('hover-left');
}
// LADNING PAGE SPLIT 2
function landingSplitLeft2(){
    landingContainer2.classList.add('hover-left');
    landingContainer2.classList.remove('hover-right');
}
function landingSplitRight2(){
    landingContainer2.classList.add('hover-right');
    landingContainer2.classList.remove('hover-left');
}