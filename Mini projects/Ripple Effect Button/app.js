const btns = document.querySelectorAll('.btn');
const circles = document.querySelectorAll('.circle');

btns.forEach((btn,ind) => {
    btn.addEventListener('click',(e) => {
        circle = circles[ind];
 
        if(circle.classList.contains('ripple')) circle.classList.remove('ripple');
        clickAlign(circle,e.offsetX,e.offsetY);
        circle.classList.add('ripple');
    });
});

function clickAlign(el,x,y){
    console.log(x,y)
    el.style.top = `${y}px`;
    el.style.left = `${x}px`;
}