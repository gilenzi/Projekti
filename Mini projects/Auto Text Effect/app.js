
const text = document.querySelector('.auto-text');
const speed = document.querySelector('.speed');
const textToRender = 'We Love Programming';
let speedIndex = 500 / speed.value;

let ind = 1;
speed.addEventListener('input',(e) => {
    speedIndex = 500 / e.target.value;
});



function sepparateText(){
    text.textContent = textToRender.slice(0,ind);
    ind++;
    if(ind > textToRender.length){
        ind = 1;
    }

    setTimeout(sepparateText,speedIndex);
}

sepparateText();
