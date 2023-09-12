const background = document.querySelector('.loading');

function fadeEffect(element){
    let i = 0;
    let b = 0;
    const effect = setInterval( _ => {
        i += 2;
        b++;

        if(b == 80){
            element.classList.add('fade-out');
            clearInterval(effect);
        }
        element.style.cssText = `background: radial-gradient(circle, rgba(255,216,216,1) ${b}%, rgba(133,122,150,1) ${i}%);`
    
    }, 50);
}    

fadeEffect(background);
