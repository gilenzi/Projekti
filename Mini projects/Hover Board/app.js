
const boxesContainer = document.querySelector('.boxes-container');

boxesContainer.addEventListener('mouseover',changeColors);

function changeColors(e){
    if(e.target.classList.contains('box')){
        generateColor(e.target);
    }
}

function generateColor(element){
    let colors = [];
    for(let i = 0; i < 3 ; i++){
        colors.push(Math.floor(Math.random() * 255));
    }
    [color1,color2,color3] = colors;
    element.style.backgroundColor = `rgb(${color1},${color2},${color3})`;
    setTimeout(_ => element.style.backgroundColor = `rgb(41, 40, 40)`,500);
}