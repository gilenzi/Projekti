const boxesContainer = document.querySelector('.box-image');
const btn = document.querySelector('.btn');


function createbox(){
    for(let i = 0 ; i < 4 ; i++){
        for(let j = 0; j < 4 ; j++){
            const box = document.createElement('div');
            box.classList.add('box-image__box');
            box.style.backgroundPosition = `${-j * 125}px ${-i * 125}px`;
            boxesContainer.appendChild(box);
        }
    }
}

btn.addEventListener('click',_ => {
    boxesContainer.classList.toggle('big');
});
createbox();