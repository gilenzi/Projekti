'use-strict';

const loadText = document.querySelector('.loading-text');
const bg = document.querySelector('.bg');

let load = 0;

let int = setInterval(blurring,30);

function blurring(){  
    load++;
    
    if(load > 99){
        clearInterval(int);
    }
    loadText.textContent = `${load}%`;
    bg.style.filter =`blur(${30 - (load/3.3)}px)`;
    if(load === 80){
        loadText.classList.add('fade');
        setTimeout(() => {
            loadText.innerHTML = '';
        },1000);
    }

}
