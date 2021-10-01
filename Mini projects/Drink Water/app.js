'use-strict';

const remaind = document.querySelector('.remaind');
const bottle = document.querySelector('.bottle');
const liters = document.querySelector('#liters');
const glases = document.querySelectorAll('.glass');
const bottleFull = document.querySelector('.bottle-full');
const glasesContainer = document.querySelector('.glasses');

glasesContainer.addEventListener('click',(e) => {
    if(e.target.classList.contains('glass') &&
     !e.target.classList.contains('full')){
        e.target.classList.add('full')
        reduceLiters();
    }else{
        e.target.classList.toggle('full');
    }


    updateBigCup();

    
});
updateBigCup();

function reduceLiters(){
    let step = (2 / glases.length);
    liters.innerHTML -= step; 
}

function updateBigCup(){
    const fullGlasses = document.querySelectorAll('.glass.full').length;
    const totalGlasses = document.querySelectorAll('.glass').length;
    if(fullGlasses === 0){
        bottleFull.style.visibility = 'hidden';
        bottleFull.style.height = 0;
    }else{
        bottleFull.style.visibility = 'visible';
        bottleFull.style.height = `${fullGlasses / totalGlasses * 330}px`;
        bottleFull.innerHTML = `${fullGlasses / totalGlasses * 100}%`;
    }
    if(fullGlasses === totalGlasses){
        remaind.style.display = 'none';
        remaind.style.hight = 0;
    }else{
        remaind.style.display = 'flex';
        liters.innerHTML = `${2 - fullGlasses * 0.25}`;
    }
}

// function fillBottle(){
//     let step = 82.50;
//     bottleFull.style.height = step + 'px';

// }
