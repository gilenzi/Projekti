'use-strict';

const panel = document.querySelectorAll('.panel');
const container = document.querySelector('.container');

container.addEventListener('click',(e) => {
    if(e.target.classList.contains('panel')){
        panel.forEach((panel) => {
            if(panel.classList.contains('active')) panel.classList.toggle('active') 
        });
        e.target.classList.add('active');
    }
});