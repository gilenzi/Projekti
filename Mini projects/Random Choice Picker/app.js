'use-strict';

const textArea = document.querySelector('#textarea');
const tagsContaienr = document.querySelector('.tags');
const NUMBER_OF_REPETITIONS = 15;

textArea.focus();
textArea.addEventListener('keydown',(e) => {
    
    if(e.key === 'Enter'){
        let tags = textArea.value;

        resetValues()
        createTag(tags.split(','));
        randomChoice(tags.split(','));

        textArea.focus();
    }
});

function resetValues(){
    textArea.value = '';
    tagsContaienr.innerHTML = '';
}

function createTag(arr){
    const arr2 = arr.filter(tag => tag.trim() !== '');
    arr2.forEach(tag => {
        const element = document.createElement("span");
        element.innerHTML = tag;
        element.classList.add('tag');
        tagsContaienr.appendChild(element);
    });
}

function highlightTag(tag){
    tag.classList.add('highlight');
    setTimeout(() => {
        tag.classList.remove('highlight');
    }, 100);
}

function randomChoice(arr){
    let repetitions = NUMBER_OF_REPETITIONS;
    const tags = document.querySelectorAll('.tag');
    
    const randomInterval = setInterval(() => {
        let index = Math.floor(Math.random() * tags.length);
        repetitions--;
        if(repetitions === 0){
            clearInterval(randomInterval);
            tags[index].classList.add('highlight');
           return
        }
        highlightTag(tags[index]);
    }, 200);














//     let counter = 0;
    
//     const randomInterval = setInterval(() => {
//         const tags = document.querySelectorAll('.tag');
//         const limit = 20;
//         let index = Math.floor(Math.random() * arr.length);
        
//         counter++;
//         // console.log('index' + index)
 
//         tags[index].classList.add('highlight');

//         if(counter === limit){
//         clearInterval(randomInterval);
//         tags[index].classList.add('highlight');
//         return;
//         }
//         setTimeout(() => {
//             tags[index].classList.remove('highlight');
//         }, 1000);
    
        
//         // console.log('counter' + counter);


//     }, 100);
}